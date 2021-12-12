import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_first_flutter/guide/my_guide_page_list.dart';

/// 无状态页面
class MyStatelessPage extends StatelessWidget {
  const MyStatelessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("无状态Widget"),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "无状态Widget，样子是固定的，不会有任何变化",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0000ff)),
          ),
        ),
      ),
    );
  }
}

/// 有状态页面
class MyStatefulPage extends StatefulWidget {
  const MyStatefulPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyStatefulPage> createState() => _MyStatefulPageState();
}

class _MyStatefulPageState extends State<MyStatefulPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '有状态的Widget，样子会变化，点击下方的按钮:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// 交互页面
class MyInteractionPage extends StatefulWidget {
  const MyInteractionPage({Key? key}) : super(key: key);

  @override
  State createState() {
    return MyInteractionState();
  }
}

class MyInteractionState extends State<MyInteractionPage> {
  String _msg = "看我七十二变";
  var colors = [
    Colors.indigoAccent,
    Colors.lightGreen,
    Colors.orangeAccent,
    Colors.lightBlue,
    Colors.redAccent,
    Colors.deepOrange,
    Colors.purpleAccent,
    Colors.teal,
    Colors.pink,
    Colors.brown
  ];
  int colorIndex = 0;
  int colorIndexLong = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("交互"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            heightFactor: 1.5,
            child: Text(
              _msg,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          FlatButton(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  _msg = '看我七十二变: ${DateTime.now().millisecond}';
                });
              },
              child: const Text("Button交互", style: TextStyle(fontSize: 20.0))),
          Center(
            heightFactor: 1.5,
            child: Text(
              "看我七十二变",
              style: TextStyle(
                color: colors[colorIndex],
                fontSize: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                //左闭右开，[0,9)
                colorIndex = Random().nextInt(10);
              });
            },
            child: Container(
              height: 70,
              width: 260,
              color: Colors.lightBlue,
              child: const Center(
                child: Text(
                  "手势交互:短按",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Center(
            heightFactor: 1.5,
            child: Text(
              "看我七十二变",
              style: TextStyle(
                color: colors[colorIndexLong],
                fontSize: 30,
              ),
            ),
          ),
          GestureDetector(
            onLongPress: () {
              setState(() {
                //左闭右开，[0,9)
                colorIndexLong = Random().nextInt(10);
              });
            },
            child: Container(
              height: 70,
              width: 260,
              color: Colors.lightBlue,
              child: const Center(
                child: Text(
                  "手势交互:长按",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
