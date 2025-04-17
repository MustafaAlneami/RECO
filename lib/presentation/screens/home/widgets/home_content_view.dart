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
      height: 430,
      width: 370,
      child: Card(
        color: Color(0xFFEDEBFA),
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
                        child: Image.asset(
                          'images/yt logo.avif',
                          fit: BoxFit.fill,
                        ),
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
                        color: Color(0xFFEDEBFA),
                        child: Text(' 10:00'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 330,
                height: 30,
                child: Text('I Let ChatGPT Control My Life for 24 Hours '),
              ),
              SizedBox(
                width: 330,
                height: 30,
                child: Row(
                  children: [
                    Image.asset(
                      'images/creator1.jpg',
                      fit: BoxFit.fill,
                    ),
                    Text(
                      ' Kurzgesagt – In a Nutshell',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(1),
                    width: 160,
                    height: 40,
                    color: Color(0xFFF6C1D7),
                    child: Text(
                      'RECO ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(1),
                    width: 160,
                    height: 40,
                    color: Color(0xFFFFD8B1),
                    child: Text(
                      'Watch ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                color: Color.fromARGB(255, 166, 149, 241),
                child: Container(
                  margin: EdgeInsets.all(1),
                  alignment: Alignment.center,
                  width: 350,
                  height: 40,
                  child: Text(
                    '3th june 25 , 10:00 AM',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
