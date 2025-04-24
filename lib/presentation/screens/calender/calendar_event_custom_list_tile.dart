import 'package:flutter/material.dart';

class CalenderEventCustomlisttile extends StatefulWidget {
  const CalenderEventCustomlisttile({super.key});

  @override
  State<CalenderEventCustomlisttile> createState() =>
      _CalenderEventCustomlisttile();
}

class _CalenderEventCustomlisttile extends State<CalenderEventCustomlisttile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 105,
          child: Card(
            // elevation: 6,
            margin: EdgeInsets.all(15),
            surfaceTintColor: Colors.indigo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('images/creator3.jpg')),
                    title: Text(
                      'Lets Go to the Event',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        Text('De Musto'),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'New Release',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.play_arrow,
                      color: Colors.indigo,
                      size: 35,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
