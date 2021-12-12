import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

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

/// 指导：https://flutter.cn/docs/development/ui/layout/tutorial
/// 指导：https://flutter.cn/docs/development/ui/interactive
class BeautifulGirlDetailWidget extends StatelessWidget {
  const BeautifulGirlDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(), // 占满父布局
      child: ListView(
        children: [
          Image.asset(
            'assets/images/girl31.jpeg',
            fit: BoxFit.fitHeight,
            height: 200,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          const GirlContactWidget(),
          const GirlActionWidget(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: const Text(
              '✰ Video DMCA / License by 藏® Studio ✰ All works http://hongkongdoll.tv ✰ All-age @MyHongKongDoll✰ 无中文平台社交账号 无群 ✰ 业余拍 佛系更新 ✰ 各平台无VISA订阅指南 http://hongkongdoll.us/subscribe',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class GirlContactWidget extends StatefulWidget {
  const GirlContactWidget({Key? key}) : super(key: key);

  @override
  State createState() {
    return GirlContactState();
  }
}

class GirlContactState extends State<GirlContactWidget> {
  late bool isFollow;
  late int followerCount;
  late void Function() follow;

  @override
  void initState() {
    super.initState();
    isFollow = false;
    followerCount = 41;
    follow = () {
      if (isFollow) {
        setState(() {
          followerCount--;
          isFollow = false;
        });
      } else {
        setState(() {
          followerCount++;
          isFollow = true;
        });
      }
    };
  }

  Icon getIcon() {
    if (isFollow) {
      return const Icon(
        Icons.star,
        color: Colors.red,
      );
    } else {
      return const Icon(
        Icons.star_border,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '玩偶姐姐',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '美国，西海岸，Twitter:@HongKong_Doll',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          IconButton(
            icon: getIcon(),
            iconSize: 25,
            onPressed: follow,
          ),
          Text(
            '$followerCount',
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class GirlActionWidget extends StatelessWidget {
  const GirlActionWidget({Key? key}) : super(key: key);

  final phoneNo = '13957492548';
  final twitter = 'https://twitter.com/HongKong_Doll';
  final mail = 'info@twitter.com';

  //mailto:smith@example.org?subject=News&body=shareNews
  final mailto = 'mailto:';

  //tel:13957492548
  final tel = 'tel:';

  //sms:13957492548?body=helloWorld
  final sms = 'sms:';

  ///调起系统服务和其他App：https://pub.dev/packages/url_launcher
  _call() async {
    if (await canLaunch('$tel$phoneNo')) {
      await launch('$tel$phoneNo');
    } else {
      Fluttertoast.showToast(msg: '不能拨打电话');
    }
  }

  _browse() async {
    if (await canLaunch(twitter)) {
      await launch(twitter);
    } else {
      Fluttertoast.showToast(msg: '不能打开浏览器');
    }
  }

  _share() async {
    //可以不写邮件地址
    if (await canLaunch('$mailto')) {
      await launch('$mailto');
    } else {
      Fluttertoast.showToast(msg: '不能发送邮件');
    }
  }

  /// https://pub.dev/packages/url_launcher/example
  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          children: [
            IconButton(
                onPressed: () {
                  _call();
                },
                icon: const Icon(
                  Icons.call,
                  color: Colors.lightBlueAccent,
                  size: 30,
                )),
            const Text(
              'CALL',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  _browse();
                },
                icon: const Icon(
                  Icons.near_me,
                  color: Colors.lightBlueAccent,
                  size: 30,
                )),
            const Text(
              'ROUTE',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  _share();
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.lightBlueAccent,
                  size: 30,
                )),
            const Text(
              'SHARE',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ],
    );
  }
}
