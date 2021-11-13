/// https://flutter.cn/docs/cookbook/networking/fetch-data

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first_flutter/photo/photo_list_response.dart';

const baseUrl = 'https://api.isoyu.com/api/picture/index?page=';

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
