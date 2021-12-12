import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_first_flutter/official/official_guide_model.dart';

import 'official_guide_custom_my_widget.dart';
import 'official_guide_utils.dart';

/// 图片长廊：https://flutter.cn/docs/development/ui/layout
/// 代码：https://github.com/flutter/flutter/blob/master/dev/integration_tests/flutter_gallery/lib/demo/material/grid_list_demo.dart
/// flutter_staggered_grid_view：https://pub.dev/packages/flutter_staggered_grid_view
/// 使用StaggeredGridView实现瀑布流：https://www.jianshu.com/p/35c1aa49c32b
class GirlGalleryPage extends StatelessWidget {
  const GirlGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Girl Gallery'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const GirlGalleryWidget(),
      ),
    );
  }
}

class GirlGalleryWidget extends StatefulWidget {
  const GirlGalleryWidget({Key? key}) : super(key: key);

  @override
  State createState() {
    return GirlGalleryState();
  }
}

class GirlGalleryState extends State<GirlGalleryWidget> {
  late List<GirlGalleryItem> girls;
  late FavorGirl favorGirl;
  bool isLoadingData = true;
  int dataSource = 0; // 0，代码生成；1，数据库

  void _favorGirl(int index, bool isFavor) {
    setState(() {
      girls[index].isFavor = isFavor;
    });
  }

  /// https://medium.flutterdevs.com/staggered-gridview-in-flutter-661f6667595d
  @override
  Widget build(BuildContext context) {
    return createPage();
  }

  @override
  void initState() {
    super.initState();
    favorGirl = _favorGirl;
    isLoadingData = true;
    loadData();
  }

  @override
  void deactivate() {
    super.deactivate();
    updateData();
  }

  /// 页面关闭时更新数据库
  void updateData() async {
    if (dataSource == 1) {
      for (var element in girls) {
        await updateGirl(element);
      }
    }
  }

  /// 读取数据库中的数据
  void loadData() async {
    var data = await queryGirls();
    if (data.isEmpty) {
      dataSource = 0;
      girls = List.generate(30, (index) => GirlGalleryItem.id(index + 1));
    } else {
      dataSource = 1;
      girls = data;
    }
    setState(() {
      isLoadingData = false;
    });
  }

  Widget createPage() {
    if (isLoadingData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return StaggeredGridView.countBuilder(
        //主轴方向
        scrollDirection: Axis.vertical,
        //交叉轴（横轴）单元格数量
        crossAxisCount: 2,
        //元素总数量
        itemCount: girls.length,
        // 主轴（竖轴）item之间的距离
        mainAxisSpacing: 5.0,
        // 交叉轴（横轴）item之间的距离
        crossAxisSpacing: 5.0,
        itemBuilder: (context, index) {
          return GirlGalleryCard(girlItem: girls[index], favorGirl: favorGirl);
        },
        // 配置主轴和交叉轴的长度比例
        staggeredTileBuilder: (index) {
          // 描述主轴与交叉轴与主轴的比例。第一个参数是交叉轴，第二个参数是主轴。
          return StaggeredTile.count(1, index.isEven ? 1.5 : 1.8);
        },
      );
    }
  }
}
