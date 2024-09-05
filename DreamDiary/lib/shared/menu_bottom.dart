import 'package:flutter/material.dart';
import 'package:dreamdiary/pages/diary.dart';

class MenuBottom extends StatelessWidget {
  final Function(Diary) onSave;

  const MenuBottom({Key? key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) async {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/main');
            break;
          case 1:
            final result = await Navigator.pushNamed(context, '/add');
            if (result != null) {
              onSave(result as Diary);
            }
            break;
          case 2:
            Navigator.pushNamed(context, '/calendar');
            break;
          default:
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: ''),
      ],
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: const Color(0xFF1270B0),
    );
  }
}
