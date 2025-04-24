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
          height: 115,
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
                    subtitle: Text('De Musto'),
                    trailing: Image.asset(
                      'images/play.png',
                      fit: BoxFit.fill,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
