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
    final attributes = json['attributes'] ?? {};

    String resolveImage(Map<String, dynamic>? data) {
      final url = data?['attributes']?['url'];
      return url != null ? 'https://strapi-reco.onrender.com$url' : '';
    }

    return VideoCard(
      chanelName: attributes['chanelName'] ?? '',
      chanelLogo: resolveImage(attributes['chanelLogo']?['data']),
      chanelsTags: attributes['chanelsTags'] ?? '',
      channelId: int.tryParse(attributes['channelId']?.toString() ?? '0') ?? 0,
      vidTitle: attributes['vidTitle'] ?? '',
      vidId: int.tryParse(attributes['vidId']?.toString() ?? '0') ?? 0,
      vidDuration: attributes['vidDuration'] ?? '',
      vidDate: attributes['vidDate'] ?? '',
      vidThumbnail: resolveImage(attributes['vidThumbnail']?['data']),
      vidLink: attributes['vidLink'] ?? '',
      vidDescription: attributes['vidDescription'] ?? '',
      vidPlatform: resolveImage(attributes['vidPlatform']?['data']),
    );
  }
}
