import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reco_is_here/presentation/screens/main/main_view.dart';
import 'package:reco_is_here/presentation/screens/main/main_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainViewModel()),
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
    );
  }
}
