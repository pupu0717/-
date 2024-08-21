import 'dart:io';

import 'package:diving_log/backuppage.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'Inputform.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'image.dart';
import 'dart:async';

class settingsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '設定画面',
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
                _showdivesettingDialog(context);
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
                  'ダイブ本数設定',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return defaultImagePicker();
                  },
                );
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
                  'デフォルト画像選択',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showbackupDialog(context);
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
                  'バックアップ',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => backupPage(),
                  ),
                );
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
                  'バックアップを復元',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showdeleteDialog(context);
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
                  'ログの全削除',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '入力は必須です';
    }
    if (int.tryParse(value) == null) {
      return '数字を入力してください';
    }
    return null;
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

  void _showdivesettingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('確認'),
          backgroundColor: Colors.white,
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('初期のダイブ本数を設定できます。例えば21本目から記録したい場合は20と入力してください。'),
                FutureBuilder<int>(
                  future: loadData(),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text('現在のダイブ本数 ${snapshot.data}');
                    }
                  },
                ),
                TextFormField(
                  controller: _numberController,
                  decoration: const InputDecoration(hintText: '本数'),
                  keyboardType: TextInputType.number,
                  validator: _numberValidator,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('戻る')),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  int number = int.parse(_numberController.text);
                  await saveData('divecount', number);
                  await loadData();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showbackupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('確認'),
          backgroundColor: Colors.white,
          content: const Text(
              'バックアップを取りますか？\nバックアップファイルは"records.csv"という名称で保存されます。名前を変更すると復元できなくなるのでご注意ください。また、写真のデータは引き継ぐことができません。'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('戻る')),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.instance.exportAndShareCSV();
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

  void _showdeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('確認'),
          backgroundColor: Colors.white,
          content: const Text('全データを削除しますか？\n一度削除したデータは復元できません。'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('戻る')),
            TextButton(
              onPressed: () async {
                final db = await DatabaseHelper.instance.database;
                await db.delete('record');
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

class defaultImagePicker extends StatefulWidget {
  @override
  _defaultImagePickerState createState() => _defaultImagePickerState();
}

class _defaultImagePickerState extends State<defaultImagePicker> {
  String? _imagePath1;

  Future<void> saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    defaultImagePath = prefs.getString('defaultImagePath') ?? '';
    return defaultImagePath;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('確認'),
      backgroundColor: Colors.white,
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('ログ一覧ページでデフォルトで表示される画像を変更できます。'),
            TextButton(
                onPressed: () async {
                  final pickedImagePath = await pickAndSaveImage();
                  setState(() {
                    _imagePath1 = pickedImagePath;
                  });
                },
                child: const Text('画像を選択')),
            _imagePath1 != null && _imagePath1!.isNotEmpty
                ? Image.file(File(_imagePath1!))
                : defaultImagePath.isNotEmpty
                    ? Image.file(File(defaultImagePath))
                    : Container(),
            TextButton(
                onPressed: () {
                  setState(() {
                    _imagePath1 = '';
                    defaultImagePath = '';
                  });
                },
                child: const Text('デフォルトに戻す')),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('戻る')),
        TextButton(
          onPressed: () async {
            await saveData('defaultImagePath', _imagePath1!);
            await loadData();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MyApp()),
              (route) => false,
            );
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
