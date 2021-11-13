/// https://flutter.cn/docs/cookbook/networking/fetch-data
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_first_flutter/photo/photo_list_response.dart';
import 'package:my_first_flutter/photo/wall_paper_response.dart';

const baseUrl = 'https://api.isoyu.com/api/picture/index?page=';
const mm = 'https://api.isoyu.com/mm_images.php';
const mmnew = 'https://api.isoyu.com/mmnew_images.php';
const mmbeibei = 'https://api.isoyu.com/beibei_images.php';
const mmDefault =
    'https://pic1.zhimg.com/80/v2-944bb3c8c741475b2cdea3b700266ba2_1440w.jpg';

Future<AlbumResponse> fetchAlbum({required int page}) async {
  var api = '$baseUrl$page';
  http.Response response = await http.get(Uri.parse(api));
  if (response.statusCode == 200) {
    dynamic result = jsonDecode(response.body);
    return AlbumResponse.fromJson(result);
  } else {
    return AlbumResponse(msg: 'error', code: 0);
  }
}

/// mm、mmnew、mmbeibei 三个接口直接返回了图片文件，设置header也没用
/// 读取接口直接返回的二进制图片
/// 1.https://stackoverflow.com/questions/59894880/how-to-get-a-uint8list-from-a-network-image-by-url-in-flutter
/// 2.https://stackoverflow.com/questions/53182480/how-to-get-a-flutter-uint8list-from-a-network-image
/// 3.https://www.jianshu.com/p/609081364415
/// 经过验证，以上这三篇文章，都不管用
/// 1.Dart - Create HTTP Request Examples ：https://www.woolha.com/tutorials/dart-create-http-request-examples
Future<WallPaper> fetchWallPaper(String url) async {
  Map<String, String> requestHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  try {
    http.Response response = await http
        .get(Uri.parse(url), headers: requestHeaders)
        .timeout(const Duration(seconds: 3));
    if (response.statusCode == 200) {
      return WallPaper.bytes(response.bodyBytes);
    } else {
      return WallPaper.url(mmDefault);
    }
  } on TimeoutException catch (e) {
    print('Timeout');
    return WallPaper.url(mmDefault);
  } catch (e) {
    print('other exception');
    return WallPaper.url(mmDefault);
  }
}
