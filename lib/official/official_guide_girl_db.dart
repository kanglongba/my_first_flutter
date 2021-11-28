import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_first_flutter/official/official_guide_model.dart';

import 'official_guide_utils.dart';

class GirlDatabasePage extends StatelessWidget {
  const GirlDatabasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Girl数据库管理',
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              insertGirls();
              Fluttertoast.showToast(msg: '插入GirlGallery数据');
            },
            child: Container(
              color: Colors.green,
              margin: const EdgeInsets.all(15),
              child: const Center(
                child: Text(
                  '插入GirlGallery数据',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              clearGirls();
              Fluttertoast.showToast(msg: '清空GirlGallery数据');
            },
            child: Container(
              color: Colors.redAccent,
              margin: const EdgeInsets.all(15),
              child: const Center(
                child: Text(
                  '清空GirlGallery数据',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  void insertGirls() {
    for (int i = 1; i <= 30; i++) {
      insertGirl(GirlGalleryItem.id(i, girlDesc: '我仔细查了一下，我拿二星的时候是35岁，比楼主还大两岁，可能是当时年龄大的同学不多吧，所以内网还没有形成这种风气，当时还真没往年龄这边想。我记得当时我是想了几晚（通宵）吧，因为我是一个比较喜欢思考的人（其实是躺床上睡不着）。'));
    }
  }

  void clearGirls() async {
    var girls = await queryGirls();
    for (var element in girls) {
      deleteGirl(element);
    }
  }
}
