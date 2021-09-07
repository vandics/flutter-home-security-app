import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:michael_app/views/livestream/body.dart';

class Livestream extends StatelessWidget {
  const Livestream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Live-Stream',
          style: GoogleFonts.quicksand(
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Body(),
    );
  }
}

// Center(
//         child: AspectRatio(
//           aspectRatio: 16 / 9,
//           child: BetterPlayer.network(
//             'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4',
//             betterPlayerConfiguration:
//                 BetterPlayerConfiguration(aspectRatio: 16 / 9),
//           ),
//         ),
//       ),
