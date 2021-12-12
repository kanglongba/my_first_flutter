import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_first_flutter/foundation/flutter_foundation.dart';
import 'package:my_first_flutter/guide/flutter_guide.dart';
import 'package:my_first_flutter/official/flutter_practice.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State createState() {
    return AppHomeState();
  }
}

/// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
class AppHomeState extends State<AppHomePage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Head First Flutter"),
        actions: [
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "Flutter学习工程");
              },
              icon: const Icon(Icons.info))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar.jpeg"),
                    backgroundColor: Colors.transparent,
                    radius: 45,
                  ),
                  //填充间隙
                  Spacer(),
                  Text(
                    "史上最牛逼的长线投资",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text(
                "回收站",
                style: TextStyle(fontSize: 15),
              ),
              subtitle: const Text("废弃的、不方便归类的demo"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.arrow_back,
              ),
              title: const Text(
                "退出",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.emoji_objects), label: '基础'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports), label: '入门'),
          BottomNavigationBarItem(icon: Icon(Icons.construction), label: '练习'),
          BottomNavigationBarItem(
              icon: Icon(Icons.self_improvement), label: '实践'),
        ],
      ),
      body: Container(
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    switch (_selectedIndex) {
      case 0:
        return const FlutterFoundationWidget();
      case 1:
        return const FlutterGuideWidget();
      case 2:
        return const FlutterPracticeWidget();
      default:
        return const FlutterFoundationWidget();
    }
  }
}
