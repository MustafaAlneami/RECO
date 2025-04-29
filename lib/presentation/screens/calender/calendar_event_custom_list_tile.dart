import 'package:flutter/material.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';
import 'package:url_launcher/url_launcher.dart';

class CalenderEventCustomlisttile extends StatefulWidget {
  const CalenderEventCustomlisttile({
    super.key,
  });

  @override
  State<CalenderEventCustomlisttile> createState() =>
      _CalenderEventCustomlisttile();
}

class _CalenderEventCustomlisttile extends State<CalenderEventCustomlisttile> {
  late CalendarStrapiEvent calendarStrapiEventPlaceholder;
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 140,
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
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                          calendarStrapiEventPlaceholder.channelLogo)),
                  title: Text(
                    'Lets Go to the Event',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: [
                      Text(calendarStrapiEventPlaceholder.channelName),
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.indigo,
                    iconSize: 35,
                    onPressed: () {
                      _launchURL(calendarStrapiEventPlaceholder.vidUrl);
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 200,
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      // Pinky
                      color: const Color(0xFFF8BBD0),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      calendarStrapiEventPlaceholder.time,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
