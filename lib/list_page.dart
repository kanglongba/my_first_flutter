import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

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
          Navigator.pushNamed(context, '/detail', arguments: data[i]);
        },
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: Center(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty Page'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.only(left: 100, top: 0, right: 0, bottom: 0),
          child: const Text("Hello Container ",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          transform: Matrix4.rotationZ(0.5),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage'),
      ),
      body: Column(
        children: <Widget>[
          const Text('我是Detail页面'),
          Text('id=${args['id']}'),
          Text('title=${args['title']}'),
          Text('subTitle=${args['subtitle']}'),
        ],
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NetWorkImagePage'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: const Image(
          image: NetworkImage(
              "https://pica.zhimg.com/80/v2-17a7d3c0ab72eb0084217efecd1bb7a9_1440w.jpg"),
        ),
      ),
    );
  }
}

class LocalImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocalImagePage'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Image(image: AssetImage("assets/images/girl1.jpeg")),
      ),
    );
  }
}
