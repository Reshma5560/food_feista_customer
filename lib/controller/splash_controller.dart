import 'dart:async';

import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../utils/local_storage.dart';
import 'location_permission_controler.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  navigation() {
    Timer(
      const Duration(seconds: 5),
      () {
        // Get.offAllNamed(AppRoutes.indexScreen);

        if (LocalStorage.token.value.isEmpty) {
          Get.offAllNamed(AppRoutes.loginScreen);
        } else if (LocalStorage.userCity.value.isEmpty) {
          LocationPermissionController con = Get.put(LocationPermissionController());
          Get.offAllNamed(AppRoutes.locationEnableScreen);
        } else {
          LocationPermissionController con = Get.put(LocationPermissionController());
          Get.offAllNamed(AppRoutes.indexScreen);
        }
      },
    );
  }
}
