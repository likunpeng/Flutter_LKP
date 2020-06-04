import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(
        child: Text('首页'),
      ),
    );
  }

  void getHttp() async {
    try {
      Response response;
      var data = {'phone':'18618481024', 'type': 2};
      response = await Dio().get(
          'http://rap2.taobao.org:38080/app/mock/248896/example/1585364949231',
      queryParameters: data);
      print("get 返回结果是：= $response");
    } catch (e) {
      return print(e);
    }
  }
}
