import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsView();
}

class _DetailsView extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //expanded used to
        Expanded(
          child: ListView(
            children: [Text('hola'), Text('hola'), Text('hola'), Text('hola')],
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
          height: 10,
        ),
      ],
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
