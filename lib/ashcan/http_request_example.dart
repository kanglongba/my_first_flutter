import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

Future _getByHttpClient() async {
  //接口地址
  const url = 'https://www.demo.com/api';
  //定义httpClient
  HttpClient client = HttpClient();
  //定义request
  HttpClientRequest request = await client.getUrl(Uri.parse(url));
  //定义response
  HttpClientResponse response = await request.close();
  //response返回的数据，是字符串
  String responseBody = await response.transform(utf8.decoder).join();
  //关闭httpClient
  client.close();
  //字符串需要转化为JSON
  var json = jsonDecode(responseBody);
  return json;
}

Future _getByDartHttp() async {
  // 接口地址
  const url = "https://www.demo.com/api";
  var response = await http.get(Uri.parse(url));
  //接口的返回值转化为JSON
  var json = jsonDecode(response.body);
  return json;
}

Future _getByDio() async {
  // 接口地址
  const baseUrl = "https://www.demo.com/";
  //扩展配置参数
  BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  //定义Dio实例
  var dio = Dio(options);
  Response response = await dio.get('api');
  //返回值转化为JSON
  var json = jsonDecode(response.data);
  return json;
}
