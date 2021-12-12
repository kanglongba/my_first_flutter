import 'package:flutter/material.dart';
import 'package:my_first_flutter/foundation/foundation_webview_data.dart';

class FlutterFoundationWidget extends StatelessWidget {
  const FlutterFoundationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    navigateToWebViewPage(
                        context,
                        FoundationPageData(
                            "Dart 编程语言概览", "https://dart.cn/samples"));
                  },
                  child: Container(
                    color: Colors.redAccent,
                    child: const Center(
                      // https://dart.cn/samples
                      child: Text(
                        "Dart 编程语言概览",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ))),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    navigateToWebViewPage(
                        context,
                        FoundationPageData("Dart 速查表",
                            "https://dart.cn/codelabs/dart-cheatsheet"));
                  },
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: const Center(
                      // https://dart.cn/codelabs/dart-cheatsheet
                      child: Text(
                        "Dart 速查表",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ))),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    navigateToWebViewPage(
                        context,
                        FoundationPageData("Dart 开发语言概览",
                            "https://dart.cn/guides/language/language-tour"));
                  },
                  child: Container(
                    color: Colors.orangeAccent,
                    child: const Center(
                      // https://dart.cn/guides/language/language-tour
                      child: Text(
                        "Dart 开发语言概览",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ))),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    navigateToWebViewPage(
                        context,
                        FoundationPageData("Dart 异步编程",
                            "https://dart.cn/codelabs/async-await"));
                  },
                  child: Container(
                    color: Colors.indigoAccent,
                    child: const Center(
                      // https://dart.cn/codelabs/async-await
                      child: Text(
                        "Dart 异步编程",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ))),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    navigateToWebViewPage(
                        context,
                        FoundationPageData("给 Android 开发者的 Flutter 指南",
                            "https://flutter.cn/docs/get-started/flutter-for/android-devs"));
                  },
                  child: Container(
                    color: Colors.lightGreen,
                    child: const Center(
                      // https://flutter.cn/docs/get-started/flutter-for/android-devs
                      child: Text(
                        "给 Android 开发者的 Flutter 指南",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }

  /// 如果没注册路由，也可以这么跳转：lib/official/official_guide_custom_my_widget.dart:301
  void navigateToWebViewPage(BuildContext context, FoundationPageData data) {
    Navigator.pushNamed(
      context,
      '/foundationWebViewPage',
      arguments: data,
    );
  }
}
