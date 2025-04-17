import 'package:flutter/material.dart';

class HomeContentView extends StatefulWidget {
  const HomeContentView({super.key});

  @override
  State<HomeContentView> createState() => _HomeContentView();
}

class _HomeContentView extends State<HomeContentView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.amber,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.red,
                  )
                ],
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
