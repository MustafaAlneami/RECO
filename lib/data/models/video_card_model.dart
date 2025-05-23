class VideoCard {
  // Channel properties
  final String chanelName;
  final String chanelLogo;
  final String chanelsTags;
  final int channelId;
  final bool isNewReleased;

  // Video properties
  final String vidTitle;
  final int vidId;
  final String vidDuration;
  final String vidDate;
  final String vidThumbnail;
  final String vidLink;
  final String vidDescription;
  final String vidPlatform;
  final String vidTime; // ✅ This is now a string

  const VideoCard(
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
    required this.isNewReleased,
  });

  factory VideoCard.fromJson(Map<String, dynamic> json) {
    return VideoCard(
      json['vidTime'] ?? '',
      isNewReleased:
          json['isNewReleased'] == false, // Positional argument for vidTime
      chanelName: json['chanelName'] ?? '',
      chanelLogo: json['chanelLogo'] ?? '', // Direct string
      chanelsTags: json['chanelsTags'] ?? '',
      channelId: int.tryParse(json['channelId']?.toString() ?? '0') ?? 0,
      vidTitle: json['vidTitle'] ?? 'still getting data',
      vidId: int.tryParse(json['vidId']?.toString() ?? '0') ?? 0,
      vidDuration: json['vidDuration'] ?? '',
      vidDate: json['vidDate'] ?? '',
      vidThumbnail: json['vidThumbnail'] ?? '', // ✅ Now it's a string
      vidLink: json['vidLink'] ?? '',
      vidDescription: json['vidDescription'] ?? '',
      vidPlatform: json['vidPlatform'] ?? '',
    );
  }
}
