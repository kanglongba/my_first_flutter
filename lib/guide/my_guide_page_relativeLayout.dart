import 'package:flutter/material.dart';

class AndroidFrameLayoutLikePage extends StatelessWidget {
  const AndroidFrameLayoutLikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stack就是Flutter中的RelativeLayout',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: ListView(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart, // 相当于Android中的 gravity
              children: [
                Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.red,
                ),
                Container(
                  height: 150.0,
                  width: 150.0,
                  color: Colors.blue,
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.green,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.yellow,
                ),
              ],
            ),
            Container(
              color: Colors.grey,
              height: 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.red,
                ),
                Container(
                  height: 150.0,
                  width: 150.0,
                  color: Colors.blue,
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.green,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.yellow,
                ),
              ],
            ),
            Container(
              color: Colors.grey,
              height: 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.red,
                ),
                Container(
                  height: 150.0,
                  width: 150.0,
                  color: Colors.blue,
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.green,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.yellow,
                ),
              ],
            ),
            Container(
              color: Colors.grey,
              height: 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
            Container(
              width: double.infinity, // 宽度撑满
              height: 400,
              margin: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Align(
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      color: Colors.red,
                    ),
                    // 相当于 Android 中的 layout_gravity，需要用 Align 包裹子Widget
                    alignment: AlignmentDirectional.topStart,
                  ),
                  Align(
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      color: Colors.blue,
                    ),
                    alignment: AlignmentDirectional.topEnd,
                  ),
                  Align(
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.green,
                    ),
                    alignment: AlignmentDirectional.bottomStart,
                  ),
                  Align(
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.yellow,
                    ),
                    alignment: AlignmentDirectional.bottomEnd,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              height: 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
            Container(
              width: double.infinity, // 宽度撑满
              height: 400,
              margin: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      color: Colors.red,
                    ),
                    // 相当于 RelativeLayout 中的 位置参数，需要用 Positioned 包裹子Widget
                    top: 10.0, // 相对于父布局的位置
                    left: 10.0, // 相对于父布局的位置
                  ),
                  Positioned(
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      color: Colors.blue,
                    ),
                    top: 30.0, // 距离父布局上边界 30
                    right: 50.0, // 距离父布局右边界 50
                  ),
                  Positioned(
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.green,
                    ),
                    bottom: 100.0,
                    left: 30.0,
                  ),
                  Positioned(
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.yellow,
                    ),
                    bottom: 50.0,
                    right: 100.0,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              height: 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
          ],
        ),
      ),
    );
  }
}
