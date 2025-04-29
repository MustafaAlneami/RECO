// In your provider (e.g., CalendarEventsProvider)

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reco_is_here/data/models/video_card_model.dart';
import 'package:reco_is_here/data/network/api_service.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';
import 'package:reco_is_here/presentation/screens/calender/event_stuff.dart';
import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';
// Import your CalendarStrapiEvent model and API service

class CalendarEventsProvider extends ChangeNotifier {
  DateTime parseVidDate(String dateStr) {
    // Converts "24/12/2025" into a DateTime object
    return DateFormat('dd/MM/yyyy').parse(dateStr);
  }

  Map<DateTime, List<VideoCard>> buildEventMap(List<VideoCard> videos) {
    final Map<DateTime, List<VideoCard>> map = {};

    for (var video in videos) {
      final DateTime date = parseVidDate(video.vidDate);

      final DateTime key =
          DateTime(date.year, date.month, date.day); // Normalize

      if (map[key] == null) {
        map[key] = [video];
      } else {
        map[key]!.add(video);
      }
    }

    return map;
  }

  //added this to the provider to use it in event lauder
  late Map<DateTime, List<VideoCard>> calendarEvents;

  void loadDataFromStrapi(List<VideoCard> data) {
    calendarEvents = buildEventMap(data);
    notifyListeners(); // if using Provider
  }

  LinkedHashMap<DateTime, List<Event>> _strapiEvents = LinkedHashMap(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  LinkedHashMap<DateTime, List<Event>> get strapiEvents => _strapiEvents;

  Future<void> fetchAndFormatStrapiEvents() async {
    try {
      // 1. Fetch data from Strapi
      List fetchedData = await ApiService().fetchVideoCards();
      print('Fetched ${fetchedData.length} events from API');

      List<CalendarStrapiEvent> fetchedEvents =
          fetchedData.map((e) => CalendarStrapiEvent.fromJson(e)).toList();

      // 2. Transform and organize into the required format
      _strapiEvents.clear();
      for (var strapiEvent in fetchedEvents) {
        final date = DateTime.utc(strapiEvent.date.year, strapiEvent.date.month,
            strapiEvent.date.day);

        // Store the actual CalendarStrapiEvent object
        if (_strapiEvents.containsKey(date)) {
          _strapiEvents[date]!.add(Event.fromStrapiEvent(strapiEvent));
        } else {
          _strapiEvents[date] = [Event.fromStrapiEvent(strapiEvent)];
        }
      }

      // Debug output to verify events are properly loaded
      _strapiEvents.forEach((key, value) {
        print('Date: $key, Events: ${value.length}');
      });

      notifyListeners();
    } catch (e) {
      print('Error fetching events: $e');
    }
  }
}
