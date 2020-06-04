import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterappframework/generated/l10n.dart';
import 'package:flutterappframework/manager/router_manger.dart';
import 'package:oktoast/oktoast.dart';

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
    return OKToast(
      child:  MaterialApp(
        title: '社员网-买家版',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        locale: Locale('zh', 'CN'),
        localizationsDelegates: const [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: Router.generateRoute,
        initialRoute: RouteName.splash,
      ),
    );
  }
}
