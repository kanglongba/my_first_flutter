import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String _title;

  const MyAppBar(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(color: Colors.blue[500]),
      height: 56,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const IconButton(
              onPressed: null,
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu'),
          Expanded(
            child: Text(
              _title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const MyScaffold({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(title),
          Expanded(child: body),
        ],
      ),
    );
  }
}
