// import 'dart:convert';
// import 'dart:io';
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
//
// import '../../res/color_print.dart';
// import '../../route/app_routes.dart';
// import '../../utils/local_storage.dart';
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// String deviceToken = '';
//
// class NotificationService {
//   static AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.high,
//   );
//
//   static Future<void> init() async {
//     await getNotificationPermission();
//     firebaseMessagingInit();
//     getMessage();
//     await FirebaseMessaging.instance.getToken();
//   }
//
//   static Future getNotificationPermission() async {
//     // await FirebaseMessaging.instance.requestPermission().then((value) {
//     FirebaseMessaging.instance.getToken().then(
//       (token) {
//         printData(key: "FCM TOKEN", value: token);
//         deviceToken = token ?? "";
//         storeDeviceInformation(deviceToken);
//       },
//     );
//     // });
//     await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//     await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
//   }
//
//   static void firebaseMessagingInit() async {
//     var initializationSettingsAndroid = const AndroidInitializationSettings('launcher_icon');
//     var initializationSettingsIOS = const DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//     );
//     var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: onSelectNotification,
//     );
//   }
//
//   static Future<dynamic> onSelectNotification(NotificationResponse notificationResponse) async {
//     debugPrint("-=-=-=-=-=-=-> onSelectNotification <-=-=-=-=-=--=-");
//     if (notificationResponse.payload != null && notificationResponse.payload!.isNotEmpty) {
//       navigation(notificationResponse.payload);
//     }
//   }
//
//   static void getMessage() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     // KILL APP
//     FirebaseMessaging.instance.getInitialMessage().then(
//       (RemoteMessage? message) async {
//         debugPrint('-=-=-=-=-=-=-> getInitialMessage <-=-=-=-=-=--');
//         if (message != null) {
//           Future.delayed(
//             const Duration(seconds: 3),
//             () {
//               navigation(message.data);
//             },
//           );
//         }
//       },
//     );
//
//     // BACKGROUND
//     FirebaseMessaging.onMessageOpenedApp.listen(
//       (RemoteMessage? message) {
//         printTitle("onMessageOpenedApp");
//         if (message != null) {
//           navigation(message.data);
//         }
//       },
//     );
//
//     // OPEN APP
//     FirebaseMessaging.onMessage.listen(
//       (RemoteMessage? message) async {
//         if (message != null) {
//           printData(key: "Title", value: message.notification?.body);
//           if (Platform.isAndroid) {
//             showNotification(remoteMessage: message);
//           }
//         } else {
//           printError(type: "Fusion getMessage", errText: 'message null');
//         }
//
//         if (message?.data["notification_type"] == "remove_member") {
//           if (Get.isRegistered<BottomBarController>() && !isValEmpty(message?.data["type_id"])) {
//             BottomBarController bottomBarCon = Get.find<BottomBarController>();
//             await bottomBarCon.removeMemberFromGroup(message?.data["type_id"].toString() ?? "");
//           }
//         }
//
//         await NotificationRepo.notificationSocketEmit();
//
//         await NotificationRepo().getNotificationCountAPI();
//       },
//     );
//     FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       badge: true,
//       alert: true,
//       sound: true,
//     );
//   }
//
//   static Future<void> showNotification({RemoteMessage? remoteMessage}) async {
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       channelDescription: channel.description,
//       priority: Priority.high,
//       importance: Importance.max,
//       color: const Color.fromARGB(255, 255, 255, 255),
//     );
//
//     DarwinNotificationDetails iOS = const DarwinNotificationDetails(
//       presentSound: true,
//       presentAlert: true,
//       presentBadge: true,
//     );
//     NotificationDetails platform = NotificationDetails(android: android, iOS: iOS);
//     await flutterLocalNotificationsPlugin.show(
//       remoteMessage!.notification.hashCode,
//       remoteMessage.notification!.title,
//       remoteMessage.notification!.body,
//       platform,
//       payload: jsonEncode(remoteMessage.data),
//     );
//   }
//
//   static navigation(payload) {
//     Map<String, dynamic> newPayload = {};
//     if (payload.runtimeType == String) {
//       newPayload = jsonDecode(payload);
//     } else {
//       newPayload = payload;
//     }
//
//     // printOkStatus(newPayload);
//     // printOkStatus(newPayload.runtimeType);
//     // printOkStatus(newPayload['notification_type']);
//     // printOkStatus(newPayload['type_id']);
//
//     switch (newPayload['notification_type'].toString().toLowerCase()) {
//       case 'chat':
//         if (LocalStorage.token.value.isNotEmpty) {
//           Get.toNamed(
//             AppRoutes.groupChatScreen,
//             arguments: {
//               "myGroupScreen": true,
//               "openInNotification": true,
//               "groupId": newPayload['type_id'] != null ? newPayload['type_id'].toString().trim() : "",
//             },
//           );
//         }
//         break;
//       case 'announcement':
//         if (LocalStorage.token.value.isNotEmpty) {
//           Get.toNamed(AppRoutes.notificationScreen);
//         }
//         break;
//       default:
//         break;
//     }
//   }
//
//   static Future<void> storeDeviceInformation(fcmToken) async {
//     final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//     try {
//       if (Platform.isAndroid) {
//         AndroidDeviceInfo androidDeviceInfo = (await deviceInfoPlugin.androidInfo);
//         await LocalStorage.storeDeviceInfo(
//           deviceID: androidDeviceInfo.id,
//           deviceTOKEN: fcmToken,
//           deviceTYPE: "android",
//         );
//       } else if (Platform.isIOS) {
//         IosDeviceInfo iosDeviceInfo = (await deviceInfoPlugin.iosInfo);
//         await LocalStorage.storeDeviceInfo(
//           deviceID: iosDeviceInfo.identifierForVendor ?? "",
//           deviceTOKEN: fcmToken,
//           deviceTYPE: "ios",
//         );
//       }
//     } catch (k) {
//       debugPrint(k.toString());
//     }
//   }
// }
