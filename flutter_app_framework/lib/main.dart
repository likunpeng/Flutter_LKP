import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import './pages/index_page.dart';
void main() {
  runApp(App());
  // Android 状态栏透明 splash为白色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light));

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '社员网',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.pink
        ),
        home: IndexPage(),
      ),
    );
  }
}
