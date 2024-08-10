import 'package:flutter/material.dart';

//画面下部のバーを作成するクラス
class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '追加',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'ログ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'データ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'マップ',
        ),
      ],
    );
  }
}
