import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reco_is_here/data/models/strapi_Api_modal.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';
import 'package:reco_is_here/presentation/screens/calender/event_stuff.dart';
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

  DateTime _normalize(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  List<Event> getEventsForDay(DateTime day) {
    return _strapiEvents[_normalize(day)] ?? [];
  }

  Future<void> fetchAndFormatStrapiEvents() async {
    if (_isLoading) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      print('\n=== FETCHING EVENTS ===');
      final rawList = await _apiService.fetchVideoCardsAndCalendarEvents();
      final newMap = LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );

      final calendarEvents = rawList['calendarEvents'] as List? ?? [];
      print('Processing ${calendarEvents.length} events...');

      for (var event in calendarEvents) {
        try {
          final se = CalendarStrapiEvent.fromJson(event);
          final key = _normalize(se.eventDate);
          print(
              'Mapping event "${se.vidTitle}" to date: ${key.toIso8601String()}');

          newMap.putIfAbsent(key, () => []).add(Event.fromStrapiEvent(se));
        } catch (e) {
          print('❌ Error processing event: $e');
        }
      }

      // If no real events, keep your fallback:
      if (newMap.isEmpty) {
        print('No events found, adding test events');

        // Test event for May 4th with ISO format
        final event1 = CalendarStrapiEvent.fromJson({
          'vidId': 1,
          'vidTitle': 'Test Event 1 - ISO Format',
          'vidDescription': 'Testing ISO date format',
          'vidTime': '14:00',
          'vidDuration': '1:30',
          'vidPlatform': 'Test',
          'vidLink': '',
          'vidThumbnail': '',
          'chanelName': 'Test Channel 1',
          'chanelLogo': '',
          'chanelsTags': 'test,iso',
          'channelId': 1,
          'vidDate': '2024-05-04T00:00:00.000Z',
        });
        newMap[_normalize(event1.eventDate)] = [Event.fromStrapiEvent(event1)];

        // Test event for May 5th with yyyy-MM-dd format
        final event2 = CalendarStrapiEvent.fromJson({
          'vidId': 2,
          'vidTitle': 'Test Event 2 - yyyy-MM-dd',
          'vidDescription': 'Testing yyyy-MM-dd format',
          'vidTime': '15:30',
          'vidDuration': '2:00',
          'vidPlatform': 'Test',
          'vidLink': '',
          'vidThumbnail': '',
          'chanelName': 'Test Channel 2',
          'chanelLogo': '',
          'chanelsTags': 'test,format',
          'channelId': 2,
          'vidDate': '2024-05-05',
        });
        newMap[_normalize(event2.eventDate)] = [Event.fromStrapiEvent(event2)];

        // Test event for May 15th with M/d/yyyy format
        final event3 = CalendarStrapiEvent.fromJson({
          'vidId': 3,
          'vidTitle': 'Test Event 3 - M/d/yyyy',
          'vidDescription': 'Testing M/d/yyyy format',
          'vidTime': '10:00',
          'vidDuration': '1:00',
          'vidPlatform': 'Test',
          'vidLink': '',
          'vidThumbnail': '',
          'chanelName': 'Test Channel 3',
          'chanelLogo': '',
          'chanelsTags': 'test,format',
          'channelId': 3,
          'vidDate': '5/15/2024',
        });
        newMap[_normalize(event3.eventDate)] = [Event.fromStrapiEvent(event3)];

        // Test event with invalid date format
        final event4 = CalendarStrapiEvent.fromJson({
          'vidId': 4,
          'vidTitle': 'Test Event 4 - Invalid Format',
          'vidDescription': 'Testing invalid date format',
          'vidTime': '16:00',
          'vidDuration': '1:15',
          'vidPlatform': 'Test',
          'vidLink': '',
          'vidThumbnail': '',
          'chanelName': 'Test Channel 4',
          'chanelLogo': '',
          'chanelsTags': 'test,invalid',
          'channelId': 4,
          'vidDate': 'Invalid Date Format',
        });
        newMap[_normalize(event4.eventDate)] = [Event.fromStrapiEvent(event4)];
      }

      _strapiEvents = newMap;
      _isLoaded = true;

      print('\n✅ Events mapped successfully:');
      _strapiEvents.forEach((date, events) {
        print(
            '${DateFormat('yyyy-MM-dd').format(date)}: ${events.length} events');
      });
      print('==========================================\n');
    } catch (e) {
      print('❌ Error in fetchAndFormatStrapiEvents: $e');
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearEvents() {
    _strapiEvents.clear();
    _isLoaded = false;
    _errorMessage = null;
    notifyListeners();
  }
}
