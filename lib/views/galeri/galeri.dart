import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:michael_app/views/galeri/body.dart';

class Galeri extends StatelessWidget {
  const Galeri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          'Galeri',
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
