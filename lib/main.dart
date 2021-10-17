import 'package:flutter/material.dart';
import 'package:my_first_flutter/list_page.dart';
import 'package:my_first_flutter/my_animate_page.dart';
import 'package:my_first_flutter/my_home_page.dart';
import 'package:my_first_flutter/my_layout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage2(),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => MyPage(title: 'page A'),
        '/b': (BuildContext context) => MyPage(title: 'page B'),
        '/c': (BuildContext context) => const MyHomePage(title: 'MyHomePage'),
        '/d': (BuildContext context) => const MyHomePage1(),
        '/imagepage': (BuildContext context) => ImagePage(),
        '/localimagepage': (BuildContext context) => LocalImagePage(),
        '/emptypage': (BuildContext context) {
          return EmptyPage();
        },
        '/detail': (context) {
          return DetailPage();
        },
        '/column': (context) => ColumnLayoutPage(),
        '/center': (context) => CenterLayoutPage(),
        '/row': (context) => RowLayoutPage(),
        '/layoutPage': (context) => MyLayoutPage(),
        '/alignPage': (context) => AlignLayoutPage(),
        '/absolutePage': (context) => AbsoluteLayoutPage(),
        '/flexPage': (context) => FlexLayoutPage(),
        '/scrollPage': (context) => ScrollLayoutPage(),
        '/animatePage': (context) => AnimatePage(),
        '/alphaPage': (context) => AlphaAnimation(),
        '/scalePage': (context) => ScaleAnimation(),
      },
    );
  }
}
