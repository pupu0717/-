import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

//テーブルウィジェットに使用する関数
Widget tableleft(String title, content) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: const BoxDecoration(
      border: Border(
        right: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
        bottom: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '$content',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
        ),
      ],
    ),
  );
}

//テーブルウィジェットに使用する関数2
Widget tabelright(String title, content) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '$content',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Future<String?> getData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? '0';
}

//ダイブカウントをロードする
Future<int> loadDivecount() async {
  final prefs = await SharedPreferences.getInstance();
  divecount = prefs.getInt('divecount') ?? 0;
  return divecount;
}

//デフォルト画像をロードする
Future<String> loadImagePath() async {
  final prefs = await SharedPreferences.getInstance();
  defaultImagePath = prefs.getString('defaultImagePath') ?? '';
  return defaultImagePath;
}
