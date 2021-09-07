import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:michael_app/bloc/galeri/galeri_bloc.dart';
import 'package:michael_app/bloc/monitoring/monitoring_bloc.dart';
import 'package:michael_app/perloadimage.dart';
import 'package:michael_app/routes/routes.dart';
import 'package:michael_app/services/localnotification.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  Map<String, dynamic> data = message.data;
  String idd = data['id'];
  int id = int.parse(idd);
  String nama = (data['nama']);
  String channel = data['channel_id'];

  return NotificationServices().showNotification(nama, channel, id);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  await Firebase.initializeApp();
  await NotificationServices().init();
  await loadImage(AssetImage('assets/images/home.png'));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FirebaseMessaging messaging;
  //String? token;

  Future<void> saveTokenToDatabase() async {
    messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print(token);
    await FirebaseFirestore.instance.collection("users").doc("userID").update({
      'tokens': FieldValue.arrayUnion([token])
    });
  }

  @override
  void initState() {
    super.initState();

    saveTokenToDatabase();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("message received");
      // print(message.notification!.body);
      Map<String, dynamic> data = message.data;
      String idd = data['id'];
      int id = int.parse(idd);
      String nama = (data['nama']);
      String channel = data['channel_id'];
      NotificationServices().showNotification(nama, channel, id);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['id'] == '1') {
        Navigator.pushNamed(context, '/galeriscreen');
      } else {
        Navigator.pushNamed(context, '/monitoringscreen');
      }
      print('message clicked');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MonitroingBloc()),
        BlocProvider(create: (context) => GaleriBloc())
      ],
      child: ScreenUtilInit(
        designSize: Size(412, 820),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Mobile App Michael",
          initialRoute: "/splashscreen",
          routes: routes,
        ),
      ),
    );
  }
}
