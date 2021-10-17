import 'package:flutter/material.dart';

class MyLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyLayoutPage'),
      ),
      body: Column(
        children: [
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row');
              },
              child: Text('横向布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/column');
              },
              child: Text('竖向布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/center');
              },
              child: Text('居中布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/alignPage');
              },
              child: Text('角定位布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/absolutePage');
              },
              child: Text('绝对定位布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flexPage');
              },
              child: Text('流式布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/scrollPage');
              },
              child: Text('滚动布局')),
        ],
      ),
    );
  }
}

class CenterLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('居中布局'),
      ),
      body: Center(
        child: Image.asset('assets/images/girl2.jpeg'),
      ),
    );
  }
}

class RowLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('横向布局'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          Expanded(flex: 1, child: Image.asset('assets/images/girl3.jpeg')),
          Expanded(flex: 1, child: Image.asset('assets/images/girl4.jpeg')),
          Expanded(flex: 1, child: Image.asset('assets/images/girl5.jpeg')),
        ],
      ),
    );
  }
}

class ColumnLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('竖向布局'),
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: Image.asset('assets/images/girl6.jpeg')),
          Expanded(flex: 1, child: Image.asset('assets/images/girl7.jpeg')),
          Expanded(flex: 1, child: Image.asset('assets/images/girl8.jpeg')),
        ],
      ),
    );
  }
}

class AlignLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('角定位布局'),
      ),
      body: Center(
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.lightBlueAccent,
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/girl9.jpeg',
              width: 250,
            ),
          ),
        ),
      ),
    );
  }
}

/**
 * 类似于RelativeLayout
 */
class AbsoluteLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('绝对定位布局'),
      ),
      body: Center(
        child: Stack(
          children: [
            Image.network(
                'https://pic1.zhimg.com/v2-4e5d508698f3fd4f3313dd33e3a02dcd_r.jpg'),
            Positioned(
              child: Image.network(
                'https://pic3.zhimg.com/80/v2-1ae340e838722076247a25401f870b6c_1440w.jpg',
                width: 100,
              ),
              bottom: 40,
              left: 10,
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * Row和Column均继承自Flex
 */
class FlexLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.greenAccent,
              )),
          Expanded(flex: 1, child: Image.asset('assets/images/girl10.jpeg')),
          Expanded(flex: 1, child: Image.asset('assets/images/girl11.jpeg')),
        ],
      ),
    );
  }
}

class ScrollLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动布局'),
      ),
      body: Scrollbar(
        //滚动条
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/girl12.jpeg'),
                Image.asset('assets/images/girl13.jpeg'),
                Image.asset('assets/images/girl14.jpeg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
