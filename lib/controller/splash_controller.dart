import 'dart:async';

import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  navigation() {
    Timer(
      const Duration(seconds: 5),
      () => Get.offAllNamed(AppRoutes.loginScreen),
    );
  }
}
