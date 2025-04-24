//this   object that will be used to store the data from the strapi event
class CalendarStrapiEvent {
  final String title;
  final String date;
  final String vidThumb;
  final String vidUrl;
  final String vidId;
  final String channelName;
  final String channelId;
  final String channelLogo;
  // Add other relevant fields from your Strapi event data

  const CalendarStrapiEvent(this.vidThumb, this.vidUrl, this.vidId,
      this.channelName, this.channelId, this.channelLogo,
      {required this.title, required this.date});

  @override
  String toString() => title;
}
