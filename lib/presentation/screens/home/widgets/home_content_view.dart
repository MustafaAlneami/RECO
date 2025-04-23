import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeContentView extends StatefulWidget {
  //channel properties
  final String chanelName;
  final String chanelLogo;
  final String chanelsTags;
  final int channelId;
  //vids properties
  final String vidTitle;
  final int vidId;
  final String vidDuration;
  final String vidDate;
  final String vidThumbnail;
  final String vidLink;
  final String vidDescription;
  final String vidPlatform;

  const HomeContentView(
      {super.key,
      required this.vidTitle,
      required this.chanelName,
      required this.vidDuration,
      required this.vidDate,
      required this.vidThumbnail,
      required this.vidLink,
      required this.vidDescription,
      required this.chanelsTags,
      required this.chanelLogo,
      required this.channelId,
      required this.vidId,
      required this.vidPlatform});

  @override
  State<HomeContentView> createState() => _HomeContentView();
}

class _HomeContentView extends State<HomeContentView> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: 345,
                      height: 230,
                      //color: Colors.green,
                      child: Image.network(
                        widget.vidThumbnail,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('images/video-placeholder.png',
                              fit: BoxFit.fill);
                        },
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
                          widget.vidPlatform,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('images/image_placeholder.png',
                                fit: BoxFit.fill);
                          },
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
                        child: Text(' ${widget.vidDuration}'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 330,
                height: 30,
                child: Text(
                  widget.vidTitle,
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
                        widget.chanelLogo,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('images/profile_placeholder.jpg',
                              fit: BoxFit.fill);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.chanelName,
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
                    width: 170,
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
                      _launchURL(widget.vidLink);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(1),
                      width: 170,
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
                    widget.vidDate,
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
