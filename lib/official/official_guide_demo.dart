import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/official/custom_my_widget.dart';

import 'official_guide_model.dart';
import 'official_guide_practice.dart';

class TutorialHome extends StatelessWidget {
  const TutorialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('官方Scaffold'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: const Center(
        child: Text('Official Scaffold Page Demo'),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;

  const CounterDisplay({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  VoidCallback onPressed;

  CounterIncrementor({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Increment'),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int count = 0;

  void _increment() {
    setState(() {
      count += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('计数器'),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            CounterIncrementor(
              onPressed: _increment,
            ),
            const SizedBox(
              width: 20,
            ),
            CounterDisplay(
              count: count,
            ),
          ],
        ),
      ),
    );
  }
}

/// 封装
class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  const ShoppingListItem({
    Key? key,
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: key);

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle() {
    if (!inCart) {
      return null;
    }
    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(),
      ),
      subtitle: Text(
        product.desc,
        style: _getTextStyle(),
      ),
      onTap: () {
        onCartChanged(product, inCart);
      },
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  /// 一共有这么多产品
  final List<Product> products = [
    const Product(name: "胡萝卜", desc: '产地江西南昌'),
    const Product(name: "大白菜", desc: '产地河北石家庄'),
    const Product(name: "南瓜", desc: '产地浙江富阳'),
    const Product(name: "萝卜", desc: '产地安徽黄山'),
    const Product(name: "红薯", desc: '产地江苏苏州'),
  ];

  ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShoppingCartState();
  }
}

class ShoppingCartState extends State<ShoppingCartPage> {
  /// 添加到购物车中的商品
  final cart = <Product>{};

  @override
  void initState() {
    super.initState();
    widget.products.add(const Product(name: '辣椒', desc: '产地湖南长沙'));
  }

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        cart.remove(product);
      } else {
        cart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '购物车',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        margin: const EdgeInsets.all(5),
        alignment: Alignment.topLeft,
        child: _createListView(),
      ),
    );
  }

  ListView _createListView() {
    return ListView.builder(
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return ShoppingListItem(
            // 这里的 widget 是 ShoppingCartPage 对象
            product: widget.products[index],
            inCart: cart.contains(widget.products[index]),
            onCartChanged: _handleCartChanged);
      },
    );
  }

  ListView _createListView2() {
    return ListView(
      children: widget.products.map((Product product) {
        return ShoppingListItem(
          product: product,
          inCart: cart.contains(product),
          onCartChanged: _handleCartChanged,
        );
      }).toList(),
    );
  }
}

class MyBusinessCardPage extends StatelessWidget {
  const MyBusinessCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的名片'),
      ),
      body: Container(
        child: MyBusinessCard(
            personCard: PersonCard(
          name: '赤木晴子',
          profession: '湘北篮球队经理',
          address: '日本神奈川县湘北中学',
          phoneNo: '18812345678',
          avatar: 'assets/images/girl18.jpeg',
        )),
      ),
    );
  }
}

class BeautifulGirlDetailPage extends StatelessWidget {
  const BeautifulGirlDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('玩偶姐姐'),
      ),
      body: const BeautifulGirlDetailWidget(),
    );
  }
}

//todo
//5.创建图片长廊UI，并加入交互和跳转到 第四点创建的UI，https://flutter.cn/docs/development/ui/layout  https://github.com/flutter/flutter/blob/master/dev/integration_tests/flutter_gallery/lib/demo/material/grid_list_demo.dart
//6.继续创建我的相册demo，加入喜欢功能和跳转详情功能，图片tab滑动功能。
