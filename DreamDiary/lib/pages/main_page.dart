import 'package:flutter/material.dart';
import 'diary.dart';
import 'package:dreamdiary/shared/menu_bottom.dart';

class MainPage extends StatefulWidget {
  final List<Diary> diaries; // 다이어리 리스트

  const MainPage({Key? key, required this.diaries});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dream Diary'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.diaries.length,
        itemBuilder: (context, index) {
          final diary = widget.diaries[index];
          return ListTile(
            title: Text(
              diary.title,
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Text(diary.content),
            trailing: Text(diary.date),
          );
        },
      ),
      bottomNavigationBar: MenuBottom(onSave: (Diary ) {  },),
    );
  }
}
