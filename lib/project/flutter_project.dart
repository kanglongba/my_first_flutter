import 'package:flutter/material.dart';

class FlutterProjectWidget extends StatelessWidget {
  const FlutterProjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(5),
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/layoutPage');
            },
            child: const Text('构建UI的常用布局')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/redFlagPage');
            },
            child: const Text('自绘Widget')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/albumPage');
            },
            child: const Text('网络相册')),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wallPaperPage');
            },
            child: const Text('网络墙纸')),
      ],
    );
  }
}
