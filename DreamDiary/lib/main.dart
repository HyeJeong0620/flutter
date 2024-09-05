import 'package:flutter/material.dart';
import 'pages/calender_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/add_page.dart';
import 'pages/diary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Diary> _diaries = []; // 다이어리 리스트

  void _addDiary(Diary diary) {
    setState(() {
      _diaries.add(diary); // 다이어리 추가
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Diary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainPage(diaries: _diaries), // 메인 페이지에 다이어리 리스트 전달
        '/add': (context) => AddPage(onSave: _addDiary),
        '/calendar': (context) => CalendarPage(),
      },
      initialRoute: '/',
    );
  }
}
