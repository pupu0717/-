import 'logdetailpage.dart';
import 'settingspage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'database.dart';
import 'dialog.dart';

class RecordlistPage extends StatefulWidget {
  const RecordlistPage({super.key});

  @override
  RecordListPageState createState() => RecordListPageState();
}

class RecordListPageState extends State<RecordlistPage> {
  late Future<List<Map<String, dynamic>>> _records;
  String _searchQuery = '';
  final _searchController = TextEditingController();
  bool _searchSwicth = false;

  //絞り込みの初期値
  int _minDepthmax = 0;
  int _maxDepthmax = 100;
  int _minDepthaverage = 0;
  int _maxDepthaverage = 100;
  int _minDivetime = 0;
  int _maxDivetime = 100;
  int _minwatertemperature = 10;
  int _maxwatertemperature = 30;
  String _selectedCountry = 'ー';
  String _selectedPrefecture = 'ー';
  String _selectedPoint = 'ー';
  DateTime _startDate = DateTime(2001, 1, 1);
  DateTime _endDate = DateTime(2050, 12, 31);

  //並べ替えの初期値
  String _sortcategory = '日付降順';

  // ページングのための変数
  int _currentPage = 1;
  final int _recordsPerPage = 50;

  @override
  void initState() {
    super.initState();
    _loadRecords();
  }

  void _loadRecords() {
    setState(() {
      _records = _filterRecords();
    });
  }

  Future<List<Map<String, dynamic>>> _filterRecords() async {
    final records = await DatabaseHelper.instance.readAllRecords(_sortcategory);

    final filteredRecords = records.where((record) {
      final depthmax = record['depth_max'];
      final depthaverage = record['depth_average'];
      final divetime = record['differencetime'];
      final watertemperature = record['watertemperature'];
      final country = record['country'];
      final prefecture = record['prefecture'];
      final location = record['location'];
      final point = record['point'];
      final date = record['date'];
      final memo = record['memo'] ?? '';
      final fish = record['fish'] ?? '';
      final buddy = record['buddy'] ?? '';
      final isDepthMaxInRange =
          depthmax >= _minDepthmax && depthmax <= _maxDepthmax;
      final isDepthAveInRange =
          depthaverage >= _minDepthaverage && depthaverage <= _maxDepthaverage;
      final isDivetime = divetime >= _minDivetime && divetime <= _maxDivetime;
      final isWatertemperature = watertemperature >= _minwatertemperature &&
          watertemperature <= _maxwatertemperature;
      final isDateInRange = (DateTime.parse(date).isAfter(_startDate)) &&
          (DateTime.parse(date).isBefore(_endDate));
      final isCountryMatch =
          _selectedCountry == 'ー' || _selectedCountry == country;
      final isPrefectureMatch =
          _selectedPrefecture == 'ー' || _selectedPrefecture == prefecture;
      final isPointMatch = _selectedPoint == 'ー' || _selectedPoint == location;
      final isMemoMatch = memo.contains(_searchQuery) ||
          fish.contains(_searchQuery) ||
          buddy.contains(_searchQuery) ||
          country.contains(_searchQuery) ||
          prefecture.contains(_searchQuery) ||
          date.contains(_searchQuery) ||
          location.contains(_searchQuery) ||
          point.contains(_searchQuery);
      return isDepthMaxInRange &&
          isDepthAveInRange &&
          isDivetime &&
          isWatertemperature &&
          isCountryMatch &&
          isPrefectureMatch &&
          isPointMatch &&
          isDateInRange &&
          isMemoMatch;
    }).toList();

    return filteredRecords;
  }

//絞り込みのダイアログ
  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FilterDialog(
          minDepthmax: _minDepthmax,
          maxDepthmax: _maxDepthmax,
          minDepthaverage: _minDepthaverage,
          maxDepthaverage: _maxDepthaverage,
          minDivetime: _minDivetime,
          maxDivetime: _maxDivetime,
          minWatertemperature: _minwatertemperature,
          maxWatertemperature: _maxwatertemperature,
          selectedCountry: _selectedCountry,
          selectedPrefecture: _selectedPrefecture,
          selectedPoint: _selectedPoint,
          startDate: _startDate,
          endDate: _endDate,
          sortcategory: _sortcategory,
          onApplyFilters: (minDepthmax,
              maxDepthmax,
              minDepthaverage,
              maxDepthaverage,
              minDivetime,
              maxDivetime,
              minWatertemperature,
              maxWatertemperature,
              selectedCountry,
              selectedPrefecture,
              selectedPoint,
              startDate,
              endDate,
              sortcategory) {
            setState(() {
              _minDepthmax = minDepthmax;
              _maxDepthmax = maxDepthmax;
              _minDepthaverage = minDepthaverage;
              _maxDepthaverage = maxDepthaverage;
              _minDivetime = minDivetime;
              _maxDivetime = maxDivetime;
              _minwatertemperature = minWatertemperature;
              _maxwatertemperature = maxWatertemperature;
              _selectedCountry = selectedCountry;
              _selectedPrefecture = selectedPrefecture;
              _selectedPoint = selectedPoint;
              _startDate = startDate;
              _endDate = endDate;
              _sortcategory = sortcategory;
            });
            _loadRecords();
          },
        );
      },
    );
  }

  Widget _buildImage(String? imagePath) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
      child: imagePath != null && imagePath.isNotEmpty
          ? Image.file(
              File(imagePath),
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/noimage.jpg',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _buildPaginationControls(int totalRecords) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          child: _currentPage > 1
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      _currentPage--;
                    });
                    _loadRecords();
                  },
                  child: const Icon(Icons.chevron_left, color: Colors.black),
                )
              : Container(),
        ),
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '$_currentPage',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: _recordsPerPage * _currentPage < totalRecords
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      _currentPage++;
                    });
                    _loadRecords();
                  },
                  child: const Icon(Icons.chevron_right, color: Colors.black),
                )
              : Container(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        title: const Text(
          'ログ一覧',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _searchSwicth = !_searchSwicth;
              });
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog();
              _currentPage = 1;
            },
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => settingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _searchSwicth ? 70 : 0,
            padding: const EdgeInsets.all(8),
            child: Visibility(
              visible: _searchSwicth,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'キーワードを入力',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _searchQuery = _searchController.text;
                        _currentPage = 1;
                      });
                      _loadRecords();
                    },
                    child: const Text(
                      '検索',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _searchController.text = '';
                        _searchQuery = _searchController.text;
                        _minDepthmax = 0;
                        _maxDepthmax = 100;
                        _minDepthaverage = 0;
                        _maxDepthaverage = 100;
                        _minDivetime = 0;
                        _maxDivetime = 100;
                        _minwatertemperature = 10;
                        _maxwatertemperature = 30;
                        _selectedCountry = 'ー';
                        _selectedPrefecture = 'ー';
                        _selectedPoint = 'ー';
                        _startDate = DateTime(2001, 1, 1);
                        _endDate = DateTime(2050, 12, 31);
                      });
                      _loadRecords();
                    },
                    child: const Text(
                      'リセット',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _records,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('該当なし'));
                } else {
                  // ページングのためのインデックス範囲を計算
                  final totalRecords = snapshot.data!.length;
                  final startIndex = (_currentPage - 1) * _recordsPerPage;
                  final endIndex = startIndex + _recordsPerPage;
                  final currentPageRecords = snapshot.data!.sublist(
                    startIndex,
                    endIndex > totalRecords ? totalRecords : endIndex,
                  );

                  return CustomScrollView(
                    slivers: <Widget>[
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 8),
                      ),
                      SliverToBoxAdapter(
                        child: _buildPaginationControls(totalRecords),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final record = currentPageRecords[index];
                            final imagePath = record['imagePath1'];
                            return GestureDetector(
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LogdetailPage(datakey: record['id']),
                                  ),
                                );
                                if (result == true) {
                                  _loadRecords();
                                }
                                _loadRecords();
                              },
                              child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    _buildImage(imagePath),
                                    ListTile(
                                      title: Text(
                                          'No ${record['number']} ${record['point']}'),
                                      subtitle: Text(
                                        'エリア: ${record['location']}  ${record['prefecture']} \n'
                                        '日付: ${record['date']} ${record['entrytime']} 最大深度: ${record['depth_max']} m',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: currentPageRecords.length,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: _buildPaginationControls(totalRecords),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 8),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
