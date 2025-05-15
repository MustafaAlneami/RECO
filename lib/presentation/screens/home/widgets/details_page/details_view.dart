import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:reco_is_here/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends StatefulWidget {
  //channel properties
  final String chanelName;
  final String chanelLogo;
  final String chanelsTags;
  //final int channelId;
  //
  //vids properties
  final String vidTitle;
  //final int vidId;
  final String vidDuration;
  final String vidDate;
  final String vidThumbnail;
  final String vidLink;
  final String vidDescription;
  final String vidPlatform;
  bool isNewReleased;
  final String vidTime;

  DetailsView(
      {super.key,
      required this.chanelName,
      required this.chanelLogo,
      required this.chanelsTags,
      required this.vidTitle,
      required this.vidDuration,
      required this.vidDate,
      required this.vidThumbnail,
      required this.vidLink,
      required this.vidDescription,
      required this.vidPlatform,
      required this.isNewReleased,
      required this.vidTime});

  @override
  State<DetailsView> createState() => _DetailsView();
}

class _DetailsView extends State<DetailsView> {
  late InfiniteScrollController controller;

  late ScrollController listViewController;
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = InfiniteScrollController(initialItem: selectedIndex);
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    listViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.indigo), // 🔙 Back arrow color

          title: const Text('🎥 DETAILS',
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
          // backgroundColor: Colors.white70, // light pink
          centerTitle: true,
          elevation: 0,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Add this line
              children: [
                //expanded used to
                Expanded(
                  child: ListView(
                    controller: listViewController,
                    children: [
                      SizedBox(
                        height: 220,
                        child: Card(
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              _launchURL(widget.vidLink);
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    width: 360,
                                    height: 250,
                                    //  color: Colors.indigo.withValues(alpha: 0.5),
                                    child: Image.network(
                                      widget.vidThumbnail,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            'images/video-placeholder.png',
                                            fit: BoxFit.fill);
                                      },
                                    ),
                                  ),
                                ),
                                //the blue backgraound above it
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                      width: 360,
                                      height: 250,
                                      color:
                                          Colors.indigo.withValues(alpha: 0.5),
                                      child: Center(
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 100,
                                        ),
                                      )),
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
                                        errorBuilder:
                                            (context, error, stackTrace) {
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
                                    child: Image.network(
                                      widget.chanelLogo,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                      widget.chanelName,
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
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Text(
                                    widget.vidTitle,
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: widget.isNewReleased
                                      ? Colors.red
                                      : Colors.green,
                                  child: SizedBox(
                                    height: 22,
                                    width: 95,
                                    child: Center(
                                      child: Text(
                                        widget.isNewReleased
                                            ? 'New Released'
                                            : 'Classic Gems',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
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
                                    width: 115,
                                    child: Center(
                                      child: Text(
                                        widget.chanelsTags,
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
                        height: 20,
                      ),

                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border:
                      //         Border.all(color: Colors.grey.shade200, width: 0.5),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black.withAlpha(10),
                      //         blurRadius: 4,
                      //         offset: Offset(0, 2),
                      //       ),
                      //     ],
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     //learn the table and delete it now and change the stuff
                      //     child: Table(
                      //       border: TableBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         horizontalInside:
                      //             BorderSide(color: Colors.grey, width: 0.5),
                      //       ),
                      //       columnWidths: const {
                      //         0: FlexColumnWidth(1.2),
                      //         1: FlexColumnWidth(0.8),
                      //       },
                      //       children: [
                      //         // Duration row
                      //         TableRow(
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //           ),
                      //           children: [
                      //             TableCell(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(12.0),
                      //                 child: Row(
                      //                   children: [
                      //                     Container(
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.indigo.shade50,
                      //                         borderRadius:
                      //                             BorderRadius.circular(8),
                      //                       ),
                      //                       padding: EdgeInsets.all(8),
                      //                       child: Text(
                      //                         '⏱️',
                      //                         style: TextStyle(fontSize: 20),
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: 12),
                      //                     Text(
                      //                       'Duration:',
                      //                       style: TextStyle(
                      //                         fontSize: 18,
                      //                         color: AppColors.primaryColor,
                      //                         fontWeight: FontWeight.bold,
                      //                         shadows: [
                      //                           Shadow(
                      //                             color: Colors.pink,
                      //                             blurRadius: 1,
                      //                             offset: Offset(0, 1),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //             TableCell(
                      //               verticalAlignment:
                      //                   TableCellVerticalAlignment.middle,
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(12.0),
                      //                 child: Text(
                      //                   '10:23',
                      //                   style: TextStyle(
                      //                     fontSize: 16,
                      //                     color: AppColors.pinkyone,
                      //                     fontWeight: FontWeight.bold,
                      //                     shadows: [
                      //                       Shadow(
                      //                         color: Colors.pink,
                      //                         blurRadius: 0.2,
                      //                         offset: Offset(0, 1),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),

                      //         // Date row
                      //         TableRow(
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //           ),
                      //           children: [
                      //             TableCell(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(12.0),
                      //                 child: Row(
                      //                   children: [
                      //                     Container(
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.indigo.shade50,
                      //                         borderRadius:
                      //                             BorderRadius.circular(8),
                      //                       ),
                      //                       padding: EdgeInsets.all(8),
                      //                       child: Text(
                      //                         '📅',
                      //                         style: TextStyle(fontSize: 20),
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: 12),
                      //                     Text(
                      //                       'Date:',
                      //                       style: TextStyle(
                      //                         fontSize: 18,
                      //                         color: AppColors.primaryColor,
                      //                         fontWeight: FontWeight.bold,
                      //                         shadows: [
                      //                           Shadow(
                      //                             color: Colors.pink,
                      //                             blurRadius: 1,
                      //                             offset: Offset(0, 1),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //             TableCell(
                      //               verticalAlignment:
                      //                   TableCellVerticalAlignment.middle,
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(12.0),
                      //                 child: Text(
                      //                   '4th June 2025',
                      //                   style: TextStyle(
                      //                     fontSize: 16,
                      //                     color: AppColors.pinkyone,
                      //                     fontWeight: FontWeight.bold,
                      //                     shadows: [
                      //                       Shadow(
                      //                         color: Colors.pink,
                      //                         blurRadius: 0.2,
                      //                         offset: Offset(0, 1),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),

                      //         // Time row
                      //         TableRow(
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //           ),
                      //           children: [
                      //             TableCell(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(12.0),
                      //                 child: Row(
                      //                   children: [
                      //                     Container(
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.indigo.shade50,
                      //                         borderRadius:
                      //                             BorderRadius.circular(8),
                      //                       ),
                      //                       padding: EdgeInsets.all(8),
                      //                       child: Text(
                      //                         '🕰️',
                      //                         style: TextStyle(
                      //                             fontSize: 20,
                      //                             color: Colors.white),
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: 12),
                      //                     Text(
                      //                       'Time:',
                      //                       style: TextStyle(
                      //                         fontSize: 18,
                      //                         color: Colors.indigo,
                      //                         fontWeight: FontWeight.bold,
                      //                         shadows: [
                      //                           Shadow(
                      //                             color: Colors.indigo,
                      //                             blurRadius: 5,
                      //                             offset: Offset(0, 1),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //             TableCell(
                      //               verticalAlignment:
                      //                   TableCellVerticalAlignment.middle,
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(12.0),
                      //                 child: Text(
                      //                   '10:23 GMT',
                      //                   style: TextStyle(
                      //                     fontSize: 18,
                      //                     color: Colors.pink,
                      //                     fontWeight: FontWeight.bold,
                      //                     //TODO: review the table stuff
                      //                     shadows: [
                      //                       Shadow(
                      //                         color: Colors.pink,
                      //                         blurRadius: 4,
                      //                         offset: Offset(0, 1),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      //TODO   debugShowCheckedModeBanner: false,

                      //this is new carousel
                      SizedBox(
                        height: 115,
                        child: InfiniteCarousel.builder(
                          itemCount: 3,
                          itemExtent: MediaQuery.of(context).size.width - 60,
                          center: true,
                          loop: true,
                          anchor: 0.0,
                          velocityFactor: 0.5,
                          onIndexChanged: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          controller: controller,
                          itemBuilder: (context, itemIndex, realIndex) {
                            final List<Map<String, dynamic>> carouselData = [
                              {
                                'icon': '⏳',
                                'label': 'Duration :',
                                'value': widget.vidDuration,
                                'iconBg': AppColors.primaryColorTwo
                                    .withValues(alpha: 0.1),
                              },
                              {
                                'icon': '📅',
                                'label': 'Date :',
                                'value': widget.vidDate,
                                'iconBg': AppColors.primaryColorTwo
                                    .withValues(alpha: 0.1),
                              },
                              {
                                'icon': '🕰️',
                                'label': 'Time :',
                                'value': widget.vidTime,
                                'iconBg': AppColors.primaryColorTwo
                                    .withValues(alpha: 0.1),
                                'iconColor': AppColors.primaryColorTwo,
                              },
                            ];

                            final item =
                                carouselData[itemIndex % carouselData.length];

                            return AnimatedBuilder(
                              animation: controller,
                              builder: (context, child) {
                                final diff = (controller.offset -
                                    (MediaQuery.of(context).size.width - 60) *
                                        realIndex);
                                const maxPadding = 12.0;
                                final carouselRatio =
                                    (MediaQuery.of(context).size.width - 60) /
                                        maxPadding;

                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: (diff / carouselRatio).abs(),
                                    bottom: (diff / carouselRatio).abs(),
                                  ),
                                  child: child,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.indigo
                                            .withValues(alpha: 0.1),
                                        blurRadius: 20,
                                        spreadRadius: 2,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: item['iconBg'] as Color? ??
                                                Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          padding: EdgeInsets.all(14),
                                          child: Text(
                                            item['icon']!,
                                            style: TextStyle(
                                              fontSize: 28,
                                              color: item['iconColor'] ??
                                                  Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${item['label']}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              '${item['value']}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.pink,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Icon(Icons.auto_awesome,
                                            size: 30, color: Colors.indigo),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Container(
                      //   alignment: Alignment.topCenter,
                      //   child: Column(
                      //     children: [
                      //       const SizedBox(height: 20),
                      //       ElevatedButton(
                      //         child: const Text('Horizontal example'),
                      //         onPressed: () {
                      //           Navigator.of(context).push(MaterialPageRoute(
                      //               builder: (context) => const Horizontal()));
                      //         },
                      //       ),
                      //       const SizedBox(height: 30),
                      //       ElevatedButton(
                      //         child: const Text('Vertical example'),
                      //         onPressed: () {
                      //           Navigator.of(context).push(MaterialPageRoute(
                      //               builder: (context) => const Vertical()));
                      //         },
                      //       ),
                      //       const SizedBox(height: 30),
                      //       ElevatedButton(
                      //         child: const Text('Complex example'),
                      //         onPressed: () {
                      //           Navigator.of(context).push(MaterialPageRoute(
                      //               builder: (context) => const Complex()));
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
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
                          widget.vidDescription,
                          //  textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
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
        ),
      ),
    );
  }
}
