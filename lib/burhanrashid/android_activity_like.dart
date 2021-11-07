import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AndroidActivityLikePage extends StatelessWidget {
  const AndroidActivityLikePage({Key? key}) : super(key: key);

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
        color: Colors.red,
      ),
      backgroundColor: Colors.yellowAccent,
    );
  }
}
