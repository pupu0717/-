import 'package:flutter/material.dart';
import 'database.dart';
import 'Inputform.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class backupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'バックアップ復元',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
            reloadrecord();
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _showrestoreDialog(context);
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 233, 233, 233),
                    ),
                  ),
                ),
                child: const Text(
                  'このアプリから復元',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showrestoreCulmDialog(context);
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 233, 233, 233),
                    ),
                  ),
                ),
                child: const Text(
                  'カルムプラスから復元',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveData(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<int> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    divecount = prefs.getInt('divecount') ?? 0;
    return divecount;
  }

  void _showrestoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('確認'),
          backgroundColor: Colors.white,
          content: const Text(
              'バックアップデータを復元しますか？\n"records.csv"ファイル以外は選択できません。データ数が多い場合反映に時間がかかる場合があります。'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('戻る')),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.instance.restoreFromCSV(context);
                Future.delayed(Duration(milliseconds: 100), () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MyApp()),
                    (route) => false,
                  );
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showrestoreCulmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('確認'),
          backgroundColor: Colors.white,
          content: const Text(
              'カルムプラスからデータを移行しますか？\nアプリを開いて「設定」→「CSV出力」で出力した"dive_log_export.csv"ファイルを選択してください。入力がない項目、対応していない項目はデフォルトの値が設定されます。'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('戻る')),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.instance.restoreFromCulmCSV(context);
                Future.delayed(Duration(milliseconds: 100), () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MyApp()),
                    (route) => false,
                  );
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
