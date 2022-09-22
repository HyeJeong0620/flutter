import 'package:flutter/material.dart';
import 'package:screen_a/ScreenB.dart';
import 'package:screen_a/ScreenC.dart';
import 'package:screen_a/ScreenA.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // flutter에서는 첫 route 이름을 '/'로 한다
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenA(),
        '/b': (context) => ScreenB(),
        '/c': (context) => ScreenC()
        // route 이름을 지정할 때 반드시 '/' 뒤에 원하는 이름 입력
      },
    );
  }
}
