import 'mappage.dart';
import 'recordlistpage.dart';
import 'package:flutter/material.dart';
import 'recordaddpage.dart';
import 'bottomBar.dart';
import 'datapage.dart';
import 'Inputform.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//これまでのダイブ回数を記録
int divecount = 0;

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Record',
      //日本語対応
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
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
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    reloadrecord();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //それぞれのボタンのページ遷移
  final List<Widget> _pages = [
    AddRecordPage(),
    RecordlistPage(),
    Awardpage(),
    GoogleMapPage(),
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
