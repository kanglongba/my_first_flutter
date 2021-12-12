import 'package:flutter/material.dart';

/// 一个页面注册多个路由表，并通过构造函数传递数据。
class MySimplePage extends StatelessWidget {
  String? title;

  MySimplePage({Key? key, String title = ""}) : super(key: key) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: const Center(
        child: Text(
          '''
          和Android中的Activity不同，Flutter中一个页面可以注册多个路由表。
          使用这些注册的路由，会跳转到同一个页面。
          本例中的Title文本数据，是注册路由表时，通过构造函数传递的。
          ''',
          style: TextStyle(
            fontSize: 25,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

/// 通过注册的路由表跳转，通过arguments携带数据
class MyRouteJumpPage extends StatelessWidget {
  const MyRouteJumpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg = receiveData(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由表跳转'),
      ),
      body: Center(
        child: Text(
          "通过注册的路由表跳转，通过arguments携带数据:\n\n" + msg,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }

  // 接收页面传递的数据
  String receiveData(BuildContext context) {
    String _msg = "我什么也没收到";
    if (ModalRoute.of(context)!.settings.arguments != null) {
      _msg = ModalRoute.of(context)!.settings.arguments as String;
    }
    return _msg;
  }
}

/// 通过创建对象跳转，通过arguments携带数据
class MyObjectJumpPage extends StatelessWidget {
  const MyObjectJumpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg = receiveData(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('创建对象跳转'),
      ),
      body: Center(
        child: Text(
          "通过创建对象跳转，通过arguments携带数据:\n\n" + msg,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.indigoAccent,
          ),
        ),
      ),
    );
  }

  // 接收页面传递的数据
  String receiveData(BuildContext context) {
    String _msg = "我什么也没收到";
    if (ModalRoute.of(context)!.settings.arguments != null) {
      _msg = ModalRoute.of(context)!.settings.arguments as String;
    }
    return _msg;
  }
}
