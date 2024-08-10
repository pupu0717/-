import 'package:diving_log/database.dart';

import 'recordaddpage.dart';
import 'package:flutter/material.dart';
import 'rankingdetal.dart';
import 'outputform.dart';
import 'list.dart';

class Awardpage extends StatelessWidget {
  const Awardpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('データ', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 233, 233, 233),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  '成績',
                  style: TextStyle(fontSize: 23),
                ),
                Column(
                  children: [
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          //border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Table(
                          children: [
                            TableRow(children: [
                              tableleft('総潜水時間',
                                  '${(someDataList[0] / 60).toStringAsFixed(1)}時間'),
                              //'${someDataList[0] ~/ 60}h ${someDataList[0] % 60}m'),
                              tabelright('総ダイブ回数', '${someDataList[1]}回'),
                            ]),
                            TableRow(children: [
                              tableleft('最長潜水時間',
                                  '${maxDivetimeList10[0]['divetime'][0]}分'),
                              someDataList[1] != 0
                                  ? tabelright('平均潜水時間',
                                      '${(someDataList[0] / someDataList[1]).toStringAsFixed(1)}分')
                                  : tabelright('平均潜水時間', '0分'),
                            ]),
                            TableRow(children: [
                              tableleft('最大到達水深',
                                  '${maxdepthList10[0]['depth'][0].toStringAsFixed(1)}m'),
                              someDataList[1] != 0
                                  ? tabelright('平均到達水深',
                                      '${(someDataList[2] / someDataList[1]).toStringAsFixed(1)}m')
                                  : tabelright('平均到達水深', '0m'),
                            ]),
                            TableRow(children: [
                              tableleft('最も潜った国',
                                  '${frequentCountryList10[0]['country'][0]}'),
                              tabelright('国コンプリート率',
                                  '${(countExperienceList[2] / countries.length * 100).toStringAsFixed(1)}%'),
                            ]),
                            TableRow(children: [
                              tableleft('最も潜った県',
                                  '${frequentPrefectureList10[0]['prefecture'][0]}'),
                              tabelright('県コンプリート率',
                                  '${(countExperienceList[0] / prefectures.length * 100).toStringAsFixed(1)}%'),
                            ]),
                            TableRow(children: [
                              tableleft('最も潜った国内エリア',
                                  '${frequentDomesticLocationList10[0]['location'][0]}'),
                              tabelright('国内エリアコンプリート率',
                                  '${(countExperienceList[1] / domesticArea.length * 100).toStringAsFixed(1)}%'),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'ランキング',
                  style: TextStyle(fontSize: 23),
                ),
                rankingCard(context, '最大水深', maxdepthList10, '水深', 'ポイント', '日付',
                    'depth', 'point', 'date', 'm', 0),
                rankingCard(context, '最小水深', mindepthList10, '水深', 'ポイント', '日付',
                    'depth', 'point', 'date', 'm', 3),
                rankingCard(context, '潜水時間', maxDivetimeList10, '潜水時間', 'ポイント',
                    '日付', 'divetime', 'point', 'date', '分', 4),
                rankingCard(context, '潜った県', frequentPrefectureList10, '回数',
                    '都道府県', '最近の日付', 'count', 'prefecture', 'date', '回', 1),
                rankingCard(context, '潜った国内エリア', frequentDomesticLocationList10,
                    '回数', 'エリア', '最近の日付', 'count', 'location', 'date', '回', 2),
                const Text(
                  'コンプリートへの道',
                  style: TextStyle(fontSize: 23),
                ),
                FutureBuilder<List<String>>(
                  future: fetchRecordItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final recordItems = snapshot.data ?? [];
                      return AbsorbPointer(
                        child:
                            completeCard(context, '国', countries, recordItems),
                      );
                    }
                  },
                ),
                FutureBuilder<List<String>>(
                  future: fetchRecordItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final recordItems = snapshot.data ?? [];
                      return AbsorbPointer(
                        child: completeCard(
                            context, '県', prefectures, recordItems),
                      );
                    }
                  },
                ),
                FutureBuilder<List<String>>(
                  future: fetchRecordItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final recordItems = snapshot.data ?? [];
                      return AbsorbPointer(
                        child: completeCard(
                            context, '国内エリア', domesticArea, recordItems),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget rankingCard(
    BuildContext context,
    title,
    list,
    String item1,
    String item2,
    String item3,
    String name1,
    String name2,
    String name3,
    unit,
    datakey) {
  return Card(
    color: Colors.white,
    margin: const EdgeInsets.all(15),
    //elevation: 10,
    //shadowColor: Colors.grey,
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        Center(
          child: Table(
            columnWidths: {
              0: FixedColumnWidth(MediaQuery.of(context).size.width * 0.11),
              1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.2),
            },
            children: [
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(''),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item1),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item3),
                ),
              ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('1st'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: list[0][name1][0] == double
                      ? Text('${list[0][name1][0].toStringAsFixed(1)} $unit')
                      : Text('${list[0][name1][0]} $unit'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${list[0][name2][0]}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${list[0][name3][0]}'),
                ),
              ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2nd'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: list[0][name1][0] == double
                      ? Text('${list[0][name1][1].toStringAsFixed(1)} $unit')
                      : Text('${list[0][name1][1]} $unit'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${list[0][name2][1]}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${list[0][name3][1]}'),
                ),
              ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('3rd'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: list[0][name1][0] == double
                      ? Text('${list[0][name1][2].toStringAsFixed(1)} $unit')
                      : Text('${list[0][name1][2]} $unit'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${list[0][name2][2]}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${list[0][name3][2]}'),
                ),
              ]),
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Rankingdetail(datakey: datakey)),
              );
            },
            child: const Text('詳しく見る')),
      ],
    ),
  );
}

Widget completeCard(
  BuildContext context,
  title,
  list,
  recordItems,
) {
  return Card(
    color: Colors.white,
    margin: const EdgeInsets.all(15),
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: (list.length / 3) * 43 + 45,
          child: ListView.builder(
            itemCount: (list.length / 3).ceil(),
            itemBuilder: (context, index) {
              return Table(
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        list[3 * index],
                        style: TextStyle(
                          color: recordItems.contains(list[3 * index])
                              ? Colors.black
                              : const Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        list.length > 3 * index + 1 ? list[3 * index + 1] : '',
                        style: TextStyle(
                          color: recordItems.contains(
                                  list.length > 3 * index + 1
                                      ? list[3 * index + 1]
                                      : '')
                              ? Colors.black
                              : const Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        list.length > 3 * index + 2 ? list[3 * index + 2] : '',
                        style: TextStyle(
                          color: recordItems.contains(
                                  list.length > 3 * index + 2
                                      ? list[3 * index + 2]
                                      : '')
                              ? Colors.black
                              : const Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                    ),
                  ]),
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}

Future<List<String>> fetchRecordItems() async {
  final db = await DatabaseHelper.instance.database;

  final result = await db.rawQuery('''
  SELECT DISTINCT country,prefecture,location FROM record

  ''');
  List<String> recordItems = [];
  for (var row in result) {
    if (row['country'] != null) recordItems.add(row['country'] as String);
    if (row['prefecture'] != null) recordItems.add(row['prefecture'] as String);
    if (row['location'] != null) recordItems.add(row['location'] as String);
  }

  return recordItems;
}
