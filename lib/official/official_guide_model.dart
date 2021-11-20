class Product {
  const Product({required this.name, required this.desc});

  final String name;

  final String desc;
}

/// 类型别名:https://dart.cn/guides/language/language-tour#typedefs
typedef CartChangedCallback = Function(Product product, bool inCart);
