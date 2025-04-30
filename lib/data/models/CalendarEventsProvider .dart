// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reco_is_here/data/network/api_service.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';
import 'package:reco_is_here/presentation/screens/calender/event_stuff.dart';
import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class CalendarEventsProvider extends ChangeNotifier {
  // Map to store events by date
  LinkedHashMap<DateTime, List<Event>> _strapiEvents = LinkedHashMap(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  LinkedHashMap<DateTime, List<Event>> get strapiEvents => _strapiEvents;

  // Flag to track if data has been loaded
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  // Flag to track if loading is in progress
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Error message
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // API service
  final ApiService _apiService = ApiService();

  // Constructor
  CalendarEventsProvider() {
    // Initialize empty at first
  }

  // Method to get events for a specific day
  List<Event> getEventsForDay(DateTime day) {
    // Find events for the given day
    final normalizedDay = DateTime.utc(day.year, day.month, day.day);
    return _strapiEvents[normalizedDay] ?? [];
  }

  Future<void> fetchAndFormatStrapiEvents() async {
    if (_isLoading) return; // Prevent multiple simultaneous calls

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      print('Fetching events from API...');

      // 1. Fetch data from Strapi
      List fetchedData = await _apiService.fetchVideoCards();
      print('Fetched ${fetchedData.length} events from API');

      // Create a new hash map for events
      final newEvents = LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );

      // Debug: Print first event to verify structure
      if (fetchedData.isNotEmpty) {
        print('First event data: ${fetchedData.first}');
      } else {
        print('No events fetched');
        _errorMessage = 'No events available from the API';
        _isLoading = false;
        _isLoaded = true;
        notifyListeners();
        return;
      }

      // Process each fetched event
      for (var item in fetchedData) {
        try {
          // Create CalendarStrapiEvent object
          CalendarStrapiEvent strapiEvent = CalendarStrapiEvent.fromJson(item);

          // Create Event object from CalendarStrapiEvent
          Event event = Event.fromStrapiEvent(strapiEvent);

          // Create date key with just year, month, day (no time)
          final dateKey = DateTime.utc(strapiEvent.date.year,
              strapiEvent.date.month, strapiEvent.date.day);

          print(
              'Mapping event "${strapiEvent.title}" to date: ${DateFormat('yyyy-MM-dd').format(dateKey)}');

          // Add event to the appropriate date
          if (newEvents.containsKey(dateKey)) {
            newEvents[dateKey]!.add(event);
          } else {
            newEvents[dateKey] = [event];
          }
        } catch (e) {
          print('Error processing individual event: $e');
          // Continue processing other events
        }
      }

      // If no events were successfully added, create a test event
      if (newEvents.isEmpty) {
        print('No events were successfully mapped. Adding test event.');

        // Check if we have a test date "4/4/2025" in the data
        bool hasTestDate = fetchedData.any((item) =>
            item['vidDate'] == '4/4/2025' ||
            item['vidDate']?.toString().contains('4/4/2025') == true);

        DateTime eventDate;
        if (hasTestDate) {
          // Use the test date
          eventDate = DateTime(2025, 4, 4);
          print('Using test date: 4/4/2025');
        } else {
          // Fall back to today
          eventDate = DateTime.now();
          print('Falling back to today\'s date');
        }

        // Create a date key
        final dateKey =
            DateTime.utc(eventDate.year, eventDate.month, eventDate.day);

        // Create a test event using data from the first item if available
        Map<String, dynamic> testData = fetchedData.isNotEmpty
            ? fetchedData.first
            : {
                'vidId': 12345,
                'vidTitle': 'Test Event Bro',
                'vidDescription': 'Test Description',
                'vidTime': '12:00',
                'vidDuration': '1:00',
                'vidThumbnail': '',
                'vidLink': '',
                'vidPlatform': 'Test',
                'chanelName': 'Test Channel',
                'chanelLogo': '',
                'chanelsTags': '',
                'channelId': 0,
              };

        // Override the date
        testData['vidDate'] = DateFormat('M/d/yyyy').format(eventDate);

        // Create a CalendarStrapiEvent
        CalendarStrapiEvent testStrapiEvent =
            CalendarStrapiEvent.fromJson(testData);

        // Create an Event
        Event testEvent = Event.fromStrapiEvent(testStrapiEvent);

        // Add to the events map
        newEvents[dateKey] = [testEvent];

        print(
            'Added test event for ${DateFormat('yyyy-MM-dd').format(dateKey)}');
      }

      // Update the events map
      _strapiEvents = newEvents;

      // Debug output
      print('Events mapped successfully:');
      _strapiEvents.forEach((date, events) {
        print(
            'Date: ${DateFormat('yyyy-MM-dd').format(date)}, Events: ${events.length}');
      });

      _isLoaded = true;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error in fetchAndFormatStrapiEvents: $e');
      _errorMessage = 'Error fetching events: $e';

      // Add a test event for today
      DateTime today = DateTime.now();
      final dateKey = DateTime.utc(today.year, today.month, today.day);

      // Create a test event
      CalendarStrapiEvent testEvent = CalendarStrapiEvent(
        id: 999,
        title: 'Calendar Test Event',
        description: 'This event was added during error recovery',
        date: today,
        time: '12:00',
        duration: '1:00',
        thumbnail: '',
        videoLink: '',
        platform: 'Test',
        channelName: 'Test Channel',
        channelLogo: '',
        channelTags: '',
        channelId: 0,
      );

      // Add to the events map
      _strapiEvents[dateKey] = [Event.fromStrapiEvent(testEvent)];

      _isLoading = false;
      _isLoaded = true;
      notifyListeners();
    }
  }

  // Helper method to add a test event for debugging
  void addTestEvent(DateTime date) {
    final dateKey = DateTime.utc(date.year, date.month, date.day);

    CalendarStrapiEvent testEvent = CalendarStrapiEvent(
      id: 12345,
      title: 'Manual Test Event',
      description: 'This is a manually added test event',
      date: date,
      time: '14:30',
      duration: '1:30',
      thumbnail: '',
      videoLink: '',
      platform: 'Manual',
      channelName: 'Manual Test',
      channelLogo: '',
      channelTags: '',
      channelId: 0,
    );

    if (_strapiEvents.containsKey(dateKey)) {
      _strapiEvents[dateKey]!.add(Event.fromStrapiEvent(testEvent));
    } else {
      _strapiEvents[dateKey] = [Event.fromStrapiEvent(testEvent)];
    }

    notifyListeners();
  }

  // Clear all events
  void clearEvents() {
    _strapiEvents.clear();
    _isLoaded = false;
    _errorMessage = null;
    notifyListeners();
  }
}
