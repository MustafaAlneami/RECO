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
  List<Widget> bottomNavigationPages = [
    const HomeView(),
    //const Rewardspage(),
    const CalenderView(),
    const SettingView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text('data'));
  }
}
