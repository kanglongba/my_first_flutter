import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_first_flutter/project/album_response.dart';
import 'package:my_first_flutter/project/wall_paper_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_request_utils.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State createState() {
    return AlbumState();
  }
}

/// 调用相册接口，显示相册，具有下载刷新和上拉加载功能
/// 教你上拉加载：https://www.kindacode.com/article/flutter-listview-pagination-load-more/
/// 创建拥有不同列表项的列表：https://flutter.cn/docs/cookbook/lists/mixed-list
class AlbumState extends State<AlbumPage> {
  int pageIndex = 1;
  List<Photo> photoList = [];
  late ScrollController _controller;
  late void Function() _scrollListener1;
  ALBUM_STATUS_TYPE status = ALBUM_STATUS_TYPE.init;

  @override
  void initState() {
    super.initState();
    _scrollListener1 = () {
      // 1.滑动到底部时，触发加载更多
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMore();
      }
    };
    _controller = ScrollController()
      ..addListener(_scrollListener1);
      // ..addListener(_scrollListener2);
    _refresh();
  }

  /// 加载更多的条件：https://stackoverflow.com/questions/49508322/flutter-listview-lazy-loading
  /// 2.还没不到底部时，提前加载更多
  void _scrollListener2() {
    if (_controller.position.extentAfter < 200) {
      _loadMore();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_scrollListener1)
      ..removeListener(_scrollListener2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('相册'),
      ),
      body: RefreshIndicator(
        child: createBodyWidget(),
        onRefresh: _refresh,
        //指示器显示时距顶部位置
        displacement: 5,
        //指示器颜色，默认ThemeData.accentColor
        color: Colors.white,
        //指示器背景颜色，默认ThemeData.canvasColor
        backgroundColor: Colors.blue,
        //是否应处理滚动通知的检查（是否通知下拉刷新动作）
        notificationPredicate: defaultScrollNotificationPredicate,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.jumpTo(0);
        },
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  Widget createBodyWidget() {
    if (status == ALBUM_STATUS_TYPE.init) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (status == ALBUM_STATUS_TYPE.emptyAlbum) {
      return const Center(
        child: Text('空相册'),
      );
    } else if (status == ALBUM_STATUS_TYPE.refreshError) {
      return const Center(
        child: Text('接口失败，请重试'),
      );
    } else {
      return createListWidget();
    }
  }

  Widget createListWidget() {
    return ListView.builder(
      // 列表项的数量，如果为null，则为无限列表。
      itemCount: photoList.length + 1,
      // physics参数控制滚动到物理特性
      physics: const BouncingScrollPhysics(),
      // 通过scrollDirection参数控制滚动方向，默认是垂直方向
      scrollDirection: Axis.vertical,
      itemBuilder: createItemWidget,
      controller: _controller,
    );
  }

  Widget createItemWidget(BuildContext context, int index) {
    if (index == photoList.length) {
      if (status == ALBUM_STATUS_TYPE.noMorePhoto) {
        return const Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Text('没有更多了'),
          ),
        );
      } else if (status == ALBUM_STATUS_TYPE.loadMoreError) {
        return const Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Text('加载失败，请重试'),
          ),
        );
      } else {
        return const Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    } else {
      return createDetailItem(context, index);
    }
  }

  /// 详细的 item
  Widget createDetailItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 5,
        shadowColor: Colors.grey,
        child: AspectRatio(
          aspectRatio: 9.0 / 12.0,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                photoList[index].cover!,
                fit: BoxFit.cover,
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 20, right: 20, bottom: 20),
                    color: Colors.white70,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      photoList[index].setname!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  /// 过滤列表
  /// 1.[Dart数组(List)基本属性与操作笔记](https://juejin.cn/post/6844904190129471502)
  /// 2.[Dart -- List](https://www.jianshu.com/p/a296353d8c93)
  void filterList(List<Photo> photos) {
    photos.retainWhere((element) {
      return photoList.every((photo) {
        return photo.setid != element.setid;
      });
    });
  }

  Future<void> _loadMore() async {
    if (status == ALBUM_STATUS_TYPE.noMorePhoto) {
      return;
    }
    setState(() {
      status = ALBUM_STATUS_TYPE.loadingMore;
    });
    if (kDebugMode) {
      print("pageIndex=$pageIndex");
    }
    AlbumResponse response = await fetchAlbum(page: pageIndex);
    setState(() {
      if (response.code == 1) {
        if (response.data != null && response.data!.isNotEmpty) {
          pageIndex++;
          //接口返回的重复数据太多，需要过滤。根据Photo.setid字段过滤。
          filterList(response.data!);
          photoList.addAll(response.data!);
          status = ALBUM_STATUS_TYPE.loadMoreOK;
        } else {
          status = ALBUM_STATUS_TYPE.noMorePhoto;
        }
      } else {
        status = ALBUM_STATUS_TYPE.loadMoreError;
      }
    });
  }

  Future<void> _refresh() async {
    pageIndex = 1;
    AlbumResponse response = await fetchAlbum(page: pageIndex);
    setState(() {
      photoList.clear();
      if (response.code == 1) {
        if (response.data != null && response.data!.isNotEmpty) {
          pageIndex++;
          photoList.addAll(response.data!);
          status = ALBUM_STATUS_TYPE.refreshOK;
        } else {
          status = ALBUM_STATUS_TYPE.emptyAlbum;
        }
      } else {
        status = ALBUM_STATUS_TYPE.refreshError;
      }
    });
  }
}

class WallPaperPage extends StatefulWidget {
  const WallPaperPage({Key? key}) : super(key: key);

  @override
  State createState() {
    return WallPaperState();
  }
}

/// 调用壁纸接口，显示壁纸，一次仅显示一张
class WallPaperState extends State<WallPaperPage> {
  static const wallPaperSourceKey = 'wallPaperSource';
  late Future<AlbumResponse> albumFuture;
  late WallPaper wallPaper;
  bool _isLoading = true;
  late WallPaperSource source;

  @override
  void initState() {
    super.initState();
    albumFuture = fetchAlbum(page: 1);
    getWallPaperSource().then((value) {
      source = value;
      refreshWallPaper();
    });
  }

  /// 页面声明周期：https://www.jianshu.com/p/0b41871ff8d9
  @override
  void dispose() {
    super.dispose();
    //保存配置到SharedPreferences中
    saveWallPaperSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('墙纸'),
        actions: [
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: '切换2014年网红');
                setState(() {
                  _isLoading = true;
                });
                source = WallPaperSource.old;
                refreshWallPaper();
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: '切换当代网红');
                setState(() {
                  _isLoading = true;
                });
                source = WallPaperSource.current;
                refreshWallPaper();
              },
              icon: const Icon(Icons.monetization_on)),
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: '切换蓓蓓梅');
                setState(() {
                  _isLoading = true;
                });
                source = WallPaperSource.beibei;
                refreshWallPaper();
              },
              icon: const Icon(Icons.phone_android)),
        ],
      ),
      body: Center(
        child: createWallPaper(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          refreshWallPaper();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  ///教你用 Flutter 提供的 FutureBuilder 组件，专门用来处理异步数据源
  ///https://flutter.cn/docs/cookbook/networking/fetch-data
  Widget createAlbum() {
    return FutureBuilder<AlbumResponse>(
        future: albumFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.code == 1) {
              if (snapshot.data?.data != null &&
                  snapshot.data!.data!.isNotEmpty) {
                return Image.network(snapshot.data!.data!.first.cover!);
              } else {
                return const Text('没有相片');
              }
            } else {
              var title = snapshot.data?.msg ?? 'Error';
              return Text(title);
            }
          }
          return const CircularProgressIndicator();
        });
  }

  ///自己实现异步加载数据
  Widget createWallPaper() {
    if (_isLoading) {
      return const CircularProgressIndicator();
    }
    if (wallPaper.url.isNotEmpty) {
      return Image.network(wallPaper.url);
    } else {
      return Image.memory(wallPaper.bytes);
    }
  }

  void refreshWallPaper() async {
    wallPaper = await fetchWallPaper(getUrl());
    setState(() {
      _isLoading = false;
    });
  }

  String getUrl() {
    switch (source) {
      case WallPaperSource.old:
        return mm;
      case WallPaperSource.current:
        return mmnew;
      case WallPaperSource.beibei:
        return mmbeibei;
    }
  }

  Future<WallPaperSource> getWallPaperSource() async {
    //建立文件缓存
    final prefs = await SharedPreferences.getInstance();
    String paperSource = prefs.getString(wallPaperSourceKey) ?? 'old';
    switch (paperSource) {
      case 'old':
        return WallPaperSource.old;
      case 'current':
        return WallPaperSource.current;
      case 'beibei':
        return WallPaperSource.beibei;
      default:
        return WallPaperSource.old;
    }
  }

  Future<void> saveWallPaperSource() async {
    //建立文件缓存
    final prefs = await SharedPreferences.getInstance();
    String getSourceName() {
      switch (source) {
        case WallPaperSource.old:
          return 'old';
        case WallPaperSource.current:
          return 'current';
        case WallPaperSource.beibei:
          return 'beibei';
      }
    }

    prefs.setString(wallPaperSourceKey, getSourceName());
  }
}
