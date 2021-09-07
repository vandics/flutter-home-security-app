import 'package:flutter/widgets.dart';
import 'package:michael_app/views/galeri/galeri.dart';
import 'package:michael_app/views/home/homescreen.dart';
import 'package:michael_app/views/livestream/livestream.dart';
import 'package:michael_app/views/monitoring/monitoringscreen.dart';
import 'package:michael_app/views/splashscreen/splashscreen.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  '/splashscreen': (context) => Splashscreen(),
  '/homescreen': (context) => Homescreen(),
  '/livestreamscreen': (context) => Livestream(),
  '/galeriscreen': (context) => Galeri(),
  '/monitoringscreen': (context) => Monitoringscreen(),
};
