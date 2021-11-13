import 'package:flutter/material.dart';
import 'package:my_first_flutter/photo/photo_list_response.dart';

import 'api_request_utils.dart';

/// 教你上拉加载：https://www.kindacode.com/article/flutter-listview-pagination-load-more/
/// 创建拥有不同列表项的列表：https://flutter.cn/docs/cookbook/lists/mixed-list
class AlbumPage extends StatefulWidget {
  @override
  State createState() {
    return AlbumStateList();
  }
}

class AlbumStateList extends State<AlbumPage> {
  int pageIndex = 1;
  List<Photo> photoList = [];
  late ScrollController _controller;
  late void Function() _scrollListener;
  ALBUM_STATUS_TYPE status = ALBUM_STATUS_TYPE.init;

  @override
  void initState() {
    super.initState();
    _scrollListener = () {
      // 1.滑动到底部时，触发加载更多
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMore();
      }
    };
    _controller = ScrollController()..addListener(_scrollListener1);
    _refresh();
  }

  /// 加载更多的条件：https://stackoverflow.com/questions/49508322/flutter-listview-lazy-loading
  /// 2.提前加载更多
  void _scrollListener1() {
    if (_controller.position.extentAfter < 200) {
      _loadMore();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_scrollListener1);
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
        displacement: 20,
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
      padding: const EdgeInsets.all(30),
      child: Image.network(photoList[index].cover!),
    );
  }

  Future<void> _loadMore() async {
    if (status == ALBUM_STATUS_TYPE.noMorePhoto) {
      return;
    }
    setState(() {
      status = ALBUM_STATUS_TYPE.loadingMore;
    });
    AlbumResponse response = await fetchAlbum(page: pageIndex);
    setState(() {
      if (response.code == 1) {
        if (response.data != null && response.data!.isNotEmpty) {
          pageIndex++;
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

/// Flutter 提供的 FutureBuilder 组件，专门用来处理异步数据源
/// https://flutter.cn/docs/cookbook/networking/fetch-data
class AlbumStateSimple extends State<AlbumPage> {
  late Future<AlbumResponse> albumFuture;

  @override
  void initState() {
    super.initState();
    albumFuture = fetchAlbum(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('相册'),
      ),
      body: Center(
        child: FutureBuilder<AlbumResponse>(
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
          },
        ),
      ),
    );
  }
}