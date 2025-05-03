// // lib/presentation/screens/calender/calender_strapi_event.dart

import 'package:intl/intl.dart';

class CalendarStrapiEvent {
  final int vidId;
  final String vidTitle;
  final String vidDescription;
  final String vidTime;
  final String vidDuration;
  final String vidPlatform;
  final String vidLink;
  final String vidThumbnail;
  final String chanelName;
  final String chanelLogo;
  final String chanelsTags;
  final int channelId;
  final DateTime eventDate;

  CalendarStrapiEvent({
    required this.vidId,
    required this.vidTitle,
    required this.vidDescription,
    required this.vidTime,
    required this.vidDuration,
    required this.vidPlatform,
    required this.vidLink,
    required this.vidThumbnail,
    required this.chanelName,
    required this.chanelLogo,
    required this.chanelsTags,
    required this.channelId,
    required this.eventDate,
  });

  factory CalendarStrapiEvent.fromJson(Map<String, dynamic> json) {
    print('\n=== Parsing event: ${json['vidTitle']} ===');

    // Get the raw date string
    final raw = json['vidDate']?.toString() ?? '';
    print('Raw date string: "$raw"');

    DateTime parsed = DateTime.now(); // Initialize with current date
    bool parseSuccess = false;

    // Try different date formats
    try {
      // 1) Try ISO-8601 format (e.g. '2025-05-21T00:00:00.000Z')
      parsed = DateTime.parse(raw);
      print('✅ Successfully parsed as ISO-8601: ${parsed.toIso8601String()}');
      parseSuccess = true;
    } catch (e) {
      print('❌ Failed to parse as ISO-8601: $e');
    }

    if (!parseSuccess) {
      try {
        // 2) Try 'yyyy-MM-dd' format (e.g. '2025-05-17')
        parsed = DateFormat('yyyy-MM-dd').parse(raw);
        print(
            '✅ Successfully parsed as yyyy-MM-dd: ${parsed.toIso8601String()}');
        parseSuccess = true;
      } catch (e) {
        print('❌ Failed to parse as yyyy-MM-dd: $e');
      }
    }

    if (!parseSuccess) {
      try {
        // 3) Try 'yyyy, M, d' format (e.g. '2025, 5, 5')
        parsed = DateFormat('yyyy, M, d').parse(raw);
        print(
            '✅ Successfully parsed as yyyy, M, d: ${parsed.toIso8601String()}');
        parseSuccess = true;
      } catch (e) {
        print('❌ Failed to parse as yyyy, M, d: $e');
      }
    }

    if (!parseSuccess) {
      try {
        // 4) Try 'M/d/yyyy' format (e.g. '4/4/2025')
        parsed = DateFormat('M/d/yyyy').parse(raw);
        print('✅ Successfully parsed as M/d/yyyy: ${parsed.toIso8601String()}');
        parseSuccess = true;
      } catch (e) {
        print('❌ Failed to parse as M/d/yyyy: $e');
      }
    }

    if (!parseSuccess) {
      print('❌ All date parsing attempts failed, using current date');
    }

    // Normalize the date to remove time component
    parsed = DateTime(parsed.year, parsed.month, parsed.day);
    print('Final normalized date: ${parsed.toIso8601String()}');
    print('==========================================\n');

    // Handle string IDs by extracting numbers
    int parseId(String? id) {
      if (id == null) return 0;
      // Extract numbers from string (e.g., "channelId4" -> 4)
      final numbers = id.replaceAll(RegExp(r'[^0-9]'), '');
      return int.tryParse(numbers) ?? 0;
    }

    return CalendarStrapiEvent(
      vidId: parseId(json['vidId']?.toString()),
      vidTitle: json['vidTitle'] as String? ?? '',
      vidDescription: json['vidDescription'] as String? ?? '',
      vidTime: json['vidTime'] as String? ?? '',
      vidDuration: json['vidDuration'] as String? ?? '',
      vidPlatform: json['vidPlatform'] as String? ?? '',
      vidLink: json['vidLink'] as String? ?? '',
      vidThumbnail: json['vidThumbnail'] as String? ?? '',
      chanelName: json['chanelName'] as String? ?? '',
      chanelLogo: json['chanelLogo'] as String? ?? '',
      chanelsTags: json['chanelsTags'] as String? ?? '',
      channelId: parseId(json['channelId']?.toString()),
      eventDate: parsed,
    );
  }
}
