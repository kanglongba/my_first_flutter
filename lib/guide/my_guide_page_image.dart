import 'package:flutter/material.dart';

/// 图片的用法：https://medium.com/flutter-community/how-to-use-images-in-flutter-to-the-point-5542b4412a53
class NetworkImagePage extends StatelessWidget {
  const NetworkImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络图片'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        // 除了构造函数，还可以使用命令构造函数：Image.network
        child: const Image(
          height: double.infinity,
          width: double.infinity,
          filterQuality: FilterQuality.high,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              "https://pic3.zhimg.com/80/v2-bc0eab38bca051e1a60c2fe28cfcad25_1440w.jpg"),
        ),
      ),
    );
  }
}

class LocalImagePage extends StatelessWidget {
  const LocalImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('本地图片'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.orangeAccent,
        // 除了构造函数，还可以使用命令构造函数：Image.asset
        child: const Image(
            height: double.infinity,
            width: double.infinity,
            filterQuality: FilterQuality.high,
            fit: BoxFit.fitHeight,
            image: AssetImage("assets/images/girl35.jpeg")),
      ),
    );
  }
}
