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
        print('No events found, adding fallback event');
        final fallback = CalendarStrapiEvent.fromJson({
          'vidId': 0,
          'vidTitle': 'Test Event',
          'vidDescription': 'Auto-added fallback',
          'vidTime': '12:00',
          'vidDuration': '1:00',
          'vidPlatform': 'Test',
          'vidLink': '',
          'vidThumbnail': '',
          'chanelName': 'Fallback',
          'chanelLogo': '',
          'chanelsTags': '',
          'channelId': 0,
          'vidDate': '4/4/2025',
        });
        newMap[_normalize(fallback.eventDate)] = [
          Event.fromStrapiEvent(fallback)
        ];
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
