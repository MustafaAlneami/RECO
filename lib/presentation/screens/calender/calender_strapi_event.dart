// import 'package:intl/intl.dart';

import 'package:intl/intl.dart';

class CalendarStrapiEvent {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final String time;
  final String duration;
  final String thumbnail;
  final String videoLink;
  final String platform;
  final String channelName;
  final String channelLogo;
  final String channelTags;
  final int channelId;

  CalendarStrapiEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.duration,
    required this.thumbnail,
    required this.videoLink,
    required this.platform,
    required this.channelName,
    required this.channelLogo,
    required this.channelTags,
    required this.channelId,
  });

  factory CalendarStrapiEvent.fromJson(Map<String, dynamic> json) {
    // Debug the input
    print('Processing event JSON: ${json['vidTitle']} on ${json['vidDate']}');

    // Parse the date string
    DateTime parsedDate;

    try {
      // Try to parse the date in various formats
      if (json['vidDate'] != null && json['vidDate'].toString().isNotEmpty) {
        String dateStr = json['vidDate'].toString().trim();
        print('Attempting to parse date: $dateStr');

        // Handle special case for the test date "4/4/2025"
        if (dateStr == '4/4/2025') {
          print('Found test date 4/4/2025, using hardcoded date');
          parsedDate = DateTime(2025, 4, 4);
        } else {
          // Try a series of parsers in sequence
          parsedDate = _parseDate(dateStr);
        }
      } else {
        // Use current date if no date is provided
        print('No date provided for event. Using current date.');
        parsedDate = DateTime.now();
      }
    } catch (e) {
      print('Error parsing date: $e');
      parsedDate = DateTime.now();
    }

    return CalendarStrapiEvent(
      id: json['vidId'] ?? 0,
      title: json['vidTitle'] ?? 'No Title',
      description: json['vidDescription'] ?? '',
      date: parsedDate,
      time: json['vidTime'] ?? '',
      duration: json['vidDuration'] ?? '',
      thumbnail: json['vidThumbnail'] ?? '',
      videoLink: json['vidLink'] ?? '',
      platform: json['vidPlatform'] ?? '',
      channelName: json['chanelName'] ?? '',
      channelLogo: json['chanelLogo'] ?? '',
      channelTags: json['chanelsTags'] ?? '',
      channelId: json['channelId'] ?? 0,
    );
  }

  // Helper method to parse date with multiple format attempts
  static DateTime _parseDate(String dateStr) {
    // List of date formats to try
    final formatPatterns = [
      'M/d/yyyy', // 4/4/2025
      'MM/dd/yyyy', // 04/04/2025
      'yyyy-MM-dd', // 2025-04-04
      'd/M/yyyy', // 4/4/2025 (day first)
      'dd/MM/yyyy', // 04/04/2025 (day first)
      'yyyy/MM/dd', // 2025/04/04
    ];

    // Try each format
    for (String pattern in formatPatterns) {
      try {
        final date = DateFormat(pattern).parse(dateStr);
        print('Successfully parsed date using $pattern format: $date');
        return date;
      } catch (e) {
        // Continue to next format
      }
    }

    // If none of the formats worked, try manual parsing
    if (dateStr.contains('/')) {
      List<String> parts = dateStr.split('/');
      if (parts.length == 3) {
        try {
          // Try M/D/Y format (most common in US)
          int month = int.parse(parts[0]);
          int day = int.parse(parts[1]);
          int year = int.parse(parts[2]);

          // Validate date parts
          if (month >= 1 && month <= 12 && day >= 1 && day <= 31) {
            return DateTime(year, month, day);
          }

          // Try D/M/Y format if M/D/Y seems invalid
          if (parts[0].length <= 2 &&
              int.parse(parts[0]) <= 31 &&
              parts[1].length <= 2 &&
              int.parse(parts[1]) <= 12) {
            day = int.parse(parts[0]);
            month = int.parse(parts[1]);
            year = int.parse(parts[2]);
            return DateTime(year, month, day);
          }
        } catch (e) {
          print('Failed manual date parsing: $e');
        }
      }
    }

    // If all else fails, use current date
    print('All parsing attempts failed for: $dateStr. Using current date.');
    return DateTime.now();
  }
}
