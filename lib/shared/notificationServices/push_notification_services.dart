import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:xticket/routes/app_routes.dart';

import 'notification_type.dart';

// Top-level function for background message handling
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Background message received: ${message.messageId}');
  // Store the route for later processing when app launches
  final route = message.data['type'];
  if (route != null) {  
    await PushNotificationService.storePendingRouteToPrefs(route);
  }
}  

// Top-level function for background notification tap
@pragma('vm:entry-point')
Future<void> notificationTapBackground(
  NotificationResponse notificationResponse,
) async {
  debugPrint(
    'Notification tapped in background: ${notificationResponse.payload}',
  );
  if (notificationResponse.payload != null) {
    try {
      final data = jsonDecode(notificationResponse.payload!);
      final route = data['type'];
      if (route != null) {
        await PushNotificationService.storePendingRouteToPrefs(route);
      }
    } catch (e) {
      debugPrint('Error parsing notification payload: $e');
    }
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
FirebaseMessaging messaging = FirebaseMessaging.instance;

class PushNotificationService {
  static String? _pendingRoute;
  static bool _isAppInitialized = false;
  static bool _isFlutterLocalNotificationsInitialized = false;

  // Initialize the notification service
  static Future<void> initialize() async {
    await _setupFlutterNotifications();
    await _setupFirebaseMessaging();
    await _checkForPendingRoute();
  }

  // Setup Flutter Local Notifications
  static Future<void> _setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) return;

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@drawable/notification_icon');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        debugPrint("Foreground notification tapped: ${response.payload}");
        await _handleNotificationTap(response.payload);
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    // Create notification channel for Android
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    _isFlutterLocalNotificationsInitialized = true;
  }

  // Setup Firebase Messaging
  static Future<void> _setupFirebaseMessaging() async {
    // Set background message handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Request permissions
    await _requestPermissions();

    // Handle messages when app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint("Foreground message: ${jsonEncode(message.data)}");
      _showLocalNotification(message);
    });

    // Handle notification tap when app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      debugPrint("Background tap - App opened: ${jsonEncode(message.data)}");
      final route = message.data['type'];
      if (route != null) {
        if (_isAppInitialized && Get.context != null) {
          await _navigateToRoute(route);
        } else {
          _pendingRoute = route;
        }
      }
    });

    // Handle initial message when app is launched from terminated state
    final RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      debugPrint(
        "App launched from notification: ${jsonEncode(initialMessage.data)}",
      );
      final route = initialMessage.data['type'];
      if (route != null) {
        _pendingRoute = route;
      }
    }
  }

  // Request permissions
  static Future<void> _requestPermissions() async {
    if (Platform.isIOS) {
      await messaging.requestPermission(alert: true, badge: true, sound: true);
      await messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  // Show local notification
  static void _showLocalNotification(RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      final title =
          notification.title ?? message.data['title'] ?? 'Notification';
      final body =
          notification.body ??
          message.data['body'] ??
          'You have a new message.';

      generateSimpleNotification(
        title: title,
        msg: body,
        payload: jsonEncode(message.data),
      );
    }
  }

  // Generate simple notification
  static void generateSimpleNotification({
    String? title,
    String? msg,
    String? payload,
    String? imageUrl,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription:
              'This channel is used for important notifications.',
          importance: Importance.max,
          priority: Priority.high,
          enableLights: true,
          enableVibration: true,
          icon: "@drawable/notification_icon",
          playSound: true,
        );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      msg,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  // Handle notification tap
  static Future<void> _handleNotificationTap(String? payload) async {
    if (payload == null) return;

    try {
      final data = jsonDecode(payload);
      final route = data['type'];
      log("notification ontap navigation roaute: $route");
      if (route != null) {
        if (_isAppInitialized && Get.context != null) {
          log("_navigateToRoute Call with this route $route");

          await _navigateToRoute(route.toString());
        } else {
          _pendingRoute = route;
        }
      }
    } catch (e) {
      debugPrint('Error parsing notification payload: $e');
    }
  }

  // Store pending route to shared preferences (for persistence across app restarts)
  static Future<void> storePendingRouteToPrefs(String route) async {
    // You can use SharedPreferences here if needed for persistence
    // For now, just store in memory
    _pendingRoute = route;
    debugPrint('Stored pending route: $route');
  }

  // Check for pending route from shared preferences
  static Future<void> _checkForPendingRoute() async {
    // You can check SharedPreferences here if you implemented persistence
    // For now, this is handled by the in-memory variable
  }

  // Mark app as initialized and handle pending routes
  static void markAppAsInitialized() {
    _isAppInitialized = true;
    debugPrint('App marked as initialized. Pending route: $_pendingRoute');

    if (_pendingRoute != null) {
      // Use post-frame callback to ensure navigation context is ready
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (Get.context != null) {
          await _navigateToRoute(_pendingRoute!);
          _pendingRoute = null;
        }
      });
    }
  }

  // Navigate to specific route based on notification type
  static Future<void> _navigateToRoute(String route) async {
    try {
      // Add small delay to ensure GetX is ready
      await Future.delayed(const Duration(milliseconds: 200));

      switch (route) {
        case NotificationType.notification:
          debugPrint("Navigating to Notification Screen");
          Get.toNamed(AppRoutes.notification);
          break;
        default:
          debugPrint("Unhandled notification route: $route");
      }
    } catch (e) {
      debugPrint("Navigation error: $e");
    }
  }

  // Get FCM token
  static Future<String?> getFcmToken() async {
    try {
      if (Platform.isIOS) {
        // Request notification permissions
        NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );

        if (settings.authorizationStatus == AuthorizationStatus.authorized) {
          // Wait until APNs token is set
          String? apnsToken;
          int retries = 0;
          while (apnsToken == null && retries < 5) {
            await Future.delayed(const Duration(seconds: 1));
            apnsToken = await messaging.getAPNSToken();
            retries++;
          }
        }
      }

      String? fcmToken = await messaging.getToken();
      debugPrint(
        fcmToken != null ? 'FCM Token: $fcmToken' : 'Failed to get FCM token.',
      );

      // Listen for token refresh
      messaging.onTokenRefresh.listen((newToken) {
        debugPrint('FCM Token refreshed: $newToken');
      });

      return fcmToken;
    } catch (e) {
      debugPrint('Error getting FCM token: $e');
      return null;
    }
  }

  static Future<void> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (status.isDenied) {
      await Permission.notification.request();
    }
  }

  // Check if notification launched app
  static Future<bool> didNotificationLaunchApp() async {
    final details =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    return details?.didNotificationLaunchApp ?? false;
  }

  // Get launch notification details
  static Future<NotificationAppLaunchDetails?> getLaunchDetails() async {
    return await flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
  }
}
