import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchVideoCards() async {
  final response = await http.get(
    Uri.parse('http://localhost:1337/api/video-cards?populate=*'),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData['data'];
  } else {
    throw Exception('Failed to load cards');
  }
}
