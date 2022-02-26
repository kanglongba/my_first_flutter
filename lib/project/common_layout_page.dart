import 'package:flutter/material.dart';

/// 1.[Flutter 布局基础教程](https://flutter.cn/docs/codelabs/layout-basics)
/// 2.[Flutter 中的布局](https://flutter.cn/docs/development/ui/layout)
/// 3.[深入理解 Flutter 布局约束](https://flutter.cn/docs/development/ui/layout/constraints)
///
/// 1.Flutter 中控件尺寸不由其自身决定的，而是由它的父控件。
/// 2.父控件总是会施加一个约束给孩子，这个约束会决定孩子宽高的取值范围以及相对位置。
class MyLayoutPage extends StatelessWidget {
  const MyLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('构建UI的常用布局'),
      ),
      body: GridView.count(
        primary: false,
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        //交叉轴子widget的个数
        padding: const EdgeInsets.all(5),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flexPage');
              },
              child: Text('弹性布局 - Flex')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row');
              },
              child: Text('线性布局 - Row')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/column');
              },
              child: Text('线性布局 - Column')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/center');
              },
              child: Text('居中布局 - Center')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/alignPage');
              },
              child: Text('对齐布局 - Align')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/absolutePage');
              },
              child: Text('层叠布局 - Stack')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/indexedStackPage');
              },
              child: Text('层叠布局2 - Stack')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wrapPage');
              },
              child: Text('流式布局 - Wrap')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/scrollPage');
              },
              child: Text('滚动布局 - SingleChildScrollView')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aspectRatioPage');
              },
              child: Text('比例布局 - AspectRatio')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/containerPage');
              },
              child: Text("容器布局 - Container\nFlutter中最强大的一个布局")),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/paddingPage');
              },
              child: Text('包裹布局 - Padding')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/positionedPage');
              },
              child: Text('位置布局 - Positioned')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sizedboxPage');
              },
              child: Text('尺寸限制容器 - SizedBox')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flexiblePage');
              },
              child: Text('弹性容器 - Flexible、Expanded、Spacer')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cardPage');
              },
              child: Text('卡片容器 - Card')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/gridViewPage');
              },
              child: Text('网格布局 - GridView')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/listViewPage');
              },
              child: Text('列表布局 - ListView')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/decoratedBoxPage');
              },
              child: const Text('装饰容器 - DecoratedBox')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transformPage');
              },
              child: const Text('变换容器 - Transform')),
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
        title: const Text('居中布局 - Center'),
      ),
      body: Container(
        color: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
        title: Text('包裹布局 - Padding'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              color: Colors.indigoAccent,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 10, top: 15, right: 20, bottom: 25),
                child: Container(
                  color: Colors.green,
                  width: double.infinity,
                  height: 100,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 2,
            ),
            Container(
              color: Colors.indigoAccent,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 40, 25, 70),
                child: Container(
                  color: Colors.orange,
                  width: double.infinity,
                  height: 100,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 2,
            ),
            Container(
              color: Colors.indigoAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 100,
                ),
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
        title: Text('弹性布局 - Flex'),
      ),
      body: Flex(
        direction: Axis.horizontal, // 方向
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 看注释，Expanded只能配和Row、Column、Flex使用
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
        title: const Text('线性布局 - Row'),
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
        title: Text('线性布局 - Column'),
      ),
      body: Column(
        //属性同Row，它们都继承自Flex
        crossAxisAlignment: CrossAxisAlignment.center,
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
        title: Text('对齐布局 - Align'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.lightBlueAccent,
        child: Align(
          widthFactor: 3, //宽度因子，如果设置的话，Align的宽度就是child的宽度乘以这个值，不能为负数
          heightFactor: 2, //高度因子，如果设置的话，Align的高度就是child的高度乘以这个值，不能为负数
          alignment: Alignment.centerRight,
          //对齐方式
          child: Image.asset(
            'assets/images/girl9.jpeg',
            width: 250,
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
        title: Text('层叠布局 - Stack'),
      ),
      body: Center(
        child: Stack(
          // 子Widget的对其方式，分为使用了Positioned和未使用Positioned定义两种情况
          alignment: AlignmentDirectional.topStart,
          // 用来决定没有Positioned方式时候子Widget的大小，StackFit.loose 指的是子Widget 多大就多大，
          // StackFit.expand使子Widget的大小和父组件一样大
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
          title: const Text('流式布局 - Wrap'),
        ),
        body: Wrap(
          //主轴的方向
          direction: Axis.horizontal,
          //主轴上的对齐方式
          alignment: WrapAlignment.start,
          //交叉轴的对齐方式
          crossAxisAlignment: WrapCrossAlignment.start,
          //交叉轴上的对齐方式
          runAlignment: WrapAlignment.start,
          //主轴上的间距
          spacing: 30,
          //交叉轴上的间距
          runSpacing: 10,
          children: List.generate(10, (i) {
            double w = 50.0 + 10 * i;
            double h = 10.0 + 10 * i;
            return Container(
              color: Colors.primaries[i],
              height: h,
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
        title: Text('滚动布局 - SingleChildScrollView'),
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
        title: Text('层叠布局2 - Stack'),
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
        title: Text('比例布局 - AspectRatio'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: 400,
        height: 400,
        color: Colors.orange,
        alignment: Alignment.center,
        child: AspectRatio(
          // 宽度 与 高度的 比
          aspectRatio: 16.0 / 9.0,
          child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Text(
              "16 : 9",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

/// 容器布局，同时包含了DecoratedBox和Transform的能力
class ContainerLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('容器布局 - Container'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        color: Colors.deepOrangeAccent,
        constraints: const BoxConstraints.expand(),
        child: Container(
          //child对齐方式
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(10),
          //背景色，不能和decoration同时使用
          //color: Colors.lightBlue,
          //装饰盒，修饰Container自己。不会改变大小，只是装装样子
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
            //这里用的是非线性变化
            gradient: RadialGradient(
              colors: [Colors.green, Colors.lightBlue],
              center: Alignment.center,
              radius: 0.7,
            ),
          ),
          //约束盒，约束Container的大小，比width和height的优先级更高
          constraints: BoxConstraints.loose(const Size.fromRadius(120)),
          //Container的宽度
          width: 300,
          //Container的高度
          height: 500,
          margin: const EdgeInsets.all(20),
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
        title: Text(
          '位置布局 - Positioned(必须配合Stack使用)',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
                right: 30,
                bottom: 50,
                width: 280,
                //子Widget的宽度
                height: 100,
                //子Widget的高度
                child: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.lightBlue,
                  width: 50,
                  height: 50,
                  child: Text(
                    '只能配合Stack使用',
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
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
        title: Text('尺寸限制容器布局 - SizedBox'),
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
                const SizedBox(
                  //充当Padding的作用
                  width: 100,
                  height: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.purple,
                ),
                const SizedBox(
                  //充当Padding的作用
                  width: 100,
                  height: 30,
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

/// 控制Row、Column、Flex等子组件如何布局的组件
/// Flexible中 fit 参数表示填满剩余空间的方式，说明如下：
/// 1.tight：必须（强制）填满剩余空间。
/// 2.loose：尽可能大的填满剩余空间，但是可以不填满
///
/// Expended继承自Flexible，fit = tight.
///
/// Spacer 通过 Expanded 实现，和Expanded的区别是：Expanded 可以设置子控件，而 Spacer 的子
/// 控件尺寸是0，因此Spacer适用于撑开 Row、Column、Flex 的子控件的空隙，
class FlexiblePageLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '弹性容器 - Flexible、Expanded、Spacer',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  height: 100,
                  child: Text(
                    'Flexible loose',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  height: 100,
                  child: Text(
                    'Expanded',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  height: 100,
                  child: Text(
                    'Spacer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 卡片布局：
class CardPageLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('卡片容器 - Card'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: _buildCard(),
      ),
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: 330,
      child: Card(
        elevation: 10,
        shadowColor: Colors.grey,
        child: Column(
          children: [
            Image.asset('assets/images/girl31.jpeg'),
            ListTile(
              title: const Text(
                '1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text('My City, CA 99984'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                '(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: const Text('costa@example.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewPage extends StatelessWidget {
  var colors = [
    Colors.indigoAccent,
    Colors.lightGreen,
    Colors.orangeAccent,
    Colors.lightBlue,
    Colors.redAccent,
    Colors.deepOrange,
    Colors.purpleAccent,
    Colors.teal,
    Colors.pink,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网格布局 - GridView'),
      ),
      body: GridView.builder(
          itemCount: 36,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: colors[index % 10],
              child: Image.asset('assets/images/girl${index + 1}.jpeg'),
            );
          }),
    );
  }
}

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('列表布局 - ListView'),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset('assets/images/girl${index + 1}.jpeg');
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 2,
                  color: Colors.teal,
                );
              },
              itemCount: 36),
        ));
  }
}

///装饰容器，可以在其子组件绘制前(或后)绘制一些装饰(Decoration)，如背景、边框、渐变等
///它的参数 this.decoration 要求传入抽象类Decoration，常用其子类BoxDecoration。
///装饰盒（BoxDecoration）包含了一系列装饰属性，包括：颜色，图片，边框，圆角，阴影，渐变，形状，背景混合模式
class DecoratedBoxLayoutPage extends StatelessWidget {
  const DecoratedBoxLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "装饰容器 - DecoratedBox",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: DecoratedBox(
          decoration: BoxDecoration(
              //边框
              border: Border.all(width: 2, color: Colors.amberAccent),
              // 线性颜色渐变
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.orangeAccent],
              ),
              // 圆角
              borderRadius: BorderRadius.circular(5.0),
              // 阴影
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0),
              ]),
          //background，背景；foreground，前景
          position: DecorationPosition.background,
          child: const Center(
            widthFactor: 2,
            heightFactor: 2,
            child: Text(
              "2022-02-26 飞猪大裁员",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效
///Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大
///小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。
class TransformLayoutPage extends StatelessWidget {
  const TransformLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "变换容器 - Transform",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.orange),
              position: DecorationPosition.background,
              child: Transform(
                alignment: Alignment.bottomRight,
                origin: Offset.zero,
                transform: Matrix4.skewY(0.3),
                child: const Center(
                  widthFactor: 2,
                  heightFactor: 2,
                  child: Text("Transform - 倾斜", style: TextStyle(fontSize: 20),),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.lightBlueAccent),
              position: DecorationPosition.background,
              child: Transform.translate(
                offset: const Offset(-50.0, -30.0), // dx控制水平方向偏移，dy控制垂直方向偏移
                child: const Center(
                  widthFactor: 2,
                  heightFactor: 2,
                  child: Text(
                    "Transform - 平移",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.lightGreenAccent),
              position: DecorationPosition.background,
              child: Transform.rotate(
                angle: 180, // 旋转角度
                child: const Center(
                  widthFactor: 2,
                  heightFactor: 2,
                  child: Text(
                    "Transform - 旋转",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.redAccent),
              position: DecorationPosition.background,
              child: Transform.scale(
                scale: 1.5, // 缩放倍数
                child: const Center(
                  widthFactor: 2,
                  heightFactor: 2,
                  child: Text(
                    "Transform - 缩放",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
