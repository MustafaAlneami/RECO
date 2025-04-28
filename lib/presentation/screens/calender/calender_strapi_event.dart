//this   object that will be used to store the data from the strapi event
class CalendarStrapiEvent {
  // This class represents an event fetched from Strapi.
// It contains all the necessary fields to describe
// an event, such as title, date, video details, and channel information.
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
  // Overrides the default `toString()`
  //method to return the title of the event. when i call print on
  //the calender strapi object
  // This makes it easier to debug or log the object,
  //as printing the object will display its title.

  @override
  String toString() => title;
}
