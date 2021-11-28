import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// 获取图片的宽高比：https://stackoverflow.com/questions/44665955/how-do-i-determine-the-width-and-height-of-an-image-in-flutter
Future<Size> _calculateImageDimension(String imgSrc) {
  Completer<Size> completer = Completer();
  Image image = Image.asset(imgSrc);
  image.image.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        var myImage = image.image;
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
        completer.complete(size);
      },
    ),
  );
  return completer.future;
}
