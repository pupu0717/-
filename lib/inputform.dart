import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'database.dart';
import 'recordaddpage.dart';
import 'list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'main.dart';

//入力フォーム
Widget inputForm(controller, String label, func, size) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 100),
    height: size,
    decoration: const BoxDecoration(
      border: Border(
        bottom:
            BorderSide(width: 1.0, color: Color.fromARGB(255, 233, 233, 233)),
      ),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 70.0,
          child: Text(label),
        ),
        Expanded(child: func),
      ],
    ),
  );
}

//テキスト入力フォーム
Widget textInputForm(controller, String label, validator) {
  return TextFormField(
    textAlign: TextAlign.center,
    controller: controller,
    validator: validator,
    decoration: const InputDecoration(
      border: InputBorder.none,
      suffixIcon: Icon(Icons.chevron_right),
    ),
  );
}

//入力方法が特殊な入力フォーム
Widget specialInputForm(controller, String label, validator) {
  return AbsorbPointer(
    child: TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.chevron_right),
        border: InputBorder.none,
      ),
      validator: validator,
    ),
  );
}

//数字を入力するフォーム
Widget numberInputForm(controller, String label, validator) {
  return TextFormField(
    controller: controller,
    textAlign: TextAlign.center,
    decoration: const InputDecoration(
      border: InputBorder.none,
      suffixIcon: Icon(Icons.chevron_right),
    ),
    keyboardType: TextInputType.number,
    validator: validator,
  );
}

//魚を入力するフォーム
Widget fishInputForm(controller) {
  return Container(
    height: 200.0,
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 233, 233, 233)),
      //borderRadius: BorderRadius.circular(15),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: 6,
      decoration: const InputDecoration(
        hintText: '見つけた魚などを入力',
        border: InputBorder.none,
      ),
    ),
  );
}

//メモ欄を入力するフォーム
Widget memoInputForm(controller) {
  return Container(
    height: 200.0,
    decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 233, 233, 233))
        //borderRadius: BorderRadius.circular(15),
        ),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: 6,
      decoration: const InputDecoration(
        hintText: '備考など',
        border: InputBorder.none,
      ),
    ),
  );
}

class PrefecturePicker extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSelectedPrefecture;
  final List<String> prefectures;

  const PrefecturePicker({
    super.key,
    required this.controller,
    required this.onSelectedPrefecture,
    required this.prefectures,
  });

  void _showPrefecturePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.white,
            child: CupertinoPicker.builder(
              itemExtent: 40.0,
              onSelectedItemChanged: (index) {
                final selectedPrefecture = prefectures[index];
                onSelectedPrefecture(selectedPrefecture);
              },
              childCount: prefectures.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Text(prefectures[index]),
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPrefecturePicker(context),
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color.fromARGB(255, 233, 233, 233)),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 50.0,
              child: Text('県'),
            ),
            Expanded(
              child: AbsorbPointer(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.chevron_right),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? '入力してください' : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryPicker extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSelectedCountry;
  final List<String> countries;

  const CountryPicker({
    super.key,
    required this.controller,
    required this.onSelectedCountry,
    required this.countries,
  });

  void _showCountryPicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.white,
            child: CupertinoPicker.builder(
              itemExtent: 40.0,
              onSelectedItemChanged: (index) {
                final selectedPrefecture = countries[index];
                onSelectedCountry(selectedPrefecture);
              },
              childCount: countries.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Text(countries[index]),
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCountryPicker(context),
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
                width: 1.0, color: Color.fromARGB(255, 233, 233, 233)),
            bottom: BorderSide(
                width: 1.0, color: Color.fromARGB(255, 233, 233, 233)),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 50.0,
              child: Text('国'),
            ),
            Expanded(
              child: AbsorbPointer(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.chevron_right),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? '入力してください' : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationPicker extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSelectedLocation;
  final locations;

  const LocationPicker({
    super.key,
    required this.controller,
    required this.onSelectedLocation,
    required this.locations,
  });

  void _showLocationPicker(BuildContext context, List<String> locations) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          color: Colors.white,
          child: CupertinoPicker.builder(
            itemExtent: 40.0,
            onSelectedItemChanged: (index) {
              final selectedLocations = locations[index];
              onSelectedLocation(selectedLocations);
            },
            childCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Text(locations[index]),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showLocationPicker(context, locations),
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color.fromARGB(255, 233, 233, 233)),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 50.0,
              child: Text('エリア'),
            ),
            Expanded(
              child: AbsorbPointer(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.chevron_right),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? '入力してください' : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Validator関連

//入力を確認
String? validateNotEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return '入力してください';
  }
  return null;
}

//数字かつ入力を確認
String? numberAndNotValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'このフィールドは必須です';
  }
  final number = double.tryParse(value);
  if (number == null) {
    return '数字を入力してください';
  }
  return null;
}

//入力する必要はないが数字を指定
String? numberValidator(String? value) {
  if (value != null && value.isNotEmpty) {
    final number = double.tryParse(value);
    if (number == null) {
      return '数字を入力してください';
    }
  }
  return null;
}

//Validatorを指定しない
String? notValidator(String? value) {
  return null;
}

//同カラム内で1番頻繁に現れるワードと回数を返す関数
Future<void> findFrecent(String columnname, int i) async {
  Database db = await DatabaseHelper.instance.database;

  List<Map<String, dynamic>> result = await db
      .rawQuery('''SELECT $columnname as value, COUNT($columnname) as count
        FROM record 
        GROUP BY $columnname 
        ORDER BY count DESC
        LIMIT 1
      ''');

  if (result.isNotEmpty && result[0]['value'] != null) {
    String mostFrequent = result[0]['value'] as String;
    int count = result[0]['count'] as int;
    frequentList[i] = mostFrequent;
    frequentCountList[i] = count;
  } else {
    return;
  }
}

//同カラム内で一度でも現れた単語の個数を返す関数
Future<void> countExperience(String columnname, int i, locationList) async {
  Database db = await DatabaseHelper.instance.database;

  String placeholders = locationList.map((_) => '?').join(',');

  List<Map<String, dynamic>> result =
      await db.rawQuery('''SELECT COUNT(DISTINCT $columnname) as count
        FROM record 
        WHERE ($columnname) IN ($placeholders)
      ''', locationList);

  if (result.isNotEmpty && result[0]['count'] != null) {
    int count = result[0]['count'];
    countExperienceList[i] = count;
  } else {
    return;
  }
}

//最大深度Top10を取得
Future<List<Map<String, dynamic>>> getTopdepth() async {
  final db = await DatabaseHelper.instance.database;

  List<Map<String, dynamic>> result = await db.rawQuery(
      '''SELECT depth_max, prefecture,location, point,date FROM record ORDER BY depth_max DESC LIMIT 20''');

  List<Map<String, dynamic>> processedResult = [];

  for (var item in result) {
    processedResult.add({
      'depth_max': (item['depth_max'] as num).toDouble(),
      'prefecture': item['prefecture'],
      'location': item['location'],
      'point': item['point'],
      'date': item['date'],
    });
  }

  return processedResult;
}

//Top10をリストに収納
Future<void> saveTopDepth() async {
  maxdepthList10 = [
    {
      'depth': List<double>.filled(20, 0),
      'prefecture': List<String>.filled(20, '-'),
      'location': List<String>.filled(20, '-'),
      'point': List<String>.filled(20, '-'),
      'date': List<String>.filled(20, '-'),
    }
  ];
  List<Map<String, dynamic>> top10Items = await getTopdepth();

  for (int i = 0; i < top10Items.length; i++) {
    maxdepthList10[0]['depth'][i] = top10Items[i]['depth_max'];
    maxdepthList10[0]['prefecture'][i] = top10Items[i]['prefecture'];
    maxdepthList10[0]['location'][i] = top10Items[i]['location'];
    maxdepthList10[0]['point'][i] = top10Items[i]['point'];
    maxdepthList10[0]['date'][i] = top10Items[i]['date'];
  }
}

//最小深度Top10を取得
Future<List<Map<String, dynamic>>> getBottomdepth() async {
  final db = await DatabaseHelper.instance.database;

  List<Map<String, dynamic>> result = await db.rawQuery(
      '''SELECT depth_max, prefecture, location, point,date FROM record ORDER BY depth_max ASC LIMIT 20''');

  List<Map<String, dynamic>> processedResult = [];

  for (var item in result) {
    processedResult.add({
      'depth_max': (item['depth_max'] as num).toDouble(),
      'prefecture': item['prefecture'],
      'location': item['location'],
      'point': item['point'],
      'date': item['date'],
    });
  }

  return processedResult;
}

//Top10をリストに収納
Future<void> saveBottomDepth() async {
  mindepthList10 = [
    {
      'depth': List<double>.filled(20, 0),
      'prefecture': List<String>.filled(20, '-'),
      'location': List<String>.filled(20, '-'),
      'point': List<String>.filled(20, '-'),
      'date': List<String>.filled(20, '-'),
    }
  ];
  List<Map<String, dynamic>> top10Items = await getBottomdepth();

  for (int i = 0; i < top10Items.length; i++) {
    mindepthList10[0]['depth'][i] = top10Items[i]['depth_max'];
    mindepthList10[0]['prefecture'][i] = top10Items[i]['prefecture'];
    mindepthList10[0]['location'][i] = top10Items[i]['location'];
    mindepthList10[0]['point'][i] = top10Items[i]['point'];
    mindepthList10[0]['date'][i] = top10Items[i]['date'];
  }
}

//最大深度Top10を取得
Future<List<Map<String, dynamic>>> getDivetime() async {
  final db = await DatabaseHelper.instance.database;

  List<Map<String, dynamic>> result = await db.rawQuery(
      '''SELECT differencetime, prefecture,location, point,date FROM record ORDER BY differencetime DESC LIMIT 20''');

  return result;
}

//Top10をリストに収納
Future<void> saveDivetime() async {
  maxDivetimeList10 = [
    {
      'divetime': List<int>.filled(20, 0),
      'prefecture': List<String>.filled(20, '-'),
      'location': List<String>.filled(20, '-'),
      'point': List<String>.filled(20, '-'),
      'date': List<String>.filled(20, '-'),
    }
  ];
  List<Map<String, dynamic>> top10Items = await getDivetime();

  for (int i = 0; i < top10Items.length; i++) {
    maxDivetimeList10[0]['divetime'][i] = top10Items[i]['differencetime'];
    maxDivetimeList10[0]['prefecture'][i] = top10Items[i]['prefecture'];
    maxDivetimeList10[0]['location'][i] = top10Items[i]['location'];
    maxDivetimeList10[0]['point'][i] = top10Items[i]['point'];
    maxDivetimeList10[0]['date'][i] = top10Items[i]['date'];
  }
}

//潜った国Top10を取得
Future<List<Map<String, dynamic>>> getfrequentcountry() async {
  final db = await DatabaseHelper.instance.database;
  String placeholders = countries.map((_) => '?').join(',');

  List<Map<String, dynamic>> result = await db
      .rawQuery('''SELECT country, COUNT(country) as count, MAX(date) as date
        FROM record 
        WHERE country IN ($placeholders)
        GROUP BY country
        ORDER BY count DESC
        LIMIT 20
      ''', countries);
  return result;
}

//Top10をリストに収納
Future<void> saveFrequentCountry() async {
  frequentCountryList10 = [
    {
      'country': List<String>.filled(20, '-'),
      'count': List<int>.filled(20, 0),
      'date': List<String>.filled(20, '-')
    }
  ];
  List<Map<String, dynamic>> top10Items = await getfrequentcountry();

  for (int i = 0; i < top10Items.length; i++) {
    frequentCountryList10[0]['country'][i] = top10Items[i]['country'];
    frequentCountryList10[0]['count'][i] = top10Items[i]['count'];
    frequentCountryList10[0]['date'][i] = top10Items[i]['date'];
  }
}

//潜った県Top10を取得
Future<List<Map<String, dynamic>>> getfrequentprefecture() async {
  final db = await DatabaseHelper.instance.database;
  String placeholders = prefectures.map((_) => '?').join(',');

  List<Map<String, dynamic>> result = await db.rawQuery(
      '''SELECT prefecture, COUNT(prefecture) as count, MAX(date) as date
        FROM record 
        WHERE prefecture IN ($placeholders)
        GROUP BY prefecture
        ORDER BY count DESC
        LIMIT 20
      ''', prefectures);
  return result;
}

//Top10をリストに収納
Future<void> saveFrequentPrefecture() async {
  frequentPrefectureList10 = [
    {
      'prefecture': List<String>.filled(20, '-'),
      'count': List<int>.filled(20, 0),
      'date': List<String>.filled(20, '-')
    }
  ];
  List<Map<String, dynamic>> top10Items = await getfrequentprefecture();

  for (int i = 0; i < top10Items.length; i++) {
    frequentPrefectureList10[0]['prefecture'][i] = top10Items[i]['prefecture'];
    frequentPrefectureList10[0]['count'][i] = top10Items[i]['count'];
    frequentPrefectureList10[0]['date'][i] = top10Items[i]['date'];
  }
}

//潜ったエリアTop10を取得
Future<List<Map<String, dynamic>>> getfrequentdomesticlocation() async {
  final db = await DatabaseHelper.instance.database;
  String placeholers = domesticArea.map((_) => '?').join(',');

  List<Map<String, dynamic>> result = await db
      .rawQuery('''SELECT location, COUNT(location) as count, MAX(date) as date
        FROM record 
        WHERE location IN ($placeholers)
        GROUP BY location
        ORDER BY count DESC
        LIMIT 20
      ''', domesticArea);
  return result;
}

//Top10をリストに収納
Future<void> saveFrequentLocation() async {
  frequentDomesticLocationList10 = [
    {
      'location': List<String>.filled(20, '-'),
      'count': List<int>.filled(20, 0),
      'date': List<String>.filled(20, '-')
    }
  ];
  List<Map<String, dynamic>> top10Items = await getfrequentdomesticlocation();

  for (int i = 0; i < top10Items.length; i++) {
    frequentDomesticLocationList10[0]['location'][i] =
        top10Items[i]['location'];
    frequentDomesticLocationList10[0]['count'][i] = top10Items[i]['count'];
    frequentDomesticLocationList10[0]['date'][i] = top10Items[i]['date'];
  }
}

//いろんな集計

Future<List<Map<String, dynamic>>> getSomeData() async {
  final db = await DatabaseHelper.instance.database;

  var result = await db.rawQuery('''
  SELECT SUM(differencetime) AS totalDiveTime,
  SUM(depth_max) AS depthmax,
  COUNT(*) AS count FROM record
''');
  return result;
}

Future<void> saveSomeData() async {
  List<Map<String, dynamic>> top10Items = await getSomeData();

  someDataList[0] = top10Items[0]['totalDiveTime'] ?? 0;
  someDataList[1] = top10Items[0]['count'];
  someDataList[2] = top10Items[0]['depthmax'] ?? 0;
}

//潜水時間を計算
void calculateTimeDifference(
    entrycontroller, exitcontroller, differencecontroller) {
  final entryTime = DateFormat('HH:mm').parse(entrycontroller.text);
  final exitTime = DateFormat('HH:mm').parse(exitcontroller.text);

  int entryhour = entryTime.hour;
  int exithour = exitTime.hour;
  int entryminute = entryTime.minute;
  int exitminute = exitTime.minute;

  if (entryminute <= exitminute) {
    if (entryhour <= exithour) {
      differencecontroller.text =
          ((exithour - entryhour) * 60 + (exitminute - entryminute)).toString();
    } else {
      differencecontroller.text =
          ((exithour + 24 - entryhour) * 60 + (exitminute - entryminute))
              .toString();
    }
  } else {
    differencecontroller.text =
        ((exithour - entryhour - 1) * 60 + (60 + exitminute - entryminute))
            .toString();
  }
}

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('エラー'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

Future<void> reassignNumbers() async {
  final db = await DatabaseHelper.instance.database;
  final records = await DatabaseHelper.instance.RecordByDate();
  for (int i = 0; i < records.length; i++) {
    await db.update('record', {'number': i + 1 + divecount},
        where: 'id = ?', whereArgs: [records[i]['id']]);
  }
}

//ランキング集計の操作
Future<void> reloadrecord() async {
  await saveTopDepth();
  await saveBottomDepth();
  await saveDivetime();
  await saveFrequentCountry();
  await saveFrequentPrefecture();
  await saveFrequentLocation();
  await saveSomeData();
  await countExperience('prefecture', 0, prefectures);
  await countExperience('location', 1, domesticArea);
  await countExperience('country', 2, countries);
  reassignNumbers();
}
