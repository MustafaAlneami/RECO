// // This file should be saved as event_stuff.dart

import 'package:flutter/material.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';
import 'package:reco_is_here/presentation/screens/home/widgets/details_page/details_view.dart';

// Function to get event hashcode for LinkedHashMap
int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

// Event class for calendar
class Event {
  final String title;
  final CalendarStrapiEvent? strapiEvent;

  Event(this.title, {this.strapiEvent});

  // Factory constructor to create Event from CalendarStrapiEvent
  factory Event.fromStrapiEvent(CalendarStrapiEvent event) {
    return Event(
      event.vidTitle,
      strapiEvent: event,
    );
  }

  @override
  String toString() => title;
}

// Calendar event card to display events in a list
class CalendarEventCard extends StatelessWidget {
  final Event event;

  const CalendarEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final strapiEvent = event.strapiEvent;

    if (strapiEvent == null) {
      return ListTile(
        title: Text(event.title),
        subtitle: Text('No details available'),
      );
    }

    return SizedBox(
      height: 150,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsView(
                          chanelName: strapiEvent.chanelName,
                          chanelsTags: strapiEvent.chanelsTags,
                          vidTitle: strapiEvent.vidTitle,
                          vidDuration: strapiEvent.vidDuration,
                          vidDate: strapiEvent.eventDate.toString(),
                          vidLink: strapiEvent.vidLink,
                          vidDescription: strapiEvent.vidDescription,
                          chanelLogo: strapiEvent.chanelLogo,
                          vidThumbnail: strapiEvent.vidThumbnail,
                          vidPlatform: strapiEvent.vidPlatform,
                          isNewReleased: strapiEvent.isNewReleased,
                          vidTime: strapiEvent.vidTime,
                        )));
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
                        child: Image.network(
                          strapiEvent.vidThumbnail,
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
                            strapiEvent.vidTitle,
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
                                  child: Image.network(strapiEvent.chanelLogo),
                                ),
                              ),
                              const SizedBox(width: 1),
                              Text(
                                strapiEvent.chanelName,
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 7),
                              Icon(
                                Icons.access_time,
                                size: 12,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 1),
                              Text(
                                strapiEvent.vidTime,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 1),
                              Row(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: strapiEvent.isNewReleased
                                        ? Colors.red
                                        : Colors.green,
                                    child: SizedBox(
                                      height: 22,
                                      width: 95,
                                      child: Center(
                                        child: Text(
                                          strapiEvent.isNewReleased
                                              ? 'New Released'
                                              : 'Classic Gems',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 22,
                                    width: 97,
                                    child: Card(
                                        margin: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        color: Colors.indigo,
                                        child: Text(strapiEvent.chanelsTags,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
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
