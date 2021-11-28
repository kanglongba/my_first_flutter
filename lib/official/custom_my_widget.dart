import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'official_guide_model.dart';

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

/// 名片
/// codelab的练习作业：https://flutter.cn/docs/codelabs/layout-basics#putting-it-all-together
class MyBusinessCard extends StatelessWidget {
  final PersonCard personCard;

  const MyBusinessCard({Key? key, required this.personCard}) : super(key: key);

  void exchange(PersonCard personCard) {
    Fluttertoast.showToast(msg: '交换名片：${personCard.name}');
  }

  void schedule(PersonCard personCard) {
    Fluttertoast.showToast(msg: '日程');
  }

  void androidPhone(PersonCard personCard) {
    Fluttertoast.showToast(msg: '拨打手机');
  }

  void applePhone(PersonCard personCard) {
    Fluttertoast.showToast(msg: '拨打座机');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.amberAccent),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          //卡片阴影
          BoxShadow(
              color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
        ],
        color: Colors.white,
        shape: BoxShape.rectangle,
        gradient: const RadialGradient(
            //背景径向渐变
            colors: [Colors.orangeAccent, Colors.limeAccent],
            center: Alignment.topLeft,
            radius: .98),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonMainInfoWidget(
            personCard: personCard,
          ),
          const SizedBox(
            height: 15,
          ),
          PersonSecondaryInfoWidget(
            personCard: personCard,
          ),
          const SizedBox(
            height: 15,
          ),
          PersonActionWidget(
            personCard: personCard,
            exchange: exchange,
            schedule: schedule,
            phone: androidPhone,
            landline: applePhone,
          ),
        ],
      ),
    );
  }
}

class PersonMainInfoWidget extends StatelessWidget {
  final PersonCard personCard;

  const PersonMainInfoWidget({Key? key, required this.personCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 15, top: 5),
          child: CircleAvatar(
            backgroundImage: AssetImage(personCard.avatar),
            backgroundColor: Colors.transparent,
            maxRadius: 32,
            minRadius: 30,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              personCard.name,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black87,
              ),
            ),
            Text(
              personCard.profession,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PersonSecondaryInfoWidget extends StatelessWidget {
  final PersonCard personCard;

  const PersonSecondaryInfoWidget({Key? key, required this.personCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          personCard.address,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          personCard.phoneNo,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class PersonActionWidget extends StatelessWidget {
  final PersonCard personCard;

  //交换名片
  final BusinessCardAction exchange;

  //日程
  final BusinessCardAction schedule;

  //电话
  final BusinessCardAction phone;

  //座机
  final BusinessCardAction landline;

  const PersonActionWidget({
    Key? key,
    required this.personCard,
    required this.exchange,
    required this.schedule,
    required this.phone,
    required this.landline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          child: const Icon(
            Icons.accessibility_new,
            color: Colors.black87,
          ),
          onTap: () {
            exchange(personCard);
          },
        ),
        IconButton(
            onPressed: () {
              schedule(personCard);
            },
            icon: const Icon(
              Icons.schedule,
              color: Colors.black87,
            )),
        GestureDetector(
          child: const Icon(
            Icons.phone_android_outlined,
            color: Colors.black87,
          ),
          onTap: () {
            phone(personCard);
          },
        ),
        IconButton(
            onPressed: () {
              landline(personCard);
            },
            icon: const Icon(
              Icons.phone_iphone_outlined,
              color: Colors.black87,
            )),
      ],
    );
  }
}

class GirlGalleryCard extends StatelessWidget {
  final GirlGalleryItem girlItem;
  final FavorGirl favorGirl;

  const GirlGalleryCard(
      {Key? key, required this.girlItem, required this.favorGirl})
      : super(key: key);

  /// 图片的用法：https://medium.com/flutter-community/how-to-use-images-in-flutter-to-the-point-5542b4412a53
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey,
      margin: const EdgeInsets.all(3),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        //占满父布局
        fit: StackFit.expand,
        children: [
          Image.asset(
            girlItem.imgSrc,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black38,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    girlItem.name,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        favorGirl(girlItem.id - 1, !girlItem.isFavor);
                      },
                      icon: Icon(
                        girlItem.isFavor ? Icons.star : Icons.star_border,
                        color: Colors.redAccent,
                        size: 20,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
