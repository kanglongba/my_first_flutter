import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_flutter/official/official_guide_model.dart';

/// 评价蛋糕：https://flutter.cn/docs/development/ui/layout
/// 代码：https://github.com/cfug/flutter.cn/blob/master/examples/layout/pavlova/lib/main.dart
class CakeEvaluatePage extends StatefulWidget {
  const CakeEvaluatePage({Key? key}) : super(key: key);

  @override
  State createState() {
    return CakeEvaluateState();
  }
}

class CakeEvaluateState extends State<CakeEvaluatePage> {
  late GirlGalleryItem girlItem;

  @override
  Widget build(BuildContext context) {
    // 接收页面传递的数据
    if (ModalRoute.of(context)!.settings.arguments != null) {
      girlItem = ModalRoute.of(context)!.settings.arguments as GirlGalleryItem;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('大众点评'),
      ),
      body: Row(
        children: [
          Image.asset(girlItem.imgSrc, fit: BoxFit.cover),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 20, right: 10, bottom: 15),
                child: Text(
                  girlItem.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  child: Text(
                    girlItem.desc,
                    style: const TextStyle(
                      color: Colors.black38,
                      fontFamily: 'Georgia',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  getStarWidget(1),
                  getStarWidget(2),
                  getStarWidget(3),
                  getStarWidget(4),
                  getStarWidget(5),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    '${girlItem.reviewers} Reviews',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
              iconList,
            ],
          )),
        ],
      ),
    );
  }

  // #docregion iconList
  static const descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 15,
  );

  // DefaultTextStyle.merge() allows you to create a default text
  // style that is inherited by its child and all subsequent children.
  final iconList = DefaultTextStyle.merge(
    style: descTextStyle,
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.kitchen, color: Colors.green[500]),
              const SizedBox(
                height: 5,
              ),
              const Text('PREP:'),
              const SizedBox(
                height: 5,
              ),
              const Text('25 min'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.timer, color: Colors.green[500]),
              const SizedBox(
                height: 5,
              ),
              const Text('COOK:'),
              const SizedBox(
                height: 5,
              ),
              const Text('1 hr'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.restaurant, color: Colors.green[500]),
              const SizedBox(
                height: 5,
              ),
              const Text('FEEDS:'),
              const SizedBox(
                height: 5,
              ),
              const Text('4-6'),
            ],
          ),
        ],
      ),
    ),
  );

  GestureDetector getStarWidget(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          girlItem.rateScore = index;
        });
      },
      child: getStarIcon(index),
    );
  }

  Icon getStarIcon(int index) {
    if (index <= girlItem.rateScore) {
      return const Icon(
        Icons.star,
        color: Colors.redAccent,
      );
    } else {
      return const Icon(
        Icons.star_border,
        color: Colors.redAccent,
      );
    }
  }

  /// 强制某个页面横屏：https://zhuanlan.zhihu.com/p/302687896
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //全屏时旋转方向
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    // 初始化一个数据
    girlItem = GirlGalleryItem.id(27);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      //全屏时旋转方向
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }
}
