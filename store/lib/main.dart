// main.dart 기본틀 작성하기
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyStore());
}

//stl 입력하면 자동완성
class MyStore extends StatelessWidget {
  const MyStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //추가
      home: StorePage(),
    );
  }
}

//stl 입력하면 자동완성
class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Text("woman", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("Kids", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("Shoes", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("Bag", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                ],
              ),
            ),
            Expanded(child: Image.asset("assets/img1.jpg", fit: BoxFit.cover)),
            SizedBox(height: 2), //이미지 사이에 빈 공간 주기
            Expanded(child: Image.asset("assets/img2.jpg", fit: BoxFit.cover)),
            //Expanded위젯 : 남은 위젯의 공간을 확장하여 공간을 채울 수 있는 위젯
          ],
        ),
      ),
    ); //const는 변함없는 위젯에서 사용
  }
}

//Column위젯 생성
//Column위젯은 수직 방향 레이아웃 구조를 만들어줌
//child속성을 가진 위젯은 하나의 위젯만 가질 수 있음
//위에서 아래로 내려가는 구조이기 때문에 Column위젯 생성,
//여러개의 속성 사용하기 때문에 children속성을 생성

//Row위젯
//Row위젯은 수평 방향 레이아웃 구조를 만들어줌
