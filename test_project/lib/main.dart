import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image'),
        ),
        body: Column(children: [
          Image.asset(
              'assets/img/img1.jpg',
              width: 280,
              height: 230
          ),
          Image.asset('assets/img/img2.jpg', width: 280, height: 230),
          Image.asset('assets/img/img3.jpg', width: 280, height: 230),
        ],),
      ),
    );
  }
}

