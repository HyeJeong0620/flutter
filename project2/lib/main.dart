import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Mypage(),
    );
  }
}

class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          // leading: 아이콘 버튼 or 간단한 위젯을 왼쪽에 배치할 때
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Menu button is clicked');
          },
        ),
        actions: <Widget>[
          // actions: 복수의 아이콘 버튼 등을 오른쪽에 배치할 때
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // 함수의 형태로 일반 버튼 or 아이콘 버튼을 터치했을 때 일어나는 이벤트를 정의
              print('Shopping_cart button is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button is clicked');
            },
          ),
        ],
      ),
    );
  }
}
