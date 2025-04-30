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
    final rawDate = json['vidDate'];
    final parsedDate = rawDate is String ? _parseDate(rawDate) : DateTime.now();

    return CalendarStrapiEvent(
      id: json['vidId'] ?? 0,
      title: json['vidTitle'] ?? '',
      description: json['vidDescription'] ?? '',
      date: parsedDate.toLocal(),
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
    final formatPatterns = [
      'M/d/yyyy',
      'MM/dd/yyyy',
      'yyyy-MM-dd',
      'd/M/yyyy',
      'dd/MM/yyyy',
      'yyyy/MM/dd',
    ];

    for (String pattern in formatPatterns) {
      try {
        return DateFormat(pattern).parse(dateStr);
      } catch (_) {}
    }

    if (dateStr.contains('/')) {
      List<String> parts = dateStr.split('/');
      if (parts.length == 3) {
        try {
          int month = int.parse(parts[0]);
          int day = int.parse(parts[1]);
          int year = int.parse(parts[2]);

          if (month >= 1 && month <= 12 && day >= 1 && day <= 31) {
            return DateTime(year, month, day);
          }

          if (parts[0].length <= 2 &&
              int.parse(parts[0]) <= 31 &&
              parts[1].length <= 2 &&
              int.parse(parts[1]) <= 12) {
            day = int.parse(parts[0]);
            month = int.parse(parts[1]);
            year = int.parse(parts[2]);
            return DateTime(year, month, day);
          }
        } catch (_) {}
      }
    }

    return DateTime.now();
  }
}
