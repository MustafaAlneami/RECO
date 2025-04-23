// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderView();
}

class _CalenderView extends State<CalenderView> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     SizedBox(
    //       height: 200,
    //       width: 200,
    //       child: Image.network(
    //         'https://drive.google.com/uc?export=view&id=1_WrACPPdvIIIObhiwh1pIBa8J7P-taDW',
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //     SizedBox(
    //       height: 200,
    //       width: 200,
    //       child: Image.network(
    //         'https://drive.google.com/uc?export=view&id=1X5LeOnVkN0LJKPpo-khrv4N6riX5IdfI',
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //   ],
    // );
    return ListView(
      children: [Text('calender baby')],
    );
  }
}
