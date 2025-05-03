// // This file should be saved as event_stuff.dart

import 'package:flutter/material.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';

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

  const CalendarEventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strapiEvent = event.strapiEvent;

    if (strapiEvent == null) {
      return ListTile(
        title: Text(event.title),
        subtitle: Text('No details available'),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
      child: ListTile(
        leading: strapiEvent.chanelLogo.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  strapiEvent.chanelLogo,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.event, size: 50),
                ),
              )
            : const Icon(Icons.event, size: 50),
        title: Text(
          strapiEvent.vidTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Channel: ${strapiEvent.chanelName}'),
            Text('Time: ${strapiEvent.vidTime}'),
            Text('Duration: ${strapiEvent.vidDuration}'),
            // Text('Platform: ${strapiEvent.vidPlatform}'),
          ],
        ),
        isThreeLine: true,
        onTap: () {
          // Show detailed view or navigate to video
          if (strapiEvent.vidLink.isNotEmpty) {
            // You could open the video link here
            // For example: launchUrl(Uri.parse(strapiEvent.videoLink));
            print('Video link tapped: ${strapiEvent.vidLink}');
          }
        },
      ),
    );
  }
}
