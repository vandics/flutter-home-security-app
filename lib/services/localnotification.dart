import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  static final NotificationServices _notificationService =
      NotificationServices._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationServices() {
    return _notificationService;
  }

  NotificationServices._internal();

  static const channel_id = "007";

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('notification');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: null,
      macOS: null,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotification(String text, String channelid, int id) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      'Peringatan',
      text,
      NotificationDetails(
        android: AndroidNotificationDetails(
            channelid, "Mobile App Home Security", text,
            enableVibration: true,
            importance: Importance.max,
            priority: Priority.max),
      ),
    );
  }
}
