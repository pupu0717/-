import 'package:flutter/material.dart';
import 'database.dart';
import 'image.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'list.dart';
import 'inputform.dart';
import 'dart:async';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MapselectPage.dart';

List someDataList = [0, 0, 0.0];
List<int?> frequentCountList = [0, 0];
List<String?> frequentList = ['無し', '無し'];
List<int> countExperienceList = [0, 0, 0];
List<Map<String, dynamic>> maxdepthList10 = [
  {
    'depth': List<double>.filled(20, 0),
    'prefecture': List<String>.filled(20, '-'),
    'location': List<String>.filled(20, '-'),
    'point': List<String>.filled(20, '-'),
    'date': List<String>.filled(20, '-'),
  }
];
List<Map<String, dynamic>> mindepthList10 = [
  {
    'depth': List<double>.filled(20, 0),
    'prefecture': List<String>.filled(20, '-'),
    'location': List<String>.filled(20, '-'),
    'point': List<String>.filled(20, '-'),
    'date': List<String>.filled(20, '-'),
  }
];
List<Map<String, dynamic>> frequentCountryList10 = [
  {
    'country': List<String>.filled(20, '-'),
    'count': List<int>.filled(20, 0),
    'date': List<String>.filled(20, '-')
  }
];
List<Map<String, dynamic>> frequentPrefectureList10 = [
  {
    'prefecture': List<String>.filled(20, '-'),
    'count': List<int>.filled(20, 0),
    'date': List<String>.filled(20, '-')
  }
];
List<Map<String, dynamic>> frequentDomesticLocationList10 = [
  {
    'location': List<String>.filled(20, '-'),
    'count': List<int>.filled(20, 0),
    'date': List<String>.filled(20, '-')
  }
];
List<Map<String, dynamic>> maxDivetimeList10 = [
  {
    'divetime': List<int>.filled(20, 0),
    'prefecture': List<String>.filled(20, '-'),
    'location': List<String>.filled(20, '-'),
    'point': List<String>.filled(20, '-'),
    'date': List<String>.filled(20, '-'),
  }
];

class AddRecordPage extends StatefulWidget {
  const AddRecordPage({super.key});

  @override
  AddRecordPageState createState() => AddRecordPageState();
}

class AddRecordPageState extends State<AddRecordPage> {
  final _formKey = GlobalKey<FormState>();
  final _countryContoroller = TextEditingController();
  final _prefectureController = TextEditingController();
  final _locationController = TextEditingController();
  final _pointController = TextEditingController();
  final _dateController = TextEditingController();
  final _watertemperatureController = TextEditingController();
  final _entrytimeController = TextEditingController();
  final _exittimeController = TextEditingController();
  final _depthmaxController = TextEditingController();
  final _depthaverageController = TextEditingController();
  final _tankController = TextEditingController();
  final _entrypressController = TextEditingController();
  final _exitpressController = TextEditingController();
  final _fishController = TextEditingController();
  final _memoController = TextEditingController();
  final _differenceController = TextEditingController();
  final _weightController = TextEditingController();
  final _buddyController = TextEditingController();
  final Completer<GoogleMapController> _mapController = Completer();
  LatLng? _selectedMap;
  // ignore: unused_field
  String? _selectedCountry = '日本';
  String? _selectedPrefecture = 'ー';
  String? _selectedLocations = 'ー';
  String? _imagePath1;
  String? _imagePath2;

  DateTime? _selectedDate;
  double? _containerHeight = 50;

  @override
  void dispose() {
    _countryContoroller.dispose();
    _prefectureController.dispose();
    _locationController.dispose();
    _pointController.dispose();
    _dateController.dispose();
    _watertemperatureController.dispose();
    _entrytimeController.dispose();
    _exittimeController.dispose();
    _depthmaxController.dispose();
    _depthaverageController.dispose();
    _tankController.dispose();
    _entrypressController.dispose();
    _exitpressController.dispose();
    _fishController.dispose();
    _memoController.dispose();
    _differenceController.dispose();
    _weightController.dispose();
    _buddyController.dispose();
    super.dispose();
  }

  void _loaditem() {
    _countryContoroller.text = '日本';
    _prefectureController.text = 'ー';
    _locationController.text = 'ー';
    _selectedPrefecture = 'ー';
  }

  void _validateAndResizeContainer() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _containerHeight = 50;
      });
    } else {
      setState(() {
        _containerHeight = 70;
      });
    }
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

  void _onSelectedPrefecture(String selectedPrefecture) {
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
  void initState() {
    super.initState();
    _loaditem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'ログを追加',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
            onPressed: () async {
              _validateAndResizeContainer();
              if (_formKey.currentState!.validate()) {
                calculateTimeDifference(_entrytimeController,
                    _exittimeController, _differenceController);
                final record = {
                  'country': _countryContoroller.text,
                  'prefecture': _prefectureController.text,
                  'location': _locationController.text,
                  'point': _pointController.text,
                  'depth_max': _depthmaxController.text,
                  'depth_average': _depthaverageController.text,
                  'date': _selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                      : '',
                  'watertemperature': _watertemperatureController.text,
                  'entrytime': _entrytimeController.text,
                  'exittime': _exittimeController.text,
                  'differencetime': _differenceController.text,
                  'entrypress': _entrypressController.text,
                  'exitpress': _exitpressController.text,
                  'fish': _fishController.text,
                  'memo': _memoController.text,
                  'weight': _weightController.text,
                  'buddy': _buddyController.text,
                  'imagePath1': _imagePath1 ?? '',
                  'imagePath2': _imagePath2 ?? '',
                  'coodinate': _selectedMap != null
                      ? jsonEncode({
                          'latitude': _selectedMap!.latitude,
                          'longitude': _selectedMap!.longitude,
                        })
                      : null,
                };
                DatabaseHelper.instance.create(record);
                reloadrecord();

                _countryContoroller.clear();
                _prefectureController.clear();
                _locationController.clear();
                _pointController.clear();
                _depthmaxController.clear();
                _depthaverageController.clear();
                _dateController.clear();
                _watertemperatureController.clear();
                _entrytimeController.clear();
                _exittimeController.clear();
                _entrypressController.clear();
                _exitpressController.clear();
                _fishController.clear();
                _memoController.clear();
                _differenceController.clear();
                _weightController.clear();
                _buddyController.clear();
                setState(() {
                  _selectedDate = null;
                  _imagePath1 = null;
                  _imagePath2 = null;
                  _selectedMap = null;
                  _loaditem();
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('保存しました！'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: const Text(
              '保存',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CountryPicker(
                    controller: _countryContoroller,
                    onSelectedCountry: _onSelectedCountry,
                    countries: selectcountries),
                PrefecturePicker(
                    controller: _prefectureController,
                    onSelectedPrefecture: _onSelectedPrefecture,
                    prefectures: countryprefectures[_selectedCountry!] ?? []),
                LocationPicker(
                    controller: _locationController,
                    onSelectedLocation: _onselectedLocations,
                    locations: prefectureLocations[_selectedPrefecture!] ?? []),
                inputForm(
                    _pointController,
                    'ポイント',
                    textInputForm(_pointController, 'ポイント', validateNotEmpty),
                    _containerHeight),
                inputForm(
                    _depthmaxController,
                    '最大水深',
                    numberInputForm(
                        _depthmaxController, '最大水深', numberAndNotValidator),
                    _containerHeight),
                inputForm(
                    _depthaverageController,
                    '平均水深',
                    numberInputForm(
                        _depthaverageController, '平均水深', numberAndNotValidator),
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
                          child: specialInputForm(
                              _entrytimeController, 'エントリー', validateNotEmpty),
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
                          child: specialInputForm(
                              _exittimeController, 'エギジット', validateNotEmpty),
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
                    numberInputForm(_weightController, 'ウエイト', numberValidator),
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
                              target:
                                  _selectedMap ?? const LatLng(35.68, 139.76),
                              zoom: 12),
                          markers: _selectedMap != null
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
                                      locationcoodinate[_selectedLocations]![0],
                                      locationcoodinate[_selectedLocations]![1],
                                    ))),
                          );
                          if (selectedMap != null) {
                            setState(() {
                              _selectedMap = selectedMap;
                            });
                            final controller = await _mapController.future;
                            controller.animateCamera(
                                CameraUpdate.newLatLng(_selectedMap!));
                          }
                        },
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: _selectedMap == null
                              ? Colors.black.withOpacity(0.5)
                              : Colors.black.withOpacity(0.0),
                          alignment: Alignment.center,
                          child: _selectedMap == null
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
                _imagePath1 == null
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
                _imagePath2 == null
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
                _imagePath1 == null || _imagePath2 == null
                    ? IconButton(
                        onPressed: () async {
                          final pickedImagePath = await pickAndSaveImage();
                          setState(() {
                            if (_imagePath1 == null) {
                              _imagePath1 = pickedImagePath;
                            } else {
                              _imagePath2 ??= pickedImagePath;
                            }
                          });
                        },
                        icon: const Icon(Icons.add_a_photo, size: 70),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
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
      initialEntryMode: TimePickerEntryMode.dial,
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
