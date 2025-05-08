import 'package:flutter/material.dart';
import 'package:reco_is_here/core/constants/app_colors.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsView();
}

class _DetailsView extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Add this line
          children: [
            //expanded used to
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 220,
                    child: Card(
                      elevation: 5,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 360,
                              height: 250,
                              //color: Colors.green,
                              child: Image.asset(
                                'images/t1.jpg',
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                      'images/video-placeholder.png',
                                      fit: BoxFit.fill);
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: SizedBox(
                              width: 35,
                              height: 35,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'images/yt logo.avif',
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                        'images/image_placeholder.png',
                                        fit: BoxFit.fill);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Divider(thickness: 1, color: Colors.grey),

                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/creator3.jpg',
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                        'images/profile_placeholder.jpg',
                                        fit: BoxFit.fill);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 100,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: AppColors.pinkyone,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'De Musto',
                                  //  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Text(
                                'welcome guys to this welcome guys to this welcome guys to this welcome guys to this welcome guys to this   ',
                                style: TextStyle(
                                    fontSize: 20,
                                    // TODO: Focus on the text probties abgout the load text
                                    // TODO: make it for all the project texts

                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.red,
                              child: SizedBox(
                                height: 25,
                                width: 120,
                                child: Center(
                                  child: Text(
                                    'New Released',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.indigo,
                              child: SizedBox(
                                height: 25,
                                width: 80,
                                child: Center(
                                  child: Text(
                                    'coding',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.blueGrey,
                              child: SizedBox(
                                height: 25,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'YouTube',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Colors.grey.shade200, width: 0.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(10),
                          horizontalInside:
                              BorderSide(color: Colors.grey, width: 0.5),
                        ),
                        columnWidths: const {
                          0: FlexColumnWidth(1.2),
                          1: FlexColumnWidth(0.8),
                        },
                        children: [
                          // Duration row
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.indigo.shade50,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          '⏱️',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        'Duration:',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              color: Colors.pink,
                                              blurRadius: 1,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    '10:23',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.pinkyone,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.pink,
                                          blurRadius: 0.2,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Date row
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.indigo.shade50,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          '📅',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        'Date:',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              color: Colors.pink,
                                              blurRadius: 1,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    '4th June 2025',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.pinkyone,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.pink,
                                          blurRadius: 0.2,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Time row
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.indigo.shade50,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          '🕙',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        'Time:',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              color: Colors.pink,
                                              blurRadius: 1,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    '10:23 GMT',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.pinkyone,
                                      fontWeight: FontWeight.bold,
                                      //TODO: review the table stuff
                                      shadows: [
                                        Shadow(
                                          color: Colors.pink,
                                          blurRadius: 0.2,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Description : ',
                          //  textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De MustoDe Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De MustoDe Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De MustoDe Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De MustoDe Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto De Musto ',
                      //  textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.all(1),
                    width: 180,
                    height: 40,
                    // color: Color(0xFFF6C1D7),

                    child: Text(
                      'RECO ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                InkWell(
                  onTap: () {
                    // widget.vidLink;
                    // print('vidLink: ${widget.vidLink}');
                    // _launchURL(widget.vidLink);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF6C1D7),
                        borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(1),
                    width: 180,
                    height: 40,
                    child: Text(
                      'Watch ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}

//tested class of notch

// 🟦 1. Create a CustomClipper to define your shape
// class SquareNotchClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final double notchWidth = 30; // 👈 Width of the square notch
//     final double notchHeight = 20; // 👈 Height of the notch

//     final Path path = Path();

//     // Start from top-left
//     path.moveTo(0, 0);

//     // Go to left side of the notch
//     path.lineTo((size.width - notchWidth) / 2, 0);

//     // Go down into the notch
//     path.lineTo((size.width - notchWidth) / 2, notchHeight);

//     // Go right across the notch
//     path.lineTo((size.width + notchWidth) / 2, notchHeight);

//     // Go up out of the notch
//     path.lineTo((size.width + notchWidth) / 2, 0);

//     // Continue to top-right
//     path.lineTo(size.width, 0);

//     // Right side
//     path.lineTo(size.width, size.height);

//     // Bottom side
//     path.lineTo(0, size.height);

//     // Close the path
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
