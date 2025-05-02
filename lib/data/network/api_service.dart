import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reco_is_here/data/models/video_card_model.dart';

class ApiService {
  final String baseUrl =
      'https://strapi-reco.onrender.com/api/video-cards?populate=*';

  Future<List<VideoCard>> fetchVideoCards(
      {int page = 1, int limit = 10}) async {
    // Add pagination parameters to the URL
    final paginatedUrl =
        '$baseUrl&pagination[page]=$page&pagination[pageSize]=$limit';

    final response = await http.get(Uri.parse(paginatedUrl));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> data = decoded['data'];
      return data.map((item) => VideoCard.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load video cards');
    }
  }
}
//
// lib/data/network/api_service.dart

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:reco_is_here/data/models/video_card_model.dart';
// import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';

// class ApiService {
//   final String _baseUrl = 'https://strapi-reco.onrender.com/api';

//   /// Fetches only the "calendar events" payload and returns
//   /// a List of raw JSON maps ready for CalendarStrapiEvent.fromJson.
//   // Future<List<Map<String, dynamic>>> fetchCalendarEvents() async {
//   //   final resp = await http.get(Uri.parse('$_baseUrl/video-cards?populate=*'));
//   //   if (resp.statusCode != 200) {
//   //     throw Exception('Failed to load calendar events: ${resp.statusCode}');
//   //   }
//   //   final body = json.decode(resp.body)['data'] as List<dynamic>;
//   //   final List<Map<String, dynamic>> list = [];

//   //   for (var item in body) {
//   //     final attrs = item['attributes'] as Map<String, dynamic>;
//   //     final thumbData = attrs['thumbnail']?['data']?['attributes']?['url'];
//   //     list.add({
//   //       'vidId': item['id'],
//   //       'vidTitle': attrs['title'] ?? '',
//   //       'vidDescription': attrs['description'] ?? '',
//   //       'vidTime': attrs['time'] ?? '',
//   //       'vidDuration': attrs['duration'] ?? '',
//   //       'vidDate': attrs['date'] ?? '',
//   //       'vidPlatform': attrs['vidPlatform'] ?? '',
//   //       'vidLink': attrs['vidLink'] ?? '',
//   //       'vidThumbnail': thumbData ?? '',
//   //       'chanelName': attrs['chanelName'] ?? '',
//   //       'chanelLogo': attrs['chanelLogo'] ?? '',
//   //       'chanelsTags': attrs['chanelsTags'] ?? '',
//   //       'channelId': attrs['channelId'] ?? 0,
//   //     });
//   //   }
//   //   return list;
//   // }

//   Future<List<VideoCard>> fetchVideoCards(
//       {int page = 1, int limit = 10}) async {
//     // Add pagination parameters to the URL
//     final paginatedUrl =
//         '$_baseUrl&pagination[page]=$page&pagination[pageSize]=$limit';

//     final response = await http.get(Uri.parse(paginatedUrl));

//     if (response.statusCode == 200) {
//       final decoded = jsonDecode(response.body);
//       final List<dynamic> data = decoded['data'];
//       return data.map((item) => VideoCard.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load video cards');
//     }
//   }
// }
