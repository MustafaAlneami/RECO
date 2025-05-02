import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reco_is_here/data/models/video_card_model.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';

class ApiService {
  final String _baseUrl = 'https://strapi-reco.onrender.com/api';

  Future<Map<String, List<dynamic>>> fetchVideoCardsAndCalendarEvents() async {
    print('\n=== FETCHING EVENTS FROM API ===');
    print('Making request to: $_baseUrl/video-cards?populate=*');

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/video-cards?populate=*'),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 200) {
        print('❌ API Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load video cards: ${response.statusCode}');
      }

      final body = json.decode(response.body);
      print('Decoded response body: $body');

      if (body == null) {
        print('❌ Response body is null');
        throw Exception('Response body is null');
      }

      if (body['data'] == null) {
        print('❌ No data found in response');
        return {
          'videoCards': [],
          'calendarEvents': [],
        };
      }

      final List<VideoCard> videoCards = [];
      final List<Map<String, dynamic>> calendarEvents = [];

      for (var item in body['data']) {
        print('\nProcessing item: $item');

        if (item == null) {
          print('❌ Item is null, skipping');
          continue;
        }

        // Create the event data directly from the item
        final mapData = {
          'vidId': item['id'] ?? 0,
          'vidTitle': item['vidTitle'] ?? '',
          'vidDescription': item['vidDescription'] ?? '',
          'vidTime': item['vidTime'] ?? '',
          'vidDuration': item['vidDuration'] ?? '',
          'vidDate': item['vidDate'] ?? '',
          'vidPlatform': item['vidPlatform'] ?? '',
          'vidLink': item['vidLink'] ?? '',
          'vidThumbnail': item['vidThumbnail'] ?? '',
          'chanelName': item['chanelName'] ?? '',
          'chanelLogo': item['chanelLogo'] ?? '',
          'chanelsTags': item['chanelsTags'] ?? '',
          'channelId': item['channelId'] ?? 0,
        };

        print('Created mapData: $mapData');
        calendarEvents.add(mapData);
      }

      print('\nTotal events processed: ${calendarEvents.length}');
      print('==========================================\n');

      return {
        'videoCards': videoCards,
        'calendarEvents': calendarEvents,
      };
    } catch (e, stackTrace) {
      print('❌ Error in fetchVideoCardsAndCalendarEvents: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }
}
