import 'package:flutter/material.dart';

class HomeContentView extends StatefulWidget {
  const HomeContentView({super.key});

  @override
  State<HomeContentView> createState() => _HomeContentView();
}

class _HomeContentView extends State<HomeContentView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      width: 370,
      child: Card(
        color: Color(0xFFD8F3DC),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 330,
                    height: 200,
                    color: Colors.green,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 85,
                          height: 50,
                          child: Card(
                            color: Color(0xFFD8F3DC),
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '3/3/25',
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    child: Text('7:00 AM')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Card(
                        color: Color(0xFFD8F3DC),
                        child: Icon(Icons.book),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: SizedBox(
                      width: 55,
                      height: 35,
                      child: Card(
                        color: Color(0xFFD8F3DC),
                        child: Text(' 10:00'),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 330,
                height: 50,
                color: Color(0xFFE9F5EC),
                child: Text('this the content title '),
              ),
              Container(
                width: 330,
                height: 40,
                color: Color(0xFFD8F3DC),
                child: Row(
                  children: [Icon(Icons.person), Text('john bin london')],
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 165,
                    height: 40,
                    color: Color(0xFF95D5B2),
                    child: Text(
                      'RECO',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(1),
                    width: 165,
                    height: 40,
                    color: Color(0xFF95D5B2),
                    child: Text(
                      'Watch ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
