import 'package:flutter/material.dart';

/// ListView是一种很重要的布局，绝大多数页面都是由ListView构建的。
/// https://api.flutter.dev/flutter/widgets/ListView-class.html
/// https://book.flutterchina.club/chapter6/listview.html#_6-3-listview
class MySimpleListPage extends StatelessWidget {
  const MySimpleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    var data = <Map>[];
    for (int i = 1; i <= 100; i++) {
      data.add({'id': i, 'title': '主Title $i', 'subtitle': '副Title $i'});
      list.add(ListTile(
        title: Text('主Title $i', style: const TextStyle(fontSize: 18.0)),
        subtitle: Text('副Title $i'),
        leading: const Icon(Icons.fastfood, color: Colors.orange),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: data[i-1]);
        },
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表页'),
      ),
      body: Center(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}

class MySimpleDetailPage extends StatelessWidget {
  const MySimpleDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text('详情页'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // 用来将Column的宽度撑满
            const SizedBox(
              width: double.maxFinite,
              height: 50,
            ),
            const Text(
              '我是Detail页面',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'id=${args['id']}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'title=${args['title']}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'subTitle=${args['subtitle']}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
