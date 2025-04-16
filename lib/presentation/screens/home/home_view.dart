import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_is_here/data/models/test_Provider_Modal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final provyModel = Provider.of<TestProviderModal>(context);
    return Scaffold(
      body: Column(
        children: [
          IndexedStack(
            children: [
              Text("$provyModel.age"),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
