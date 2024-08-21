import 'mappage.dart';
import 'recordlistpage.dart';
import 'package:flutter/material.dart';
import 'recordaddpage.dart';
import 'bottomBar.dart';
import 'datapage.dart';
import 'Inputform.dart';
import 'outputform.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//これまでのダイブ回数を記録
int divecount = 0;

//デフォルトの画像を設定
String defaultImagePath = '';

//メインのアプリ起動
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

//メインアプリ
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Record',
      //日本語対応
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('ja', ''),
      ],
      home: HomePage(),
    );
  }
}

//メインの画面
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    loadDivecount();
    loadImagePath();
    reloadrecord();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //それぞれのボタンのページ遷移
  final List<Widget> _pages = [
    const AddRecordPage(),
    const RecordlistPage(),
    const Awardpage(),
    const GoogleMapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
