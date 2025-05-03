import 'package:flutter/material.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';

class TestCalendar extends StatefulWidget {
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
  final bool isNewReleased;
  final String vidTime;
  final String vidTags;

  const TestCalendar(
      {super.key,
      required this.chanelName,
      required this.chanelLogo,
      required this.chanelsTags,
      required this.channelId,
      required this.vidTitle,
      required this.vidId,
      required this.vidDuration,
      required this.vidDate,
      required this.vidThumbnail,
      required this.vidLink,
      required this.vidDescription,
      required this.vidPlatform,
      required this.isNewReleased,
      required this.vidTime,
      required this.vidTags});

  @override
  State<TestCalendar> createState() => _TestCalendar();
}

class _TestCalendar extends State<TestCalendar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: InkWell(
          onTap: () {
            // Handle tap event - could navigate to video details
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Thumbnail
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget.vidThumbnail,
                          width: 120,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 120,
                              height: 80,
                              color: Colors.grey[300],
                              child: const Icon(Icons.video_library),
                            );
                          },
                        )),
                    const SizedBox(width: 7),
                    // Video details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.vidTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CircleAvatar(
                                  radius: 15,
                                  child: Image.network(widget.chanelLogo),
                                ),
                              ),
                              const SizedBox(width: 1),
                              Text(
                                widget.chanelName,
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 7),
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 1),
                              Text(
                                widget.vidTime,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 1),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 110,
                                    child: widget.isNewReleased == true
                                        ? Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            color: Colors.red,
                                            child: Text('New Release',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center))
                                        : Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            color: Colors.green,
                                            child: Text('Classic Gems',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center)),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 90,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        color: Colors.indigo,
                                        child: Text(widget.vidTags,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
