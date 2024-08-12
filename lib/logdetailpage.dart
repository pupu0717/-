import 'recordeditpage.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'outputform.dart';
import 'inputform.dart';

//ログの詳細ページ
class LogdetailPage extends StatefulWidget {
  final int datakey;

  const LogdetailPage({super.key, required this.datakey});

  @override
  LogdetailPageState createState() => LogdetailPageState();
}

class LogdetailPageState extends State<LogdetailPage> {
  late Future<Map<String, dynamic>> _record;

  @override
  void initState() {
    super.initState();
    _loadRecord();
  }

  void _loadRecord() {
    setState(() {
      _record = DatabaseHelper.instance.getRecord(widget.datakey);
    });
  }

  Widget _buildImage(String? imagePath) {
    if (imagePath != null && imagePath.isNotEmpty) {
      return Image.file(
        File(imagePath),
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('詳細ページ', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LogEditPage(datakey: widget.datakey)),
                );
                if (result == true) {
                  _loadRecord();
                }
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                _showdeleteDialog(context);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _record,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            } else {
              final record = snapshot.data!;
              final imagePath1 = record['imagePath1'];
              final imagePath2 = record['imagePath2'];
              final coordinateStr = record['coodinate'] as String?;
              double? latitude;
              double? longitude;
              if (coordinateStr != null && coordinateStr.isNotEmpty) {
                try {
                  final Map<String, dynamic> coordinates =
                      jsonDecode(coordinateStr);
                  latitude = coordinates['latitude'] as double?;
                  longitude = coordinates['longitude'] as double?;
                } catch (e) {
                  latitude = 35.68;
                  longitude = 139.76;
                }
              } else {
                latitude = 35.68;
                longitude = 139.76;
              }
              return Column(
                children: [
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Table(
                        children: [
                          TableRow(children: [
                            tableleft('国', record['country']),
                            tabelright('', record['prefecture']),
                          ]),
                          TableRow(children: [
                            tableleft('エリア', record['location']),
                            tabelright('ポイント', record['point']),
                          ]),
                          TableRow(children: [
                            tableleft('日付', record['date']),
                            tabelright('潜水時間', '${record['differencetime']}分'),
                          ]),
                          TableRow(children: [
                            tableleft('エントリータイム', record['entrytime']),
                            tabelright('エギジットタイム', record['exittime']),
                          ]),
                          TableRow(children: [
                            tableleft('水温',
                                '${record['watertemperature'].toStringAsFixed(1)}℃'),
                            record['weight'] != ''
                                ? tabelright('ウエイト', '${record['weight']}kg')
                                : tabelright('ウエイト', '-'),
                          ]),
                          TableRow(children: [
                            tableleft('最大深度',
                                '${record['depth_max'].toStringAsFixed(1)}m'),
                            tabelright('平均深度',
                                '${record['depth_average'].toStringAsFixed(1)}m'),
                          ]),
                          TableRow(children: [
                            tableleft('開始残圧', record['entrypress']),
                            tabelright('最終残圧', record['exitpress']),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  tabelright('バディ', record['buddy']),
                  tabelright('魚', record['fish']),
                  tabelright('備考', record['memo']),
                  SizedBox(
                    height: 200,
                    child: GoogleMap(
                        zoomControlsEnabled: false,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(latitude!, longitude!), zoom: 13),
                        markers:
                            coordinateStr != null && coordinateStr.isNotEmpty
                                ? {
                                    Marker(
                                      markerId: const MarkerId('あほ'),
                                      position: LatLng(latitude, longitude),
                                    )
                                  }
                                : {}),
                  ),
                  const SizedBox(height: 16),
                  imagePath1 != null ? _buildImage(imagePath1) : Container(),
                  const SizedBox(height: 16),
                  imagePath2 != null ? _buildImage(imagePath2) : Container(),
                  const SizedBox(height: 16),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  //削除の確認のダイアログ
  void _showdeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('確認'),
          backgroundColor: Colors.white,
          content: const Text('このログを削除しますか？一度消すと復元できません。'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('戻る')),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.instance.delete(widget.datakey);
                reassignNumbers();
                reloadrecord();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('削除'),
            ),
          ],
        );
      },
    );
  }
}
