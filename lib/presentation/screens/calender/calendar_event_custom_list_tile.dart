import 'package:flutter/material.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';
import 'package:intl/intl.dart';

class CalenderEventCustomlisttile extends StatelessWidget {
  final CalendarStrapiEvent calendarStrapiEvent;

  const CalenderEventCustomlisttile({
    super.key,
    required this.calendarStrapiEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: calendarStrapiEvent.chanelLogo.isNotEmpty
              ? NetworkImage(calendarStrapiEvent.chanelLogo)
              : null,
          child: calendarStrapiEvent.chanelLogo.isEmpty
              ? Icon(Icons.video_library)
              : null,
        ),
        title: Text(
          calendarStrapiEvent.vidTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Time: ${calendarStrapiEvent.vidTime}'),
            Text('Channel: ${calendarStrapiEvent.chanelName}'),
            Text(
                'Date: ${DateFormat('yyyy-MM-dd').format(calendarStrapiEvent.vidDate as DateTime)}'),
          ],
        ),
        isThreeLine: true,
        onTap: () {
          // Handle event tap - maybe open the video URL
          if (calendarStrapiEvent.vidLink.isNotEmpty) {
            // Navigate to video or open URL
            print('Opening video: ${calendarStrapiEvent.vidLink}');
            // You could add navigation or URL launching here
          }
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';

// class CalenderEventCustomlisttile extends StatelessWidget {
//   final CalendarStrapiEvent calendarStrapiEvent;

//   const CalenderEventCustomlisttile({
//     Key? key,
//     required this.calendarStrapiEvent,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: InkWell(
//         onTap: () {
//           // Handle tap event - could navigate to video details
//           print('Tapped on video: ${calendarStrapiEvent.title}');
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Thumbnail
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: calendarStrapiEvent.thumbnail.isNotEmpty
//                     ? Image.network(
//                         calendarStrapiEvent.thumbnail,
//                         width: 120,
//                         height: 80,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             width: 120,
//                             height: 80,
//                             color: Colors.grey[300],
//                             child: const Icon(Icons.video_library),
//                           );
//                         },
//                       )
//                     : Container(
//                         width: 120,
//                         height: 80,
//                         color: Colors.grey[300],
//                         child: const Icon(Icons.video_library),
//                       ),
//               ),
//               const SizedBox(width: 12),
//               // Video details
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       calendarStrapiEvent.title,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 12,
//                           backgroundImage: calendarStrapiEvent
//                                   .channelLogo.isNotEmpty
//                               ? NetworkImage(calendarStrapiEvent.channelLogo)
//                               : null,
//                           child: calendarStrapiEvent.channelLogo.isEmpty
//                               ? const Icon(Icons.person, size: 12)
//                               : null,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           calendarStrapiEvent.channelName,
//                           style: TextStyle(
//                             color: Colors.grey[700],
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.access_time,
//                           size: 16,
//                           color: Colors.grey[600],
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           '${calendarStrapiEvent.time} • ${calendarStrapiEvent.duration}',
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                             fontSize: 12,
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Icon(
//                           Icons.visibility,
//                           size: 16,
//                           color: Colors.grey[600],
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           calendarStrapiEvent.platform,
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
