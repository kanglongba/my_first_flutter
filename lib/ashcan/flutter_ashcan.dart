import 'package:flutter/material.dart';

class MyAshcanPage extends StatelessWidget {
  const MyAshcanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('回收站'),
      ),
      body: const Center(
        child: Text(
          "空空如也~",
          style: TextStyle(fontSize: 25, color: Colors.black87),
        ),
      ),
    );
  }
}
