import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 系列Github：https://github.com/burhanrashid52/FlutterForAndroidExample/tree/master/lib
class AndroidActivityLikePage extends StatefulWidget {
  const AndroidActivityLikePage({Key? key}) : super(key: key);

  @override
  State createState() {
    return AndroidActivityLikeState();
  }
}

class AndroidActivityLikeState extends State<AndroidActivityLikePage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('创建Activity UI'),
        actions: [
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Shopping Cart');
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Monetization On');
              },
              icon: const Icon(Icons.monetization_on)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {
                Fluttertoast.showToast(msg: 'Item 1');
              },
            ),
            ListTile(
              title: const Text("Item 2"),
              onTap: () {
                Fluttertoast.showToast(msg: 'Item 2');
              },
            ),
            ListTile(
              title: const Text("Item 3"),
              onTap: () {
                Fluttertoast.showToast(msg: 'Item 3');
              },
            ),
            ListTile(
              title: const Text("Item 4"),
              onTap: () {
                Fluttertoast.showToast(msg: 'Item 4');
              },
            ),
            ListTile(
              title: const Text("Item 5"),
              onTap: () {
                Fluttertoast.showToast(msg: 'Item 5');
              },
            ),
            ListTile(
              title: const Text("Exit Drawer"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        currentIndex: _selectedPage,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Fluttertoast.showToast(msg: 'Add');
        },
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        color: Colors.orange,
        child: getWidget(),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }

  Widget getWidget() {
    if (_selectedPage == 0) {
      return const Center(
        child: Text(
          '在Flutter中构建Android中Activity样式的页面:Home',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
    } else {
      return const Center(
        child: Text(
          '在Flutter中构建Android中Activity样式的页面:Search',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
    }
  }
}
