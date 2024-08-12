import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'inputform.dart';
import 'package:flutter/material.dart';

//データベースの設定をするクラス
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  //初期化
  DatabaseHelper._init();

  //データベースを取得
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('record.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print('Initializing database at path: $path');

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //データベースを構築
  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE record (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      country TEXT,
      prefecture TEXT,
      location TEXT,
      point TEXT,
      date INTEGER,
      entrytime INTEGER,
      exittime INTEGER,
      differencetime INTEGER,
      depth_max INTEGER,
      depth_average INTEGER,
      tank TEXT,
      entrypress INTEGER,
      exitpress INTEGER,
      fish TEXT,
      memo TEXT,
      imagePath1 TEXT,
      imagePath2 TEXT,
      imagePath3 TEXT,
      number INTEGER,
      coodinate TEXT,
      weight INTEGER,
      buddy TEXT,
      watertemperature INTEGER
    )
    ''');
  }

  //ログに番号を振り直す
  Future<int> create(Map<String, dynamic> record) async {
    final db = await instance.database;
    int id = await db.insert('record', record);
    List<Map<String, dynamic>> allRecords = await RecordByDate();
    for (int i = 0; i < allRecords.length; i++) {
      await db.update(
        'record',
        {'number': i + 1},
        where: 'id = ?',
        whereArgs: [allRecords[i]['id']],
      );
    }

    return id;
  }

  //全てのレコードを取得
  Future<List<Map<String, dynamic>>> getAllRecords() async {
    final db = await instance.database;
    return await db.query('record');
  }

  //レコードを日付順に並び替える
  Future<List<Map<String, dynamic>>> RecordByDate() async {
    final db = await instance.database;
    var res = await db.query('record', orderBy: 'date ASC, entrytime ASC');
    return res;
  }

  //全てのレコードを読み込む。入力された文字列によって並び順が変わる。
  Future<List<Map<String, dynamic>>> readAllRecords(String key) async {
    final db = await instance.database;
    String orderBy;

    switch (key) {
      case '日付降順':
        orderBy = 'date DESC, entrytime DESC';
        break;
      case '日付昇順':
        orderBy = 'date ASC, entrytime ASC';
        break;
      case '最大深度降順':
        orderBy = 'depth_max DESC, date DESC, entrytime DESC';
        break;
      case '最大深度昇順':
        orderBy = 'depth_max ASC,date DESC, entrytime DESC';
        break;
      case '平均深度降順':
        orderBy = 'depth_average DESC,date DESC, entrytime DESC';
        break;
      case '平均深度昇順':
        orderBy = 'depth_average ASC,date DESC, entrytime DESC';
      case '潜水時間降順':
        orderBy = 'differencetime DESC, date DESC, entrytime DESC';
      case '潜水時間昇順':
        orderBy = 'differencetime ASC, date ASC, entrytime ASC';
      case '水温降順':
        orderBy = 'watertemperature DESC,date DESC, entrytime DESC ';
      case '水温昇順':
        orderBy = 'watertemperature ASC,date DESC, entrytime DESC ';

        break;
      default:
        orderBy = 'date DESC, entrytime DESC';
    }

    var rec = await db.query('record', orderBy: orderBy);
    return rec;
  }

  //データベースを閉じる。
  Future close() async {
    final db = await instance.database;
    db.close();
  }

  //デーたベースの内容が更新されたとき、データベースを更新
  Future<int> updateRecord(int id, Map<String, dynamic> values) async {
    final db = await instance.database;
    return await db.update(
      'record',
      values,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //入力されたidに対応するデータを削除
  Future<void> delete(int id) async {
    final db = await database;
    await db.delete(
      'record',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //入力されたidに対応する行を取得
  Future<Map<String, dynamic>> getRecord(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query(
      'record',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  //データベースの内容をcsvファイルに出力
  Future<void> exportAndShareCSV() async {
    final db = await instance.database;
    List<Map<String, dynamic>> records = await db.query('record');

    List<List<dynamic>> rows = [];
    rows.add([
      'id',
      'country',
      'prefecture',
      'location',
      'point',
      'date',
      'entrytime',
      'exittime',
      'differencetime',
      'depth_max',
      'depth_average',
      'tank',
      'entrypress',
      'exitpress',
      'fish',
      'memo',
      'imagePath1',
      'imagePath2',
      'imagePath3',
      'number',
      'coodinate',
      'weight',
      'buddy',
      'watertemperature'
    ]);

    for (var record in records) {
      rows.add([
        record['id'],
        record['country'],
        record['prefecture'],
        record['location'],
        record['point'],
        record['date'],
        record['entrytime'],
        record['exittime'],
        record['differencetime'],
        record['depth_max'],
        record['depth_average'],
        record['tank'],
        record['entrypress'],
        record['exitpress'],
        record['fish'],
        record['memo'],
        record['imagePath1'],
        record['imagePath2'],
        record['imagePath3'],
        record['number'],
        record['coodinate'],
        record['weight'],
        record['buddy'],
        record['watertemperature']
      ]);
    }

    String csv = const ListToCsvConverter().convert(rows);

    if (await Permission.storage.request().isGranted) {
      final directory = await getExternalStorageDirectory();
      final path = '${directory!.path}/records.csv';
      final file = File(path);
      await file.writeAsString(csv);

      // CSVファイルを共有
      await Share.shareXFiles([XFile(path)], text: 'Here is your CSV file');
    } else {
      print('Storage permission denied');
    }
  }

  //csvファイルから復元
  Future<void> restoreFromCSV(BuildContext context) async {
    if (await Permission.storage.request().isGranted) {
      // ファイル選択ダイアログを表示
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.isNotEmpty) {
        // 選択されたファイルのパスを取得
        final path = result.files.single.path!;
        final file = File(path);

        // ファイル名が 'records.csv' かどうかをチェック
        if (result.files.single.name == 'records.csv') {
          if (await file.exists()) {
            final csvString = await file.readAsString();
            List<List<dynamic>> rows =
                const CsvToListConverter().convert(csvString);

            print(rows);

            // 最初の行はヘッダーなのでスキップ
            List<Map<String, dynamic>> data = [];
            for (var i = 1; i < rows.length; i++) {
              data.add({
                'country': rows[i][1],
                'prefecture': rows[i][2],
                'location': rows[i][3],
                'point': rows[i][4],
                'date': rows[i][5],
                'entrytime': rows[i][6],
                'exittime': rows[i][7],
                'differencetime': rows[i][8],
                'depth_max': rows[i][9],
                'depth_average': rows[i][10],
                'tank': rows[i][11],
                'entrypress': rows[i][12],
                'exitpress': rows[i][13],
                'fish': rows[i][14],
                'memo': rows[i][15],
                'number': rows[i][19],
                'coodinate': rows[i][20],
                'weight': rows[i][21],
                'buddy': rows[i][22],
                'watertemperature': rows[i][23]
              });
              print(i);
            }

            final db = await DatabaseHelper.instance.database;
            // 現在の最大IDを取得
            int maxId =
                (await db.rawQuery('SELECT MAX(id) as max_id FROM record'))
                        .first['max_id'] as int? ??
                    0;

            for (var row in data) {
              maxId++;
              row['id'] = maxId;
              await db.insert('record', row);
            }

            print('Database restored from CSV file');
          } else {
            print('CSV file not found');
          }
        } else {
          showErrorDialog(context, 'ファイルが違います');
        }
      } else {
        print('No file selected');
      }
    } else {
      print('Storage permission denied');
    }
  }
}

Future<String> getApplicationDocumentsDirectoryPath() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
