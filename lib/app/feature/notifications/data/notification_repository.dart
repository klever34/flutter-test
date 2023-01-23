import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freebank/core/logging/app_logger.dart';

const tag = NotificationRepository;

class NotificationRepository {
  NotificationRepository();

  final AppLogger _appLogger = AppLogger();

  Future<void> init() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    _appLogger.logInfo(message: 'FCM token: $fcmToken', tag: '$tag');
    unawaited(_handleTokenRefresh());
    unawaited(_handleForegroundMessage());
    unawaited(_handleFcmNotificationTap());
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    await _initLocalNotificationsPlugin();
  }

  Future<void> _initLocalNotificationsPlugin() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isAndroid) {
      const androidHighPriorityNotificationChannel = AndroidNotificationChannel(
        'Freebank Notification',
        'Freebank',
        description: 'This channel shows high priority notifications',
        importance: Importance.max,
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidHighPriorityNotificationChannel);
    }

    const androidInitSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const iosInitializationSettings = DarwinInitializationSettings();
    const notificationInitializationSettings = InitializationSettings(
        android: androidInitSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(
      notificationInitializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  void _onDidReceiveNotificationResponse(response) {
    // TODO(obinna): Handle notification tap from notifications plugin
  }

  Future<void> _handleFcmNotificationTap() async {
      final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage != null){
      // TODO(obinna): Handle notification tap in terminated state
    }

    await for (final remoteMessage in FirebaseMessaging.onMessageOpenedApp){
      // TODO(obinna): Handle notification tap in background state
    }
  }

  Future<void> _handleTokenRefresh() async {
    try {
      final tokenRefreshStream = FirebaseMessaging.instance.onTokenRefresh;
      await for (final token in tokenRefreshStream) {
        // TODO(obinna): Handle token refresh
      }
    } catch (e, s) {
       _appLogger.logError(message: '', tag: '$tag', error: e, stackTrace: s);
    }
  }

  Future<void> _handleForegroundMessage() async {
    try {
      final foregroundMessageStream = FirebaseMessaging.onMessage;
      await for (final remoteMessage in foregroundMessageStream) {
        _appLogger
          ..logInfo(message: 'Got a foreground message', tag: '$tag')
          ..logInfo(message: 'Message data: ${remoteMessage.data}', tag: '$tag');

        final hasNotification = remoteMessage.notification != null;

        if (hasNotification) {
          _appLogger.logInfo(
            message: 'Foreground message has a notification message',
            tag: '$tag',
          );
        }
        // TODO(obinna): Handle notification in foreground
      }
    } catch (e, s) {
      _appLogger.logError(message: '', tag: '$tag', error: e, stackTrace: s);

    }
  }
}


@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage remoteMessage) async {
  final logger = AppLogger()
    ..logInfo(message: 'Got a background message', tag: '$tag');
  await Firebase.initializeApp();
  logger
    ..logInfo(
      message: 'Got a background message',
      tag: '$tag',
    )..logInfo(message: 'Message data: ${remoteMessage.data}', tag: '$tag');
  // TODO(obinna): Handle notification in background
}
