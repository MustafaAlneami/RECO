class CalendarStrapiEvent {
  final String title;
  final String time;
  final String vidUrl;
  final String vidId;
  final String channelName;
  final String channelId;
  final String channelLogo;
  final DateTime date;
  // DateTime parseDateString(String dateString) {
  //   return DateFormat('dd/MM/yyyy').parse(dateString);
  // }

  const CalendarStrapiEvent(
    this.vidUrl,
    this.vidId,
    this.channelName,
    this.channelId,
    this.channelLogo, {
    required this.title,
    required this.time,
    required this.date,
  });

  factory CalendarStrapiEvent.fromJson(Map<String, dynamic> json) {
    return CalendarStrapiEvent(
      json['vidUrl'],
      json['vidId'],
      json['channelName'],
      json['channelId'],
      json['channelLogo'],
      title: json['title'],
      time: json['time'],
      date: DateTime.parse(json['date']),
    );
  }

  @override
  String toString() => title;
}
