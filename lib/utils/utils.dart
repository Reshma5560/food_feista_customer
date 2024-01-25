import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../res/app_strings.dart';
import '../res/color_print.dart';
import '../res/ui_utils.dart';
import '../route/app_routes.dart';

bool isValEmpty(dynamic val) {
  String? value = val.toString();
  return (val == null ||
      value.isEmpty ||
      value == "null" ||
      value == "" ||
      value == "NULL");
}

/// ------ To Check Internet Ability -------------------->>>
ConnectivityResult? connectivityResult;
final Connectivity connectivity = Connectivity();

Future<bool> getConnectivityResult() async {
  try {
    connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else {
      toast(AppStrings.noInternetAvailable);
      return false;
    }
  } on PlatformException catch (e) {
    printWarning(e);
    toast(AppStrings.noInternetAvailable);
    return false;
  }
}

BoxBorder defaultBorder = Border.all(color: const Color(0xffE8E8E8));

DateTime defaultDateTime = DateTime.parse("1999-01-01 12:00:00.974368");

Future gestUserLogin() async {
  await Get.offAllNamed(AppRoutes.loginScreen);
}

Future<Map<String, String>> initPlatformState() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  RxString deviceId = "".obs;
  RxString deviceType = "".obs;
  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo =
          (await deviceInfoPlugin.androidInfo);
      deviceId.value = androidDeviceInfo.id;
      deviceType.value = "android";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = (await deviceInfoPlugin.iosInfo);
      deviceId.value = iosDeviceInfo.identifierForVendor ?? "";
      deviceType.value = "ios";
    }
    printData(key: "device_id", value: deviceId);
    printData(key: "device_type", value: deviceType);
  } catch (e) {
    debugPrint(e.toString());
  }

  return {
    "device_id": deviceId.value,
    "device_type": deviceType.value,
  };
}

extension StrExtension on String {
  static String capitalize(String s) {
    return "${s[0].toUpperCase()}${s.substring(1).toLowerCase()}";
  }

  /// Time Ago Since Date --------- >>>
  static String timeAgoSinceDate(String dateString,
      {bool numericDates = true}) {
    DateTime dateUtc = DateTime.parse(dateString);
    var dateTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateUtc.toString(), true);
    DateTime date = dateTime.toLocal();
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if (difference.inHours >= 1) {
      return DateFormat("dd MMM | hh:mm a")
          .format(DateTime.parse(dateString))
          .toString();
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 min' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} sec';
    } else {
      return 'now';
    }
  }
}
