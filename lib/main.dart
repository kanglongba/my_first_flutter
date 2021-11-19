import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_first_flutter/burhanrashid/android_activity_like.dart';
import 'package:my_first_flutter/burhanrashid/android_framelayout_like.dart';
import 'package:my_first_flutter/burhanrashid/android_linearlayout_like.dart';
import 'package:my_first_flutter/list_page.dart';
import 'package:my_first_flutter/my_animate_page.dart';
import 'package:my_first_flutter/my_home_page.dart';
import 'package:my_first_flutter/my_layout_page.dart';
import 'package:my_first_flutter/photo/photo_list_page.dart';

void main() {
  //Flutter 自带的界面调试工具，可在页面显示 Widget 框架
  debugPaintSizeEnabled = true;
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
        '/absolutePage': (context) => StackLayoutPage(),
        '/flexPage': (context) => FlexLayoutPage(),
        '/scrollPage': (context) => ScrollLayoutPage(),
        '/wrapPage': (context) => WrapLayoutPage(),
        '/indexedStackPage': (context) => IndexedStackLayoutPage(),
        '/aspectRatioPage': (context) => AspectRatioLayoutPage(),
        '/containerPage': (context) => ContainerLayoutPage(),
        '/paddingPage': (context) => PaddingLayoutPage(),
        '/positionedPage': (context) => PositionedLayoutPage(),
        '/sizedboxPage': (context) => SizedBoxLayoutPage(),
        '/flexiblePage': (context) => FlexiblePageLayout(),
        '/animatePage': (context) => AnimatePage(),
        '/alphaPage': (context) => AlphaAnimation(),
        '/scalePage': (context) => ScaleAnimation(),
        '/activityLike': (context) => const AndroidActivityLikePage(),
        '/linearLayoutLike': (context) => AndroidLinearLayoutLikePage(),
        '/frameLayoutLike': (context) => AndroidFrameLayoutLikePage(),
        '/albumPage': (context) => AlbumPage(),
      },
    );
  }
}
