import 'package:intl/intl.dart';

class CalendarStrapiEvent {
  // Channel properties
  final String chanelName;
  final String chanelLogo;
  final String chanelsTags;
  final int channelId;

  // Video properties
  final String vidTitle;
  final int vidId;
  final String vidDuration;
  final String vidDate;
  final String vidThumbnail;
  final String vidLink;
  final String vidDescription;
  final String vidPlatform;
  final String vidTime;

  // Computed date for calendar use
  final DateTime eventDate;

  CalendarStrapiEvent(
    this.vidTime, {
    required this.chanelName,
    required this.chanelLogo,
    required this.chanelsTags,
    required this.channelId,
    required this.vidTitle,
    required this.vidId,
    required this.vidDuration,
    required this.vidDate,
    required this.vidThumbnail,
    required this.vidLink,
    required this.vidDescription,
    required this.vidPlatform,
    required this.eventDate,
  });

  factory CalendarStrapiEvent.fromJson(Map<String, dynamic> json) {
    final rawDate = json['vidDate'] ?? '';
    final parsedDate = _parseDate(rawDate);

    return CalendarStrapiEvent(
      json['vidTime'] ?? '',
      chanelName: json['chanelName'] ?? '',
      chanelLogo: json['chanelLogo'] ?? '',
      chanelsTags: json['chanelsTags'] ?? '',
      channelId: int.tryParse(json['channelId']?.toString() ?? '0') ?? 0,
      vidTitle: json['vidTitle'] ?? 'still getting data',
      vidId: int.tryParse(json['vidId']?.toString() ?? '0') ?? 0,
      vidDuration: json['vidDuration'] ?? '',
      vidDate: rawDate,
      vidThumbnail: json['vidThumbnail'] ?? '',
      vidLink: json['vidLink'] ?? '',
      vidDescription: json['vidDescription'] ?? '',
      vidPlatform: json['vidPlatform'] ?? '',
      eventDate: parsedDate,
    );
  }

  static DateTime _parseDate(String dateStr) {
    final formatPatterns = [
      'M/d/yyyy',
      'MM/dd/yyyy',
      'yyyy-MM-dd',
      'd/M/yyyy',
      'dd/MM/yyyy',
      'yyyy/MM/dd',
    ];

    for (final pattern in formatPatterns) {
      try {
        return DateFormat(pattern).parseStrict(dateStr);
      } catch (_) {}
    }

    if (dateStr.contains('/')) {
      final parts = dateStr.split('/');
      if (parts.length == 3) {
        try {
          int part1 = int.parse(parts[0]);
          int part2 = int.parse(parts[1]);
          int part3 = int.parse(parts[2]);

          // Try MM/DD/YYYY
          if (part1 <= 12 && part2 <= 31) {
            return DateTime(part3, part1, part2);
          }
          // Try DD/MM/YYYY
          if (part1 <= 31 && part2 <= 12) {
            return DateTime(part3, part2, part1);
          }
        } catch (_) {}
      }
    }

    return DateTime.now(); // fallback
  }
}
