import 'package:flutter/material.dart';

import 'my_guide_page_list.dart';
import 'my_guide_page_navigate.dart';

/// 按钮：https://book.flutterchina.club/chapter3/buttons.html
/// 按钮：https://blog.csdn.net/qq_41619796/article/details/115658314
class FlutterGuideWidget extends StatelessWidget {
  const FlutterGuideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      scrollDirection: Axis.vertical,
      //交叉轴子widget的个数
      crossAxisCount: 3,
      padding: const EdgeInsets.all(5),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/d');
            },
            child: const Text('无状态Widget')),
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/c');
          },
          child: const Text('有状态Widget'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/e');
          },
          child: const Text('与Widget交互'),
        ),
        OutlinedButton(
            onPressed: () {
              jumpByRoute(context);
            },
            child: const Text('通过路由跳转')),
        OutlinedButton(
            onPressed: () {
              jumpByObject(context);
            },
            child: const Text('通过创建对象跳转')),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/a');
          },
          child: const Text('跳转:Page A'),
        ),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/b');
            },
            child: const Text('跳转:Page B')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/imagepage');
            },
            child: const Text('加载网络图片')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/localimagepage');
            },
            child: const Text('加载本地图片')),
        MaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MySimpleListPage();
            }));
          },
          child: const Text('使用ListView'),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/animatePage');
            },
            child: const Text('动画')),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepOrangeAccent),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: () {
            Navigator.pushNamed(context, '/linearLayoutLike');
          },
          child: const Text('Flutter中的LinearLayout'),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.redAccent),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: () {
            Navigator.pushNamed(context, '/frameLayoutLike');
          },
          child: const Text('Flutter中的RelativeLayout'),
        ),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/activityLike');
            },
            child: const Text('在Flutter中构建Activity')),
      ],
    );
  }

  void jumpByRoute(BuildContext context) {
    Navigator.pushNamed(context, '/myRouteJumpPage',
        arguments: '朝辞白帝彩云间，千里江陵一日还。');
  }

  void jumpByObject(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyObjectJumpPage(),
        settings: const RouteSettings(
          arguments: '两岸猿声啼不住，轻舟已过万重山。',
        ),
      ),
    );
  }
}
