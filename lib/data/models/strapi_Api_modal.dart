// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:reco_is_here/data/models/video_card_model.dart';

// class ApiService {
//   // Base URL for your Strapi API
//   final String _baseUrl = 'https://strapi-reco.onrender.com/api';

//   // Fetch video cards from Strapi
//   Future<List<dynamic>> fetchVideoCards() async {
//     try {
//       final response = await http.get(
//         Uri.parse('$_baseUrl/video-cards?populate=*'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('API Response Status: ${response.statusCode}');
//       print(
//           'API Response Body: ${response.body.substring(0, min(100, response.body.length))}...');

//       if (response.statusCode == 200) {
//         final responseBody = response.body;

//         // For testing - handle direct sample data
//         if (responseBody.contains('"vidDate":"4/4/2025"')) {
//           print('Found test data with date 4/4/2025');

//           // For testing purposes - use direct sample data
//           return [
//             {
//               'vidId': 1,
//               'vidTitle': 'Sample Video Title',
//               'vidDescription': 'Sample Video Description',
//               'vidThumbnail': 'https://example.com/thumbnail.jpg',
//               'vidLink': 'https://example.com/video',
//               'vidDate': '4/4/2025',
//               'vidTime': '14:30',
//               'vidDuration': '10:15',
//               'vidPlatform': 'YouTube',
//               'chanelName': 'Sample Channel',
//               'chanelLogo': 'https://example.com/logo.jpg',
//               'chanelsTags': 'education,technology',
//               'channelId': 101,
//             }
//           ];
//         }

//         // Regular API response parsing
//         try {
//           final Map<String, dynamic> data = jsonDecode(responseBody);

//           // Check if data contains the 'data' key (Strapi v4 format)
//           if (data.containsKey('data')) {
//             final List<dynamic> videoCardsData = data['data'];

//             // Debug output
//             print('Successfully fetched ${videoCardsData.length} video cards');

//             // Process data to match your model format
//             return videoCardsData.map((item) {
//               // Extract attributes from Strapi response
//               final attributes = item['attributes'];
//               final id = item['id'];

//               // Create a map that matches your VideoCard model structure
//               return {
//                 'vidId': id,
//                 'vidTitle': attributes['title'] ?? '',
//                 'vidDescription': attributes['description'] ?? '',
//                 'vidThumbnail': attributes['thumbnail']?['data']?['attributes']
//                         ?['url'] ??
//                     '',
//                 'vidLink': attributes['videoUrl'] ?? '',
//                 'vidDate': attributes['publishDate'] ?? '',
//                 'vidTime': attributes['publishTime'] ?? '',
//                 'vidDuration': attributes['duration'] ?? '',
//                 'vidPlatform': attributes['platform'] ?? '',
//                 'chanelName': attributes['channel']?['data']?['attributes']
//                         ?['name'] ??
//                     '',
//                 'chanelLogo': attributes['channel']?['data']?['attributes']
//                         ?['logo']?['data']?['attributes']?['url'] ??
//                     '',
//                 'chanelsTags': attributes['channel']?['data']?['attributes']
//                         ?['tags'] ??
//                     '',
//                 'channelId': attributes['channel']?['data']?['id'] ?? 0,
//               };
//             }).toList();
//           } else if (data.containsKey('vidDate')) {
//             // Direct format - return as is
//             print('Found direct data format with vidDate: ${data['vidDate']}');
//             return [data];
//           } else {
//             print('API response does not contain expected data structure');
//             // Return mock data for testing
//             return [
//               {
//                 'vidId': 999,
//                 'vidTitle': 'Fallback Video',
//                 'vidDescription':
//                     'This is a fallback video when API format is unexpected',
//                 'vidThumbnail': '',
//                 'vidLink': '',
//                 'vidDate': '4/4/2025',
//                 'vidTime': '12:00',
//                 'vidDuration': '5:00',
//                 'vidPlatform': 'Test',
//                 'chanelName': 'Test Channel',
//                 'chanelLogo': '',
//                 'chanelsTags': '',
//                 'channelId': 0,
//               }
//             ];
//           }
//         } catch (parseError) {
//           print('Error parsing JSON: $parseError');
//           // Return mock data for testing
//           return [
//             {
//               'vidId': 888,
//               'vidTitle': 'JSON Parse Error Fallback',
//               'vidDescription': 'This is a fallback when JSON parsing fails',
//               'vidThumbnail': '',
//               'vidLink': '',
//               'vidDate': '4/4/2025',
//               'vidTime': '12:00',
//               'vidDuration': '5:00',
//               'vidPlatform': 'Test',
//               'chanelName': 'Test Channel',
//               'chanelLogo': '',
//               'chanelsTags': '',
//               'channelId': 0,
//             }
//           ];
//         }
//       } else {
//         print(
//             'Failed to fetch video cards. Status code: ${response.statusCode}');
//         // Return mock data for testing
//         return [
//           {
//             'vidId': 777,
//             'vidTitle': 'API Error Fallback',
//             'vidDescription': 'This is a fallback when API call fails',
//             'vidThumbnail': '',
//             'vidLink': '',
//             'vidDate': '4/4/2025',
//             'vidTime': '12:00',
//             'vidDuration': '5:00',
//             'vidPlatform': 'Test',
//             'chanelName': 'Test Channel',
//             'chanelLogo': '',
//             'chanelsTags': '',
//             'channelId': 0,
//           }
//         ];
//       }
//     } catch (e) {
//       print('Error fetching video cards: $e');
//       // Return mock data for testing
//       return [
//         {
//           'vidId': 666,
//           'vidTitle': 'Exception Fallback',
//           'vidDescription': 'This is a fallback when an exception occurs',
//           'vidThumbnail': '',
//           'vidLink': '',
//           'vidDate': '4/4/2025',
//           'vidTime': '12:00',
//           'vidDuration': '5:00',
//           'vidPlatform': 'Test',
//           'chanelName': 'Test Channel',
//           'chanelLogo': '',
//           'chanelsTags': '',
//           'channelId': 0,
//         }
//       ];
//     }
//   }

//   // Helper function to get minimum of two integers
//   int min(int a, int b) {
//     return a < b ? a : b;
//   }

//   // Stream version if you still need it
//   Stream<String> strapiFetchVideoCardStream() {
//     return Stream.periodic(const Duration(seconds: 12), (_) async {
//       try {
//         final videoCards = await fetchVideoCards();
//         if (videoCards.isNotEmpty) {
//           final firstCard = videoCards.first;
//           return "${firstCard['vidTitle']} - ${firstCard['vidDescription']}";
//         } else {
//           return "No video cards available";
//         }
//       } catch (e) {
//         return "Error: $e";
//       }
//     }).asyncMap((event) => event);
//   }
// }
// //below is best
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // Stream<String> strapiFetchVideoCard() {
// //   //(_): The underscore means the emitted value is ignored (not used).
// //   return Stream.periodic(const Duration(seconds: 12), (_) async {
// //     final response = await http
// //         .get(Uri.parse('http://localhost:1337/api/video-cards?populate=*'));
// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //       return "${data['setup']} - ${data['punchline']}";
// //     } else {
// //       throw Exception('Failed to fetch joke');
// //     }
// //     //.asyncmap is nessiary
// //   }).asyncMap((event) => event); // Ensures async operations.
// // }
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'package:reco_is_here/data/models/video_card_model.dart';

// // class ApiService {
// //   // Base URL for your Strapi API
// //   final String _baseUrl = 'http://localhost:1337/api';

// //   // Fetch video cards from Strapi
// //   Future<List<dynamic>> fetchVideoCards() async {
// //     try {
// //       final response = await http.get(
// //         Uri.parse('$_baseUrl/video-cards?populate=*'),
// //         headers: {
// //           'Content-Type': 'application/json',
// //         },
// //       );

// //       if (response.statusCode == 200) {
// //         final Map<String, dynamic> data = jsonDecode(response.body);

// //         // Check if data contains the 'data' key (Strapi v4 format)
// //         if (data.containsKey('data')) {
// //           final List<dynamic> videoCardsData = data['data'];

// //           // Debug output
// //           print('Successfully fetched ${videoCardsData.length} video cards');

// //           // Process data to match your model format
// //           return videoCardsData.map((item) {
// //             // Extract attributes from Strapi response
// //             final attributes = item['attributes'];
// //             final id = item['id'];

// //             // Create a map that matches your VideoCard model structure
// //             return {
// //               'vidId': id,
// //               'vidTitle': attributes['title'] ?? '',
// //               'vidDescription': attributes['description'] ?? '',
// //               'vidThumbnail':
// //                   attributes['thumbnail']?['data']?['attributes']?['url'] ?? '',
// //               'vidLink': attributes['videoUrl'] ?? '',
// //               'vidDate': attributes['publishDate'] ?? '',
// //               'vidTime': attributes['publishTime'] ?? '',
// //               'vidDuration': attributes['duration'] ?? '',
// //               'vidPlatform': attributes['platform'] ?? '',
// //               'chanelName':
// //                   attributes['channel']?['data']?['attributes']?['name'] ?? '',
// //               'chanelLogo': attributes['channel']?['data']?['attributes']
// //                       ?['logo']?['data']?['attributes']?['url'] ??
// //                   '',
// //               'chanelsTags':
// //                   attributes['channel']?['data']?['attributes']?['tags'] ?? '',
// //               'channelId': attributes['channel']?['data']?['id'] ?? 0,
// //             };
// //           }).toList();
// //         } else {
// //           print('API response does not contain expected data structure');
// //           return [];
// //         }
// //       } else {
// //         print(
// //             'Failed to fetch video cards. Status code: ${response.statusCode}');
// //         return [];
// //       }
// //     } catch (e) {
// //       print('Error fetching video cards: $e');
// //       return [];
// //     }
// //   }

// //   // Stream version if you still need it
// //   Stream<String> strapiFetchVideoCardStream() {
// //     return Stream.periodic(const Duration(seconds: 12), (_) async {
// //       try {
// //         final videoCards = await fetchVideoCards();
// //         if (videoCards.isNotEmpty) {
// //           final firstCard = videoCards.first;
// //           return "${firstCard['vidTitle']} - ${firstCard['vidDescription']}";
// //         } else {
// //           return "No video cards available";
// //         }
// //       } catch (e) {
// //         return "Error: $e";
// //       }
// //     }).asyncMap((event) => event);
// //   }
// // }
//all is test
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://strapi-reco.onrender.com/api';

  Future<List<Map<String, dynamic>>> fetchVideoCards() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/video-cards?populate=*'),
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> videoCards = [];

      final body = json.decode(response.body);
      for (var item in body['data']) {
        final attributes = item['attributes'];
        final thumbnailData = attributes['thumbnail'];
        final thumbnailUrl = (thumbnailData != null &&
                thumbnailData['data'] != null &&
                thumbnailData['data']['attributes'] != null)
            ? thumbnailData['data']['attributes']['url']
            : '';

        videoCards.add({
          'id': item['id'],
          'title': attributes['title'] ?? '',
          'description': attributes['description'] ?? '',
          'tags': List<String>.from(attributes['tags'] ?? []),
          'thumbnailUrl': thumbnailUrl,
        });
      }
      return videoCards;
    } else {
      throw Exception('Failed to load video cards');
    }
  }
}
