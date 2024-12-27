import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    tz.initializeTimeZones(); // Initialize timezones for scheduling
  }

  Future<void> initializeNotifications() async {
    try {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings(
              'app_icon'); // Ensure `app_icon` is in `res/drawable`.

      const InitializationSettings initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          // Handle notification tap
          print("Notification Tapped: ${response.payload}");
        },
      );
      print("Notification initialization successful.");
    } catch (e, stack) {
      print("Error initializing notifications: $e\n$stack");
    }
  }

  Future<void> requestNotificationPermission() async {
    try {
      if (Platform.isAndroid) {
        final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
            flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>();
        final bool? granted = await androidImplementation
            ?.requestNotificationsPermission(); // Adjusted method name
        if (granted != null && granted) {
          print("Notification permission granted.");
        } else {
          print("Notification permission denied.");
        }
      }
    } catch (e, stack) {
      print("Error requesting notification permission: $e\n$stack");
    }
  }

  Future<void> showNotification({required String amount}) async {
    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'channel_description',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker',
      );

      const NotificationDetails notificationDetails =
          NotificationDetails(android: androidDetails);

      await flutterLocalNotificationsPlugin.show(
        0, // Notification ID
        "Withdrawal Alert from CITYTECH", // Title
        "Withdrawal of $amount processed successfully. Check your account for details", // Body
        notificationDetails,
        payload: 'custom_payload', // Additional data
      );
    } catch (e, stack) {
      print("Error showing notification: $e\n$stack");
    }
  }

  Future<void> cancelNotification(int id) async {
    try {
      await flutterLocalNotificationsPlugin.cancel(id);
      print("Notification with ID $id cancelled.");
    } catch (e, stack) {
      print("Error cancelling notification: $e\n$stack");
    }
  }

  Future<void> cancelAllNotifications() async {
    try {
      await flutterLocalNotificationsPlugin.cancelAll();
      print("All notifications cancelled.");
    } catch (e, stack) {
      print("Error cancelling all notifications: $e\n$stack");
    }
  }
}
