// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderView();
}

class _CalenderView extends State<CalenderView> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     SizedBox(
    //       height: 200,
    //       width: 200,
    //       child: Image.network(
    //         'https://drive.google.com/uc?export=view&id=1_WrACPPdvIIIObhiwh1pIBa8J7P-taDW',
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //     SizedBox(
    //       height: 200,
    //       width: 200,
    //       child: Image.network(
    //         'https://drive.google.com/uc?export=view&id=1X5LeOnVkN0LJKPpo-khrv4N6riX5IdfI',
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //   ],
    // );
    return ListView(
      children: [
        SizedBox(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: 330,
                          height: 230,
                          //color: Colors.green,
                          child: Image.network(
                            'https://drive.google.com/uc?export=view&id=18dVkIVqLhT3Z9snECQ0BlaCz3smEAHVl',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: SizedBox(
                          width: 35,
                          height: 35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://drive.google.com/uc?export=view&id=1I_kxjYw22XrxwXg_KoufF1nHTFy8UTaA',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: SizedBox(
                          width: 50,
                          height: 28,
                          child: Card(
                            margin: EdgeInsets.all(3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: Color(0xFFEDEBFA),
                            child: Text(' 10:00'), // widget.vidDuration
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 330,
                    height: 30,
                    child: Text(
                      'Learning Flutter: The Complete Guide',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(
                    width: 330,
                    height: 30,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            'https://drive.google.com/uc?export=view&id=1X5LeOnVkN0LJKPpo-khrv4N6riX5IdfI',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'De Musto',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        //testing something
                        // SizedBox(
                        //   width: 5,
                        // ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(200),
                        //   child: Image.network(
                        //     'https://drive.google.com/uc?export=view&id=1_WrACPPdvIIIObhiwh1pIBa8J7P-taDW',
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
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
                        width: 164,
                        height: 40,
                        color: Color(0xFFF6C1D7),
                        child: Text(
                          'RECO ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // widget.vidLink;
                          // print('vidLink: ${widget.vidLink}');
                          _launchURL(
                              'https://youtu.be/oFfVt3S51T4?si=ZNBqxXDz1GjZwnJI');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(1),
                          width: 164,
                          height: 40,
                          color: Color(0xFFFFD8B1),
                          child: Text(
                            'Watch ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
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
                      width: 360,
                      height: 40,
                      child: Text(
                        '3rd October 2023 - 10:00 AM',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: 330,
                          height: 230,
                          //color: Colors.green,
                          child: Image.network(
                            'https://drive.google.com/uc?export=view&id=1lKfBDQGzayp7m_-bZDXP7SHztMOe0Yf8',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: SizedBox(
                          width: 35,
                          height: 35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://drive.google.com/uc?export=view&id=1I_kxjYw22XrxwXg_KoufF1nHTFy8UTaA',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: SizedBox(
                          width: 50,
                          height: 28,
                          child: Card(
                            margin: EdgeInsets.all(3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: Color(0xFFEDEBFA),
                            child: Text(' 10:00'), // widget.vidDuration
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 330,
                    height: 30,
                    child: Text(
                      'Learning Flutter: The Complete Guide',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(
                    width: 330,
                    height: 30,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            'https://drive.google.com/uc?export=view&id=1X5LeOnVkN0LJKPpo-khrv4N6riX5IdfI',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'De Musto',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        //testing something
                        // SizedBox(
                        //   width: 5,
                        // ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(200),
                        //   child: Image.network(
                        //     'https://drive.google.com/uc?export=view&id=1_WrACPPdvIIIObhiwh1pIBa8J7P-taDW',
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
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
                        width: 164,
                        height: 40,
                        color: Color(0xFFF6C1D7),
                        child: Text(
                          'RECO ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // widget.vidLink;
                          // print('vidLink: ${widget.vidLink}');
                          _launchURL(
                              'https://youtu.be/oFfVt3S51T4?si=ZNBqxXDz1GjZwnJI');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(1),
                          width: 164,
                          height: 40,
                          color: Color(0xFFFFD8B1),
                          child: Text(
                            'Watch ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
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
                      width: 360,
                      height: 40,
                      child: Text(
                        '3rd October 2023 - 10:00 AM',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: 330,
                          height: 230,
                          //color: Colors.green,
                          child: Image.network(
                            'https://drive.google.com/uc?export=view&id=1yMQ7H89ApwiB0MvGgsLGJs8AzHBg741X',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: SizedBox(
                          width: 35,
                          height: 35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://drive.google.com/uc?export=view&id=1I_kxjYw22XrxwXg_KoufF1nHTFy8UTaA',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: SizedBox(
                          width: 50,
                          height: 28,
                          child: Card(
                            margin: EdgeInsets.all(3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: Color(0xFFEDEBFA),
                            child: Text(' 10:00'), // widget.vidDuration
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 330,
                    height: 30,
                    child: Text(
                      'Learning Flutter: The Complete Guide',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(
                    width: 330,
                    height: 30,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            'https://drive.google.com/uc?export=view&id=1X5LeOnVkN0LJKPpo-khrv4N6riX5IdfI',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'De Musto',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        //testing something
                        // SizedBox(
                        //   width: 5,
                        // ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(200),
                        //   child: Image.network(
                        //     'https://drive.google.com/uc?export=view&id=1_WrACPPdvIIIObhiwh1pIBa8J7P-taDW',
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
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
                        width: 164,
                        height: 40,
                        color: Color(0xFFF6C1D7),
                        child: Text(
                          'RECO ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // widget.vidLink;
                          // print('vidLink: ${widget.vidLink}');
                          _launchURL(
                              'https://youtu.be/oFfVt3S51T4?si=ZNBqxXDz1GjZwnJI');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(1),
                          width: 164,
                          height: 40,
                          color: Color(0xFFFFD8B1),
                          child: Text(
                            'Watch ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
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
                      width: 360,
                      height: 40,
                      child: Text(
                        '3rd October 2023 - 10:00 AM',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
