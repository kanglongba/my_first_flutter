import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'foundation_webview_data.dart';

/// https://pub.dev/packages/webview_flutter
class FoundationWebViewPage extends StatefulWidget {
  const FoundationWebViewPage({Key? key}) : super(key: key);

  @override
  State createState() {
    return FoundationWebViewState();
  }
}

class FoundationWebViewState extends State<FoundationWebViewPage> {
  late FoundationPageData _pageData;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    // 接收页面传递的数据
    if (ModalRoute.of(context)!.settings.arguments != null) {
      _pageData =
          ModalRoute.of(context)!.settings.arguments as FoundationPageData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageData.title),
      ),
      body: WebView(
        initialUrl: _pageData.pageUrl,
      ),
    );
  }
}
