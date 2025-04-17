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
                  SizedBox(
                    width: 330,
                    height: 230,
                    //color: Colors.green,
                    child: Image.asset(
                      'images/t1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Color(0xFFE9F5EC),
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Color(0xFFE9F5EC),
                        child: Text(' 10:00'),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 330,
                height: 30,
                color: Color(0xFFE9F5EC),
                child: Text('I Let ChatGPT Control My Life for 24 Hours '),
              ),
              Container(
                width: 330,
                height: 30,
                color: Color(0xFFD8F3DC),
                child: Row(
                  children: [
                    Image.asset(
                      'images/creator1.jpg',
                      fit: BoxFit.fill,
                    ),
                    Text(
                      ' Kurzgesagt – In a Nutshell',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
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
