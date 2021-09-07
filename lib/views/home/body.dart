import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:michael_app/bloc/monitoring/monitoring_bloc.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h, top: 20.h),
      alignment: Alignment.center,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Image.asset(
              'assets/images/home.png',
              width: 180.w,
              height: 180.h,
            ),
            Text(
              'HOME SECURITY',
              style: GoogleFonts.quicksand(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            ButtonMenu(
              herotag: 'livestream',
              text: 'Live-stream',
              press: () => Navigator.of(context).pushNamed('/livestreamscreen'),
            ),
            ButtonMenu(
              herotag: 'galeri',
              text: 'Galeri',
              press: () => Navigator.of(context).pushNamed('/galeriscreen'),
            ),
            ButtonMenu(
              herotag: 'monitoring',
              text: 'Monitoring',
              press: () {
                BlocProvider.of<MonitroingBloc>(context)
                    .add(UpdateMonitoringEvent());
                Navigator.of(context).pushNamed('/monitoringscreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonMenu extends StatelessWidget {
  final String herotag, text;
  final press;
  ButtonMenu({
    Key? key,
    required this.herotag,
    required this.press,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: FloatingActionButton(
        heroTag: herotag,
        onPressed: press,
        hoverColor: Colors.blue,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Color(0xff0A1D37), width: 3.w),
        ),
        child: Text(
          text,
          style:
              GoogleFonts.quicksand(fontSize: 20.sp, color: Color(0xff0A1D37)),
        ),
      ),
    );
  }
}
