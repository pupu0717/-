import 'package:flutter/material.dart';
import 'database.dart';
import 'image.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'list.dart';
import 'inputform.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'mapselectpage.dart';
import 'dart:convert';

class LogEditPage extends StatefulWidget {
  final int datakey;

  const LogEditPage({super.key, required this.datakey});

  @override
  LogEditPageState createState() => LogEditPageState();
}

class LogEditPageState extends State<LogEditPage> {
  late Future<Map<String, dynamic>> _record;
  final _formKey = GlobalKey<FormState>();
  final _countryContoroller = TextEditingController();
  final _prefectureController = TextEditingController();
  final _locationController = TextEditingController();
  final _pointController = TextEditingController();
  final _dateController = TextEditingController();
  final _entrytimeController = TextEditingController();
  final _exittimeController = TextEditingController();
  final _depthmaxController = TextEditingController();
  final _depthaverageController = TextEditingController();
  //final _tankController = TextEditingController();
  final _entrypressController = TextEditingController();
  final _exitpressController = TextEditingController();
  final _fishController = TextEditingController();
  final _memoController = TextEditingController();
  final _differenceController = TextEditingController();
  final _buddyController = TextEditingController();
  final _watertemperatureController = TextEditingController();
  final _weightController = TextEditingController();
  final Completer<GoogleMapController> _mapController = Completer();
  //String? _coordinateStr;
  LatLng? _selectedMap;
  LatLng? _selectedMap2;
  String? _selectedCountry;
  String? _selectedPrefecture;
  String? _selectedLocations;
  String? _imagePath1;
  String? _imagePath2;
  double? latitude;
  double? longitude;

  DateTime? _selectedDate;

  double? _containerHeight = 50;

  @override
  void initState() {
    super.initState();
    _loadRecord();
  }

  void _validateAndResizeContainer() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _containerHeight = 50.0;
      });
    } else {
      setState(() {
        _containerHeight = 70.0;
      });
    }
  }

  void _loadRecord() {
    _record = DatabaseHelper.instance.getRecord(widget.datakey);
    _record.then((record) {
      _countryContoroller.text = record['country'] ?? '';
      _pointController.text = record['point'] ?? '';
      _fishController.text = record['fish'] ?? '';
      _memoController.text = record['memo'] ?? '';
      _prefectureController.text = record['prefecture'] ?? '';
      _locationController.text = record['location'] ?? '';
      _selectedCountry = record['country'] ?? '';
      _selectedLocations = record['location'] ?? 'ー';
      _selectedPrefecture = record['prefecture'] ?? '';
      _depthmaxController.text = record['depth_max'].toString();
      _depthaverageController.text = record['depth_average'].toString();
      _dateController.text = record['date'].toString();
      _entrytimeController.text = record['entrytime'].toString();
      _exittimeController.text = record['exittime'].toString();
      _entrypressController.text = record['entrypress'].toString();
      _exitpressController.text = record['exitpress'].toString();
      _differenceController.text = record['differencetime'].toString();
      _weightController.text = record['weight'].toString();
      _buddyController.text = record['buddy'].toString();
      _watertemperatureController.text = record['watertemperature'].toString();
      _imagePath1 = record['imagePath1'];
      _imagePath2 = record['imagePath2'];
    });
  }

  Future<void> _updateRecord() async {
    _validateAndResizeContainer();
    if (_formKey.currentState!.validate()) {
      calculateTimeDifference(
          _entrytimeController, _exittimeController, _differenceController);
      await DatabaseHelper.instance.updateRecord(widget.datakey, {
        'country': _countryContoroller.text,
        'prefecture': _prefectureController.text,
        'location': _locationController.text,
        'point': _pointController.text,
        'fish': _fishController.text,
        'memo': _memoController.text,
        'depth_max': _depthmaxController.text,
        'depth_average': _depthaverageController.text,
        'date': _dateController.text,
        'entrytime': _entrytimeController.text,
        'exittime': _exittimeController.text,
        'entrypress': _entrypressController.text,
        'exitpress': _exitpressController.text,
        'differencetime': _differenceController.text,
        'buddy': _buddyController.text,
        'weight': _weightController.text,
        'watertemperature': _watertemperatureController.text,
        'imagePath1': _imagePath1 ?? '',
        'imagePath2': _imagePath2 ?? '',
        'coodinate': _selectedMap2 != null
            ? jsonEncode({
                'latitude': _selectedMap2!.latitude,
                'longitude': _selectedMap2!.longitude,
              })
            : _selectedMap != null
                ? jsonEncode({
                    'latitude': _selectedMap!.latitude,
                    'longitude': _selectedMap!.longitude,
                  })
                : null
      });
      reloadrecord();
      Navigator.pop(context, true);
    }
  }

  @override
  void dispose() {
    _countryContoroller.dispose();
    _pointController.dispose();
    _memoController.dispose();
    _prefectureController.dispose();
    _locationController.dispose();
    _depthmaxController.dispose();
    super.dispose();
  }

  void _onSelectedCountry(String selectedCountry) {
    setState(() {
      _selectedCountry = selectedCountry;
      _countryContoroller.text = selectedCountry;
      _selectedPrefecture = 'ー';
      _selectedLocations = 'ー';
      _prefectureController.text = 'ー';
      _locationController.text = 'ー';
    });
  }

  void _onselectedPrefecture(String selectedPrefecture) {
    setState(() {
      _selectedPrefecture = selectedPrefecture;
      _prefectureController.text = selectedPrefecture;
      _selectedLocations = 'ー';
      _locationController.text = 'ー';
    });
  }

  void _onselectedLocations(String selectedLocations) {
    setState(() {
      _selectedLocations = selectedLocations;
      _locationController.text = selectedLocations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '編集ページ',
          style: TextStyle(color: Colors.white),
        ),
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
          TextButton(
            onPressed: _updateRecord,
            child: const Text(
              '保存',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
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
            final coordinateStr = record['coodinate'] as String?;
            double? latitude;
            double? longitude;
            if (coordinateStr != null && coordinateStr.isNotEmpty) {
              try {
                final Map<String, dynamic> coordinates =
                    jsonDecode(coordinateStr);
                latitude = coordinates['latitude'] as double?;
                longitude = coordinates['longitude'] as double?;
                _selectedMap = LatLng(latitude!, longitude!);
              } catch (e) {
                latitude = 35.68;
                longitude = 139.76;
                //_selectedMap = LatLng(latitude, longitude);
              }
            } else {
              latitude = 35.68;
              longitude = 139.76;
              //_selectedMap = LatLng(latitude, longitude);
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CountryPicker(
                          controller: _countryContoroller,
                          onSelectedCountry: _onSelectedCountry,
                          countries: selectcountries),
                      PrefecturePicker(
                          controller: _prefectureController,
                          onSelectedPrefecture: _onselectedPrefecture,
                          prefectures:
                              countryprefectures[_selectedCountry!] ?? []),
                      LocationPicker(
                          controller: _locationController,
                          onSelectedLocation: _onselectedLocations,
                          locations:
                              prefectureLocations[_selectedPrefecture!] ?? []),
                      inputForm(
                          _pointController,
                          'ポイント',
                          textInputForm(
                              _pointController, 'ポイント', validateNotEmpty),
                          _containerHeight),
                      inputForm(
                          _depthmaxController,
                          '最大深度',
                          numberInputForm(_depthmaxController, '最大深度',
                              numberAndNotValidator),
                          _containerHeight),
                      inputForm(
                          _depthaverageController,
                          '平均深度',
                          numberInputForm(_depthaverageController, '平均深度',
                              numberAndNotValidator),
                          _containerHeight),
                      inputForm(
                          _watertemperatureController,
                          '水温',
                          numberInputForm(_watertemperatureController, '水温',
                              numberAndNotValidator),
                          _containerHeight),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: _containerHeight,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 233, 233, 233)),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _showDatePicker(context);
                          },
                          child: Row(
                            children: [
                              const Text('日付'),
                              Expanded(
                                child: specialInputForm(
                                    _dateController, '日付', validateNotEmpty),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: _containerHeight,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 233, 233, 233)),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _pickTime(context, _entrytimeController);
                          },
                          child: Row(
                            children: [
                              const Text('エントリー'),
                              Expanded(
                                child: specialInputForm(_entrytimeController,
                                    'エントリー', validateNotEmpty),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: _containerHeight,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 233, 233, 233)),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _pickTime(context, _exittimeController);
                          },
                          child: Row(
                            children: [
                              const Text('エギジット'),
                              Expanded(
                                child: specialInputForm(_exittimeController,
                                    'エギジット', validateNotEmpty),
                              ),
                            ],
                          ),
                        ),
                      ),
                      inputForm(
                          _entrypressController,
                          '開始残圧',
                          numberInputForm(
                              _entrypressController, '開始残圧', numberValidator),
                          _containerHeight),
                      inputForm(
                          _exitpressController,
                          '最終残圧',
                          numberInputForm(
                              _exitpressController, '最終残圧', numberValidator),
                          _containerHeight),
                      inputForm(
                          _weightController,
                          'ウエイト',
                          numberInputForm(
                              _weightController, 'ウエイト', numberValidator),
                          _containerHeight),
                      inputForm(
                          _buddyController,
                          'バディ',
                          textInputForm(_buddyController, 'バディ', notValidator),
                          _containerHeight),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Stack(
                          children: <Widget>[
                            AbsorbPointer(
                              child: GoogleMap(
                                zoomControlsEnabled: false,
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                    target: _selectedMap2 ??
                                        (_selectedMap ??
                                            LatLng(latitude, longitude)),
                                    zoom: 12),
                                markers: _selectedMap2 != null
                                    ? {
                                        Marker(
                                          markerId: const MarkerId('あほ'),
                                          position: _selectedMap2!,
                                        )
                                      }
                                    : _selectedMap != null
                                        ? {
                                            Marker(
                                              markerId: const MarkerId('あほ'),
                                              position: _selectedMap!,
                                            )
                                          }
                                        : {},
                                onMapCreated: (GoogleMapController controller) {
                                  _mapController.complete(controller);
                                  if (_selectedMap != null) {
                                    controller.animateCamera(
                                      CameraUpdate.newLatLng(_selectedMap!),
                                    );
                                  }
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                LatLng? selectedMap = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapSelectPage(
                                              mapcode: LatLng(
                                            locationcoodinate[
                                                _selectedLocations]![0],
                                            locationcoodinate[
                                                _selectedLocations]![1],
                                          ))),
                                );
                                if (selectedMap != null) {
                                  setState(() {
                                    _selectedMap2 = selectedMap;
                                  });
                                  final controller =
                                      await _mapController.future;
                                  controller.animateCamera(
                                      CameraUpdate.newLatLng(_selectedMap2!));
                                }
                              },
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width * 0.8,
                                color: _selectedMap == null
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.black.withOpacity(0.0),
                                alignment: Alignment.center,
                                child: _selectedMap == null &&
                                        _selectedMap2 == null
                                    ? const Text(
                                        'タップして位置を選択',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      fishInputForm(
                        _fishController,
                      ),
                      const SizedBox(height: 16.0),
                      memoInputForm(_memoController),
                      const SizedBox(height: 16.0),
                      _imagePath1 == null || _imagePath1 == ''
                          ? Container()
                          : Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Image.file(File(_imagePath1!)),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _imagePath1 = null;
                                    });
                                  },
                                  icon: const Icon(Icons.close),
                                )
                              ],
                            ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _imagePath2 == null || _imagePath2 == ''
                          ? Container()
                          : Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Image.file(File(_imagePath2!)),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _imagePath2 = null;
                                    });
                                  },
                                  icon: const Icon(Icons.close),
                                )
                              ],
                            ),
                      _imagePath1 == null ||
                              _imagePath2 == null ||
                              _imagePath1 == '' ||
                              _imagePath2 == ''
                          ? IconButton(
                              onPressed: () async {
                                final pickedImagePath =
                                    await pickAndSaveImage();
                                setState(() {
                                  if (_imagePath1 == null ||
                                      _imagePath1 == '') {
                                    _imagePath1 = pickedImagePath;
                                  } else if (_imagePath2 == null ||
                                      _imagePath2 == '') {
                                    _imagePath2 = pickedImagePath;
                                  }
                                });
                              },
                              icon: const Icon(Icons.add_a_photo, size: 70),
                            )
                          : Container(),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: _selectedDate ?? DateTime.now(),
            maximumDate: DateTime(2100),
            minimumDate: DateTime(2000),
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                _selectedDate = newDateTime;
                _dateController.text =
                    DateFormat('yyyy-MM-dd').format(newDateTime);
              });
            },
          ),
        );
      },
    );
  }

  //時刻を選択する機能
  Future _pickTime(BuildContext context, controller) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.inputOnly,
      builder: (BuildContext ddcontext, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (newTime != null) {
      setState(() {
        final now = DateTime.now();
        final time = DateTime(
            now.year, now.month, now.day, newTime.hour, newTime.minute);
        controller.text = DateFormat('HH:mm').format(time);
      });
    }
  }
}
