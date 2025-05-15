import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_is_here/data/models/CalendarEventsProvider%20.dart';
import 'package:reco_is_here/data/models/test_Provider_Modal.dart';
import 'package:reco_is_here/data/models/video_tag_provider.dart';

import 'package:reco_is_here/presentation/screens/main/main_view.dart';
import 'package:reco_is_here/presentation/screens/main/main_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainViewModel()),
      ChangeNotifierProvider(create: (_) => TestProviderModal()),
      ChangeNotifierProvider(create: (_) => VideoTagProvider()),
      ChangeNotifierProvider(create: (_) => CalendarEventsProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainView(),
      //this how to delete the fucking debug label
      debugShowCheckedModeBanner: false,
    );
  }
}
