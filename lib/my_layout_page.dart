import 'package:flutter/material.dart';

/// 1.[Flutter 基础 | 控件 & 布局（一）](https://juejin.cn/post/7030569229459914766)
/// 2.[Flutter 9种布局组件](https://juejin.cn/post/6919653632468221966)
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
                Navigator.pushNamed(context, '/flexPage');
              },
              child: Text('弹性布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row');
              },
              child: Text('线性布局-水平')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/column');
              },
              child: Text('线性布局-垂直')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/center');
              },
              child: Text('居中布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/alignPage');
              },
              child: Text('对齐布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/absolutePage');
              },
              child: Text('层叠布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/indexedStackPage');
              },
              child: Text('层叠布局2')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wrapPage');
              },
              child: Text('流式布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/scrollPage');
              },
              child: Text('滚动布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aspectRatioPage');
              },
              child: Text('比例布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/containerPage');
              },
              child: Text('容器布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/paddingPage');
              },
              child: Text('填充布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/positionedPage');
              },
              child: Text('位置布局')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sizedboxPage');
              },
              child: Text('尺寸限制容器布局')),
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
      body: Container(
        color: Colors.lightBlue,
        child: Center(
          widthFactor: 2,
          heightFactor: 2,
          child: Image.asset('assets/images/girl2.jpeg'),
        ),
      ),
    );
  }
}

class PaddingLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('填充布局'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 10, top: 15, right: 20, bottom: 25),
              child: Container(
                color: Colors.green,
                width: double.infinity,
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 25, 70),
              child: Container(
                color: Colors.orange,
                width: double.infinity,
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 90, horizontal: 40),
              child: Container(
                color: Colors.red,
                width: double.infinity,
                height: 100,
              ),
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
        title: Text('弹性布局'),
      ),
      body: Flex(
        direction: Axis.horizontal, // 方向
        children: [
          // 看注释，Expanded只能配置Row、Column、Flex使用
          Expanded(
              flex: 1, // 比例
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

class RowLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('线性布局-水平'),
      ),
      body: Row(
        //表示子Widgets在Row所占用的水平空间内对齐方式
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //表示Row在主轴(水平)方向占用的空间
        mainAxisSize: MainAxisSize.max,
        //表示子Widgets在纵轴方向的对齐方式
        crossAxisAlignment: CrossAxisAlignment.center,
        //文本基线对齐方式
        textBaseline: TextBaseline.alphabetic,
        verticalDirection: VerticalDirection.down,
        children: [
          // 看注释，Expanded只能配置Row、Column、Flex使用
          Expanded(
              flex: 1, //弹性系数
              child: Image.asset('assets/images/girl3.jpeg')),
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
        title: Text('线性布局-垂直'),
      ),
      body: Column(
        //属性同Row，它们都继承自Flex
        children: [
          // 看注释，Expanded只能配置Row、Column、Flex使用
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
        title: Text('对齐布局'),
      ),
      body: Center(
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.lightBlueAccent,
          child: Align(
            widthFactor: 3, //宽度因子，如果设置的话，Align的宽度就是child的宽度乘以这个值，不能为负数
            heightFactor: 2, //高度因子，如果设置的话，Align的高度就是child的高度乘以这个值，不能为负数
            alignment: Alignment.centerRight, //对齐方式
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
class StackLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('层叠布局'),
      ),
      body: Center(
        child: Stack(
          // 子Widget的对其方式，分为使用了Positioned和未使用Positioned定义两种情况
          alignment: AlignmentDirectional.topStart,
          // 用来决定没有Positioned方式时候子Widget的大小，StackFit.loose 指的是子Widget 多大就多大，StackFit.expand使子Widget的大小和父组件一样大
          fit: StackFit.loose,
          // 指子Widget 超出Stack时候如何显示，默认为Clip.hardEdge，表示会被裁剪
          clipBehavior: Clip.hardEdge,

          children: [
            Image.network(
                'https://pic1.zhimg.com/v2-4e5d508698f3fd4f3313dd33e3a02dcd_r.jpg'),
            Positioned(
              // Positioned 可以控制子 Widget 到父容器四个边的距离。还可以设置子Widget的宽度和高度。
              child: Image.network(
                'https://pic3.zhimg.com/80/v2-1ae340e838722076247a25401f870b6c_1440w.jpg',
                width: 100,
              ),
              bottom: 40,
              left: 10,
            ),
            Container(
              //没有用 Positioned 嵌套起来的子 Widget，使用 Stack 的 alignment 属性来控制自身在父容器里的位置
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

/// 流式布局
class WrapLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('流式布局'),
        ),
        body: Wrap(
          direction: Axis.horizontal,
          //主轴的方向
          alignment: WrapAlignment.start,
          //主轴上的对齐方式
          crossAxisAlignment: WrapCrossAlignment.start,
          //交叉轴的对齐方式
          runAlignment: WrapAlignment.start,
          //交叉轴上的对齐方式
          spacing: 30,
          //主轴上的间距
          runSpacing: 10,
          //交叉轴上的间距
          children: List.generate(10, (i) {
            double w = 50.0 + 10 * i;
            return Container(
              color: Colors.primaries[i],
              height: 50,
              width: w,
              alignment: Alignment.center,
              child: Text('$i'),
            );
          }),
        ));
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

class IndexedStackLayoutPage extends StatefulWidget {
  @override
  _IndexedStackLayoutPageState createState() => _IndexedStackLayoutPageState();
}

class _IndexedStackLayoutPageState extends State<IndexedStackLayoutPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('层叠布局2'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          _buildIndexedStack(),
          SizedBox(
            height: 30,
          ),
          _buildRow(),
        ],
      ),
    );
  }

  _buildIndexedStack() {
    return IndexedStack(
      index: _index,
      children: <Widget>[
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.red,
            alignment: Alignment.center,
            child: Text('1'),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.green,
            alignment: Alignment.center,
            child: Text('2'),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Text('3'),
          ),
        ),
      ],
    );
  }

  _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('1'),
          onPressed: () {
            setState(() {
              _index = 0;
            });
          },
        ),
        RaisedButton(
          child: Text('2'),
          onPressed: () {
            setState(() {
              _index = 1;
            });
          },
        ),
        RaisedButton(
          child: Text('3'),
          onPressed: () {
            setState(() {
              _index = 2;
            });
          },
        ),
      ],
    );
  }
}

class AspectRatioLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('比例布局'),
      ),
      body: Container(
        width: 400,
        height: 400,
        color: Colors.orange,
        alignment: Alignment.center,
        child: AspectRatio(
          // 宽度 与 高度的 比
          aspectRatio: 16.0 / 9.0,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class ContainerLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('容器布局'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        color: Colors.purple,
        constraints: BoxConstraints.expand(),
        child: Container(
          //child对齐方式
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(10),
          //背景色，不能和decoration同时使用
          //color: Colors.lightBlue,
          //装饰，修饰Container自己。不会改变大小，只是装装样子
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
            gradient: RadialGradient(
              colors: [Colors.green, Colors.lightBlue],
              center: Alignment.center,
              radius: 0.7,
            ),
          ),
          //约束盒，约束Container的大小，比width和height的优先级更高
          constraints: BoxConstraints.loose(Size.fromRadius(120)),
          //Container的宽度
          width: 300,
          //Container的高度
          height: 500,
          margin: EdgeInsets.all(20),
          //容器变换
          transform: Matrix4.rotationX(0.5),
          child: const Text('容器布局'),
        ),
      ),
    );
  }
}

//位置布局，只能配置Stack使用
class PositionedLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('位置布局'),
      ),
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
              right: 50,
              bottom: 10,
              width: 280,
              //子Widget的宽度
              height: 100,
              //子Widget的高度
              child: Container(
                alignment: Alignment.bottomRight,
                color: Colors.lightBlue,
                width: 50,
                height: 50,
                child: Text('只能配合Stack使用'),
              ))
        ],
      ),
    );
  }
}

/// 1.一般是用来限制子控件的大小
/// 2.可以代替padding和container，然后用来设置两个控件之间的间距
class SizedBoxLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('尺寸限制容器布局'),
      ),
      body: Container(
        color: Colors.greenAccent,
        // 限制子 Widget 不能超过 300 * 500
        constraints: BoxConstraints.loose(Size(300, 500)),
        padding: EdgeInsets.all(20),
        child: SizedBox(
          //限制子 Widget 的大小
          width: 200, // 子widget的宽度
          height: 200, // 子widget的高度
          child: Container(
            color: Colors.white70,
            width: 20, //无效
            height: 20, //无效
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.purple,
                ),
                const SizedBox(
                  //充当Padding的作用
                  width: 100,
                  height: 50,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.pink,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
