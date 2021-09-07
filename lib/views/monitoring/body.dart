import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:michael_app/bloc/monitoring/monitoring_bloc.dart';
import 'package:michael_app/views/monitoring/listmonitoring.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController linkController = TextEditingController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    getDataPeriodic();
  }

  getDataPeriodic() {
    _timer = Timer.periodic(Duration(seconds: 7), (timer) {
      BlocProvider.of<MonitroingBloc>(context).add(UpdateMonitoringEvent());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<MonitroingBloc, MonitoringState>(
      builder: (context, state) => Container(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: SafeArea(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              child: state.monitoring.length == 0
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      mainAxisSpacing: 17,
                      crossAxisSpacing: 17,
                      itemCount: menu.length,
                      itemBuilder: (context, index) => index == menu.length - 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MenuMonitoring(
                                    menu: menu[index],
                                    value: state.monitoring[index])
                              ],
                            )
                          : MenuMonitoring(
                              menu: menu[index],
                              value: state.monitoring[index],
                            ),
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.count(
                              index == menu.length - 1 ? 3 : 1, 1),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuMonitoring extends StatelessWidget {
  final MenuItemMonitoring menu;
  final String value;

  MenuMonitoring({Key? key, required this.menu, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 190.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(2, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            menu.icon,
            width: 60.w,
            height: 60.h,
          ),
          Text(
            menu.textsensor,
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                fontSize: 20.sp, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
