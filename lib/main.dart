import 'package:flutter/material.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_view.dart';
import 'package:reco_is_here/presentation/screens/home/home_view.dart';
import 'package:reco_is_here/presentation/screens/setting/setting_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexy = 0;
  List<Widget> bottomNavigationPages = [
    const HomeView(),
    const CalenderView(),
    const SettingView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 10,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black87,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme:
              const IconThemeData(size: 40, applyTextScaling: false),
          currentIndex: indexy,
          onTap: (val) {
            indexy = val;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_today), label: 'calender'),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: 'settings')
          ],
        ),
        appBar: AppBar(
          title: Text('hola'),
        ),
        body: bottomNavigationPages[indexy]);
  }
}
