import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_first_flutter/guide/my_guide_page.dart';
import 'package:my_first_flutter/guide/my_guide_page_activity.dart';
import 'package:my_first_flutter/guide/my_guide_page_animate.dart';
import 'package:my_first_flutter/guide/my_guide_page_linearlayout.dart';
import 'package:my_first_flutter/guide/my_guide_page_list.dart';
import 'package:my_first_flutter/guide/my_guide_page_relativeLayout.dart';
import 'package:my_first_flutter/project/album_wallPaper_page.dart';
import 'package:my_first_flutter/project/common_layout_page.dart';

import 'ashcan/flutter_ashcan.dart';
import 'foundation/foundation_webview_page.dart';
import 'guide/my_guide_page_image.dart';
import 'guide/my_guide_page_navigate.dart';
import 'home/app_home_page.dart';
import 'official/official_guide_cake_evaluate.dart';
import 'official/official_guide_demo.dart';
import 'official/official_guide_doll.dart';
import 'official/official_guide_girl_db.dart';
import 'official/official_guide_girl_gallery.dart';
import 'official/official_guide_tapbox.dart';
import 'project/red_flag_page.dart';

void main() {
  //Flutter 自带的界面调试工具，可在页面显示布局
  debugPaintSizeEnabled = false;
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  // database required.
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const AppHomePage(),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => MySimplePage(title: 'page A'),
        '/b': (BuildContext context) => MySimplePage(title: 'page B'),
        '/c': (BuildContext context) =>
            const MyStatefulPage(title: '有状态Widget'),
        '/d': (BuildContext context) => const MyStatelessPage(),
        '/e': (BuildContext context) => const MyInteractionPage(),
        '/myRouteJumpPage': (BuildContext context) => const MyRouteJumpPage(),
        '/imagepage': (BuildContext context) => const NetworkImagePage(),
        '/localimagepage': (BuildContext context) => const LocalImagePage(),
        '/emptypage': (BuildContext context) {
          return MyTransformPage();
        },
        '/detail': (context) {
          return const MySimpleDetailPage();
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
        '/cardPage': (context) => CardPageLayout(),
        '/gridViewPage': (context) => GridViewPage(),
        '/listViewPage': (context) => ListViewPage(),
        '/animatePage': (context) => const MyAnimatePage(),
        '/alphaPage': (context) => const AlphaAnimation(),
        '/scalePage': (context) => ScaleAnimation(),
        '/activityLike': (context) => const AndroidActivityLikePage(),
        '/linearLayoutLike': (context) => AndroidLinearLayoutLikePage(),
        '/frameLayoutLike': (context) => AndroidFrameLayoutLikePage(),
        '/albumPage': (context) => AlbumPage(),
        '/wallPaperPage': (context) => const WallPaperPage(),
        '/tutorialPage': (context) => const TutorialHome(),
        '/counter': (context) => const Counter(),
        '/cart': (context) => ShoppingCartPage(),
        '/businessCard': (context) => const MyBusinessCardPage(),
        '/beautifulGirl': (context) => const BeautifulGirlDetailPage(),
        '/tabBoxA': (context) => const TabBoxAPage(),
        '/tabBoxB': (context) => const TabBoxBPage(),
        '/tabBoxC': (context) => const TabBoxCPage(),
        '/cakeEvaluatePage': (context) => const CakeEvaluatePage(),
        '/girlGalleryPage': (context) => const GirlGalleryPage(),
        '/girlDatabasePage': (context) => const GirlDatabasePage(),
        '/redFlagPage': (context) => const RedFlagPage(),
        '/foundationWebViewPage': (context) => const FoundationWebViewPage(),
        '/appHomePage': (context) => const AppHomePage(),
        '/ashcanPage': (context) => const MyAshcanPage(),
        '/decoratedBoxPage': (context) => const DecoratedBoxLayoutPage(),
        '/transformPage': (context) => const TransformLayoutPage(),
      },
    );
  }
}
