class VideoCard {
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

  const VideoCard({
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
  });

  factory VideoCard.fromJson(Map<String, dynamic> json) {
    // No need to look for 'attributes' - the fields are directly in json
    String resolveImage(Map<String, dynamic>? data) {
      if (data == null) return '';
      final url = data['url'];
      return url != null ? 'https://strapi-reco.onrender.com$url' : '';
    }

    return VideoCard(
      chanelName: json['chanelName'] ?? '',
      chanelLogo: resolveImage(json['chanelLogo']),
      chanelsTags: json['chanelsTags'] ?? '',
      channelId: int.tryParse(json['channelId']?.toString() ?? '0') ?? 0,
      vidTitle: json['vidTitle'] ?? 'still getting data',
      vidId: int.tryParse(json['vidId']?.toString() ?? '0') ?? 0,
      vidDuration: json['vidDuration'] ?? '',
      vidDate: json['vidDate'] ?? '',
      vidThumbnail: resolveImage(json['vidThumbnail']),
      vidLink: json['vidLink'] ?? '',
      vidDescription: json['vidDescription'] ?? '',
      vidPlatform: resolveImage(json['vidPlatform']),
    );
  }
}
