import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterPracticeWidget extends StatelessWidget {
  const FlutterPracticeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(5),
      children: [
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/tutorialPage');
            },
            child: const Text('自定义Scaffold')),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.lightGreen[500],
            ),
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: const Text(
              '手势',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          onTap: () {
            Fluttertoast.showToast(msg: '点击');
          },
        ),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/counter');
            },
            child: const Text('封装 - 计数器')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            child: const Text('购物车')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/businessCard');
            },
            child: const Text('名片')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/beautifulGirl');
            },
            child: const Text('玩偶姐姐')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/tabBoxA');
            },
            child: const Text('TabBoxA')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/tabBoxB');
            },
            child: const Text('TabBoxB')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/tabBoxC');
            },
            child: const Text('TabBoxC')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cakeEvaluatePage');
            },
            child: const Text('Cake Evaluate')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/girlGalleryPage');
            },
            child: const Text('Girl Gallery')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/girlDatabasePage');
            },
            child: const Text('Girl Database')),
      ],
    );
  }
}
