import 'package:flutter/material.dart';
import 'package:my_first_flutter/list_page.dart';

class MyHomePage1 extends StatelessWidget {
  const MyHomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我是Title"),
      ),
      body: const Center(
        child: Text(
          "Hello World",
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0000ff)),
        ),
      ),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  MyHomePage2State createState() {
    return MyHomePage2State();
  }
}

class MyHomePage2State extends State<MyHomePage2> {
  var msg = 'Hellow World';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是Title'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text(msg),
            FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    msg = 'You clicked ME ${DateTime.now().millisecond}';
                  });
                },
                child:
                    const Text("click ME", style: TextStyle(fontSize: 20.0))),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ListPage();
                  }));
                },
                child: const Text('Jump to ListPage')),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/emptypage');
                },
                child: const Text('Jump to EmptyPage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/d');
                },
                child: const Text('Jump to MyHomePage1')),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/c');
              },
              child: const Text('Jump to MyHomePage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/a');
              },
              child: const Text('Jump to MyPage A'),
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/b');
                },
                child: const Text('Jump to MyPage B')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/imagepage');
                },
                child: const Text('Jump to NetWorkImagePage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/localimagepage');
                },
                child: const Text('Jump to LocalImagePage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/layoutPage');
                },
                child: const Text('Jump to MyLayoutPage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/animatePage');
                },
                child: const Text('Jump to AnimatePage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/activityLike');
                },
                child: const Text('Jump to ActivityLikePage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/linearLayoutLike');
                },
                child: const Text('Jump to LinearLayoutLikePage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/frameLayoutLike');
                },
                child: const Text('Jump to FrameLayoutLikePage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/redFlagPage');
                },
                child: const Text('Jump to redFlagPage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/albumPage');
                },
                child: const Text('Jump to AlbumPage')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/officialGuidePage');
                },
                child: const Text('Jump to OfficialGuidePage')),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              'You have clicked the button this many times:',
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

class MyPage extends StatelessWidget {
  String? title;

  MyPage({String title = ""}) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(left: 20.0, right: 30.0),
          ),
          onPressed: () {},
          child: Text('Hello'),
        ),
      ),
    );
  }
}
