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

class GirlGalleryItem {
  static const String defaultDesc =
      '我对钱没有兴趣，从1999年阿里巴巴创业到现在为止，我没有一个月拿过工资，工资当然都发到我们家老婆账号上去了，我从来没碰过钱。';
  static const int LIKE = 1;
  static const int UNLIKE = 0;
  int id;
  String name;
  String desc;
  int rateScore;
  String imgSrc;
  bool isFavor;
  int reviewers;

  GirlGalleryItem(
      {required this.id,
      required this.name,
      required this.desc,
      required this.rateScore,
      required this.imgSrc,
      required this.isFavor,
      required this.reviewers});

  GirlGalleryItem.id(this.id, {String girlDesc = defaultDesc})
      : name = '妹子$id号',
        desc = girlDesc,
        imgSrc = 'assets/images/girl$id.jpeg',
        rateScore = 0,
        isFavor = false,
        reviewers = 170 + id;

  GirlGalleryItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        desc = json['desc'],
        rateScore = json['rateScore'],
        imgSrc = json['imgSrc'],
        reviewers = json['reviewers'],
        // 1，喜欢；0，不喜欢
        isFavor = json['isFavor'] == LIKE;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'rateScore': rateScore,
      'imgSrc': imgSrc,
      'reviewers': reviewers,
      // 1，喜欢；0，不喜欢
      'isFavor': isFavor ? LIKE : UNLIKE,
    };
  }
}

typedef FavorGirl = void Function(int index, bool isFavor);
