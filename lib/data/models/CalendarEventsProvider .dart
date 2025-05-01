// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:reco_is_here/data/network/api_service.dart';
// import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';
// import 'package:reco_is_here/presentation/screens/calender/event_stuff.dart';
// import 'dart:collection';
// import 'package:table_calendar/table_calendar.dart';

// class CalendarEventsProvider extends ChangeNotifier {
//   LinkedHashMap<DateTime, List<Event>> _strapiEvents = LinkedHashMap(
//     equals: isSameDay,
//     hashCode: getHashCode,
//   );

//   LinkedHashMap<DateTime, List<Event>> get strapiEvents => _strapiEvents;

//   bool _isLoaded = false;
//   bool get isLoaded => _isLoaded;

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;

//   final ApiService _apiService = ApiService();

//   CalendarEventsProvider();

//   /// 🔁 Normalize date to ensure consistent day-only keys
//   DateTime _normalizeDate(DateTime date) {
//     return DateTime(date.year, date.month, date.day);
//   }

//   List<Event> getEventsForDay(DateTime day) {
//     final normalizedDay = _normalizeDate(day);
//     print('Looking for events on: ${day.toIso8601String()}');
//     print('Available keys:');
//     _strapiEvents.forEach((key, value) {
//       print(' -> ${key.toIso8601String()} has ${value.length} events');
//     });

//     return _strapiEvents[normalizedDay] ?? [];
//   }

//   Future<void> fetchAndFormatStrapiEvents() async {

//     if (_isLoading) return;

//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       print('Fetching events from API...');
//       List fetchedData = await _apiService.fetchVideoCards();
//       print('Fetched ${fetchedData.length} events from API');

//       final newEvents = LinkedHashMap<DateTime, List<Event>>(
//         equals: isSameDay,
//         hashCode: getHashCode,
//       );

//       if (fetchedData.isEmpty) {
//         _errorMessage = 'No events available from the API';
//         _isLoading = false;
//         _isLoaded = true;
//         notifyListeners();
//         return;
//       }

//       for (var item in fetchedData) {
//         try {
//           CalendarStrapiEvent strapiEvent = CalendarStrapiEvent.fromJson(item);
//           Event event = Event.fromStrapiEvent(strapiEvent);
//           final dateKey = _normalizeDate(strapiEvent.eventDate);

//           print(
//               'Mapping event "${strapiEvent.vidTitle}" to date: ${DateFormat('yyyy-MM-dd').format(dateKey)}');

//           if (newEvents.containsKey(dateKey)) {
//             newEvents[dateKey]!.add(event);
//           } else {
//             newEvents[dateKey] = [event];
//           }
//         } catch (e) {
//           print('Error processing individual event: $e');
//         }
//       }

//       if (newEvents.isEmpty) {
//         print('No events were successfully mapped. Adding test event.');
//         bool hasTestDate = fetchedData.any((item) =>
//             item['vidDate'] == '4/4/2025' ||
//             item['vidDate']?.toString().contains('4/4/2025') == true);

//         DateTime eventDate =
//             hasTestDate ? DateTime(2025, 4, 4) : DateTime.now();
//         final dateKey = _normalizeDate(eventDate);

//         Map<String, dynamic> testData = fetchedData.isNotEmpty
//             ? fetchedData.first
//             : {
//                 'vidId': 12345,
//                 'vidTitle': 'Test Event Bro',
//                 'vidDescription': 'Test Description',
//                 'vidTime': '12:00',
//                 'vidDuration': '1:00',
//                 'vidThumbnail': '',
//                 'vidLink': '',
//                 'vidPlatform': 'Test',
//                 'chanelName': 'Test Channel',
//                 'chanelLogo': '',
//                 'chanelsTags': '',
//                 'channelId': 0,
//                 'vidDate': DateFormat('M/d/yyyy').format(eventDate),
//               };

//         CalendarStrapiEvent testStrapiEvent =
//             CalendarStrapiEvent.fromJson(testData);
//         Event testEvent = Event.fromStrapiEvent(testStrapiEvent);
//         newEvents[dateKey] = [testEvent];
//       }

//       _strapiEvents = newEvents;

//       print('Events mapped successfully:');
//       _strapiEvents.forEach((date, events) {
//         print(
//             'Date: ${DateFormat('yyyy-MM-dd').format(date)}, Events: ${events.length}');
//       });

//       _isLoaded = true;
//       _isLoading = false;
//       notifyListeners();
//     } catch (e) {
//       print('Error in fetchAndFormatStrapiEvents: $e');
//       _errorMessage = 'Error fetching events: $e';

//       DateTime today = DateTime.now();
//       final dateKey = _normalizeDate(today);

//       // _strapiEvents[dateKey] = [Event.fromStrapiEvent(testEvent)];

//       _isLoading = false;
//       _isLoaded = true;
//       notifyListeners();
//     }
//   }

//   void addTestEvent(DateTime date) {
//     final dateKey = _normalizeDate(date);

//     // if (_strapiEvents.containsKey(dateKey)) {
//     //   _strapiEvents[dateKey]!.add(Event.fromStrapiEvent(testEvent));
//     // } else {
//     //   _strapiEvents[dateKey] = [Event.fromStrapiEvent(testEvent)];
//     // }

//     notifyListeners();
//   }

//   void clearEvents() {
//     _strapiEvents.clear();
//     _isLoaded = false;
//     _errorMessage = null;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reco_is_here/data/network/api_service.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';
import 'package:reco_is_here/presentation/screens/calender/event_stuff.dart';
import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class CalendarEventsProvider extends ChangeNotifier {
  LinkedHashMap<DateTime, List<Event>> _strapiEvents = LinkedHashMap(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  LinkedHashMap<DateTime, List<Event>> get strapiEvents => _strapiEvents;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final ApiService _apiService = ApiService();

  CalendarEventsProvider();

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  List<Event> getEventsForDay(DateTime day) {
    final normalizedDay = _normalizeDate(day);
    print('Looking for events on: ${day.toIso8601String()}');
    print('Available keys:');
    _strapiEvents.forEach((key, value) {
      print(' -> ${key.toIso8601String()} has ${value.length} events');
    });

    return _strapiEvents[normalizedDay] ?? [];
  }

  Future<void> fetchAndFormatStrapiEvents() async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      print('Fetching events from API...');
      final List<dynamic> fetchedData =
          await _apiService.fetchVideoCards(); // MUST be raw JSON
      print('Fetched ${fetchedData.length} events from API');

      final newEvents = LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );

      if (fetchedData.isEmpty) {
        _errorMessage = 'No events available from the API';
        _isLoading = false;
        _isLoaded = true;
        notifyListeners();
        return;
      }

      for (var item in fetchedData) {
        try {
          // Make sure item is a Map<String, dynamic>
          if (item is! Map<String, dynamic>) {
            print('Skipping item because it’s not a JSON map: $item');
            continue;
          }

          final strapiEvent = CalendarStrapiEvent.fromJson(item);
          final event = Event.fromStrapiEvent(strapiEvent);
          final dateKey = _normalizeDate(strapiEvent.eventDate);

          print(
              'Mapping event "${strapiEvent.vidTitle}" to ${DateFormat('yyyy-MM-dd').format(dateKey)}');

          newEvents.putIfAbsent(dateKey, () => []).add(event);
        } catch (e) {
          print('❌ Error processing individual event: $e');
        }
      }

      if (newEvents.isEmpty) {
        print(
            'No events were successfully mapped. Adding fallback test event.');

        DateTime fallbackDate = DateTime(2025, 4, 4);
        final fallbackKey = _normalizeDate(fallbackDate);

        final fallbackEventData = {
          'vidId': 0,
          'vidTitle': 'Test Event',
          'vidDescription': 'Auto-added fallback',
          'vidTime': '12:00',
          'vidDuration': '1:00',
          'vidThumbnail': '',
          'vidLink': '',
          'vidPlatform': 'Test',
          'chanelName': 'Fallback Channel',
          'chanelLogo': '',
          'chanelsTags': '',
          'channelId': 0,
          'vidDate': '4/4/2025',
        };

        final fallbackStrapiEvent =
            CalendarStrapiEvent.fromJson(fallbackEventData);
        final fallbackEvent = Event.fromStrapiEvent(fallbackStrapiEvent);

        newEvents[fallbackKey] = [fallbackEvent];
      }

      _strapiEvents = newEvents;

      print('✅ Events mapped:');
      _strapiEvents.forEach((date, events) {
        print(
            '${DateFormat('yyyy-MM-dd').format(date)}: ${events.length} events');
      });

      _isLoaded = true;
    } catch (e) {
      print('❌ Error in fetchAndFormatStrapiEvents: $e');
      _errorMessage = 'Error fetching events: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addTestEvent(DateTime date) {
    final dateKey = _normalizeDate(date);
    notifyListeners();
  }

  void clearEvents() {
    _strapiEvents.clear();
    _isLoaded = false;
    _errorMessage = null;
    notifyListeners();
  }
}
