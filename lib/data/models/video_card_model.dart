class VideoCard {
  final String id;
  final String chanelName;
  final String chanelsTags;
  final String vidTitle;
  final String vidDuration;
  final String vidDate;
  final String vidLink;
  final String vidDescription;

  VideoCard({
    required this.id,
    required this.chanelName,
    required this.chanelsTags,
    required this.vidTitle,
    required this.vidDuration,
    required this.vidDate,
    required this.vidLink,
    required this.vidDescription,
  });

  factory VideoCard.fromJson(Map<String, dynamic> json) {
    final data = json['attributes'] ?? json;

    return VideoCard(
      id: json['id'].toString(),
      chanelName: data['chanelName'],
      chanelsTags: data['chanelsTags'],
      vidTitle: data['vidTitle'],
      vidDuration: data['vidDuration'],
      vidDate: data['vidDate'],
      vidLink: data['vidLink'],
      vidDescription: data['vidDescription'],
    );
  }
}
