import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'list.dart';
import 'package:intl/intl.dart';

//ログ一覧ページで絞り込みをするクラス
class FilterDialog extends StatefulWidget {
  final int minDepthmax;
  final int maxDepthmax;
  final int minDepthaverage;
  final int maxDepthaverage;
  final int minDivetime;
  final int maxDivetime;
  final int minWatertemperature;
  final int maxWatertemperature;
  final String selectedCountry;
  final String selectedPrefecture;
  final String selectedPoint;
  final DateTime startDate;
  final DateTime endDate;
  final String sortcategory;
  final Function(int, int, int, int, int, int, int, int, String, String, String,
      DateTime, DateTime, String) onApplyFilters;

  const FilterDialog({
    super.key,
    required this.minDepthmax,
    required this.maxDepthmax,
    required this.minDepthaverage,
    required this.maxDepthaverage,
    required this.minDivetime,
    required this.maxDivetime,
    required this.minWatertemperature,
    required this.maxWatertemperature,
    required this.selectedCountry,
    required this.selectedPrefecture,
    required this.selectedPoint,
    required this.startDate,
    required this.endDate,
    required this.sortcategory,
    required this.onApplyFilters,
  });

  @override
  FilterDialogState createState() => FilterDialogState();
}

class FilterDialogState extends State<FilterDialog> {
  late int tempMinDepthmax;
  late int tempMaxDepthmax;
  late int tempMinDepthaverage;
  late int tempMaxDepthaverage;
  late int tempMinDivetime;
  late int tempMaxDivetime;
  late int tempMinWatertemperature;
  late int tempMaxWatertemperature;
  late String tempSelectedCountry;
  late String tempSelectedPrefecture;
  late String tempSelectedPoint;
  late DateTime tempStartDate;
  late DateTime tempEndDate;
  late String tempsortcategory;

  @override
  void initState() {
    super.initState();
    tempMinDepthmax = widget.minDepthmax;
    tempMaxDepthmax = widget.maxDepthmax;
    tempMinDepthaverage = widget.minDepthaverage;
    tempMaxDepthaverage = widget.maxDepthaverage;
    tempMinDivetime = widget.minDivetime;
    tempMaxDivetime = widget.maxDivetime;
    tempMinWatertemperature = widget.minWatertemperature;
    tempMaxWatertemperature = widget.maxWatertemperature;
    tempSelectedCountry = widget.selectedCountry;
    tempSelectedPrefecture = widget.selectedPrefecture;
    tempSelectedPoint = widget.selectedPoint;
    tempStartDate = widget.startDate;
    tempEndDate = widget.endDate;
    tempsortcategory = widget.sortcategory;
  }

  void _showCountryPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (index) {
              setState(() {
                tempSelectedCountry = selectcountries[index];
                tempSelectedPrefecture = 'ー';
                tempSelectedPoint = 'ー';
              });
            },
            children: selectcountries
                .map((country) => Center(child: Text(country)))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildPrefecturePicker() {
    List<String> prefectures = countryprefectures[tempSelectedCountry] ?? [];

    return GestureDetector(
      onTap: () {
        _showPrefecturePicker(context, prefectures);
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            label: Text(tempSelectedPrefecture),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
        ),
      ),
    );
  }

  void _showPrefecturePicker(BuildContext context, List<String> prefectures) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: CupertinoPicker.builder(
            itemExtent: 40.0,
            onSelectedItemChanged: (index) {
              setState(() {
                tempSelectedPrefecture = prefectures[index];
                tempSelectedPoint = 'ー';
              });
            },
            childCount: prefectures.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Text(prefectures[index]),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildLocationPicker() {
    List<String> locations = prefectureLocations[tempSelectedPrefecture] ?? [];

    return GestureDetector(
      onTap: () {
        _showPointPicker(context, locations);
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            label: Text(tempSelectedPoint),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
        ),
      ),
    );
  }

  void _showPointPicker(BuildContext context, List<String> locations) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: CupertinoPicker.builder(
            itemExtent: 40.0,
            onSelectedItemChanged: (index) {
              setState(() {
                tempSelectedPoint = locations[index];
              });
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

  void _showStartdatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: tempStartDate,
            maximumDate: DateTime(2100),
            minimumDate: DateTime(2000),
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                tempStartDate = newDateTime;
              });
            },
          ),
        );
      },
    );
  }

  void _showEnddatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: tempEndDate,
            maximumDate: DateTime(2101),
            minimumDate: DateTime(2000),
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                tempEndDate = newDateTime;
              });
            },
          ),
        );
      },
    );
  }

  void _showSortCategoryPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (index) {
              setState(() {
                tempsortcategory = sortlist[index];
              });
            },
            children: sortlist
                .map((prefecture) => Center(child: Text(prefecture)))
                .toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('絞込み設定'),
      backgroundColor: Colors.white,
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('国'),
              GestureDetector(
                onTap: () {
                  _showCountryPicker(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text(tempSelectedCountry),
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              const Text('都道府県'),
              _buildPrefecturePicker(),
              const Text('エリア'),
              _buildLocationPicker(),
              const Text('期間'),
              Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showStartdatePicker(context);
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text(
                              DateFormat('yyyy-MM-dd').format(tempStartDate)),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text('～ '),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showEnddatePicker(context);
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text(
                              DateFormat('yyyy-MM-dd').format(tempEndDate)),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              const Text("最大水深"),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: tempMinDepthmax.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tempMinDepthmax =
                            int.tryParse(value) ?? tempMinDepthmax;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("m ～"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      initialValue: tempMaxDepthmax.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tempMaxDepthmax =
                            int.tryParse(value) ?? tempMaxDepthmax;
                      },
                    ),
                  ),
                  const Text("m"),
                ],
              ),
              const Text("平均水深"),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: tempMinDepthaverage.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tempMinDepthaverage =
                            int.tryParse(value) ?? tempMinDepthaverage;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("m ～"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      initialValue: tempMaxDepthaverage.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tempMaxDepthaverage =
                            int.tryParse(value) ?? tempMaxDepthaverage;
                      },
                    ),
                  ),
                  const Text("m"),
                ],
              ),
              const Text("潜水時間"),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: tempMinDivetime.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tempMinDivetime =
                            int.tryParse(value) ?? tempMinDivetime;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("分 ～"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      initialValue: tempMaxDivetime.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tempMaxDivetime =
                            int.tryParse(value) ?? tempMaxDivetime;
                      },
                    ),
                  ),
                  const Text("分"),
                ],
              ),
              const Text("水温"),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: tempMinWatertemperature.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tempMinWatertemperature =
                            int.tryParse(value) ?? tempMinWatertemperature;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("℃ ～"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      initialValue: tempMaxWatertemperature.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tempMaxWatertemperature =
                            int.tryParse(value) ?? tempMaxWatertemperature;
                      },
                    ),
                  ),
                  const Text("℃"),
                ],
              ),
              const Text('並び替え'),
              GestureDetector(
                onTap: () {
                  _showSortCategoryPicker(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text(tempsortcategory),
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onApplyFilters(
                tempMinDepthmax,
                tempMaxDepthmax,
                tempMinDepthaverage,
                tempMaxDepthaverage,
                tempMinDivetime,
                tempMaxDivetime,
                tempMinWatertemperature,
                tempMaxWatertemperature,
                tempSelectedCountry,
                tempSelectedPrefecture,
                tempSelectedPoint,
                tempStartDate,
                tempEndDate,
                tempsortcategory);
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
