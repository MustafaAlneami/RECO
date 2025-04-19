import 'dart:convert';
import 'package:http/http.dart' as http;

Stream<String> strapiFetchVideoCard() {
  //(_): The underscore means the emitted value is ignored (not used).
  return Stream.periodic(const Duration(seconds: 12), (_) async {
    final response = await http
        .get(Uri.parse('http://localhost:1337/api/video-cards?populate=*'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return "${data['setup']} - ${data['punchline']}";
    } else {
      throw Exception('Failed to fetch joke');
    }
    //.asyncmap is nessiary
  }).asyncMap((event) => event); // Ensures async operations.
}
