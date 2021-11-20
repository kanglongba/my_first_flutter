class Product {
  const Product({required this.name, required this.desc});

  final String name;

  final String desc;
}

/// 类型别名:https://dart.cn/guides/language/language-tour#typedefs
typedef CartChangedCallback = Function(Product product, bool inCart);

class PersonCard {
  String name;
  String profession;
  String address;
  String phoneNo;
  String avatar;

  PersonCard(
      {required this.name,
      required this.profession,
      required this.address,
      required this.phoneNo,
      required this.avatar});
}

typedef BusinessCardAction = Function(PersonCard personCard);
