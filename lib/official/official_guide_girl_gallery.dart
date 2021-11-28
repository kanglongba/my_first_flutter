import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_first_flutter/official/official_guide_model.dart';

import 'custom_my_widget.dart';

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

  void _favorGirl(int index, bool isFavor) {
    setState(() {
      girls[index].isFavor = isFavor;
    });
  }

  /// https://medium.flutterdevs.com/staggered-gridview-in-flutter-661f6667595d
  @override
  Widget build(BuildContext context) {
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
      // 配置主轴和交叉轴的长度
      staggeredTileBuilder: (index) {
        // 描述主轴与交叉轴与主轴的比例。第一个参数是交叉轴，第二个参数是主轴。
        return StaggeredTile.count(1, index.isEven ? 1.5 : 1.8);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    girls = List.generate(30, (index) => GirlGalleryItem.id(index + 1));
    favorGirl = _favorGirl;
  }
}
