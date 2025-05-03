import 'package:flutter/material.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';

class TestCalendar extends StatefulWidget {
  const TestCalendar({
    super.key,
  });

  @override
  State<TestCalendar> createState() => _TestCalendar();
}

class _TestCalendar extends State<TestCalendar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: InkWell(
          onTap: () {
            // Handle tap event - could navigate to video details
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Thumbnail
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'images/t1.jpg',
                      width: 120,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 120,
                          height: 80,
                          color: Colors.grey[300],
                          child: const Icon(Icons.video_library),
                        );
                      },
                    )),
                const SizedBox(width: 12),
                // Video details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'De Musto is back baby ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CircleAvatar(
                              radius: 15,
                              child: Image.asset('images/creator3.jpg'),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'De Mustoo',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                ' 10:00 Am',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.visibility,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'YT',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                height: 33,
                                width: 125,
                                decoration: BoxDecoration(

                                    // borderRadius: BorderRadius.circular(1),
                                    ),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: Colors.green,
                                    child: Text('New Release ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center)),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Container(
                                height: 33,
                                width: 50,
                                decoration: BoxDecoration(

                                    // borderRadius: BorderRadius.circular(1),
                                    ),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    color: Colors.indigo,
                                    child: Text('#Code',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
