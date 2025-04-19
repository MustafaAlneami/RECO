import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reco_is_here/data/models/video_card_model.dart';

class ApiService {
  final String baseUrl =
      'https://strapi-reco.onrender.com/api/video-cards?populate=*';

  Future<List<VideoCard>> fetchVideoCards() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> data = decoded['data'];
      return data.map((item) => VideoCard.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load video cards');
    }
  }
}
