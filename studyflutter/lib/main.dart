import 'package:flutter/material.dart';

void main() {
//  runApp(MaterialApp(
//    title: 'Flutter Tutorial',
//    home: MyApp(),
//  ));
  runApp(MyApp());
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Flutter layout demo'),
//        ),
//        body: Center(
//          child: Text('Hello world'),
//        ),
//      ),
//    );
//  }
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}