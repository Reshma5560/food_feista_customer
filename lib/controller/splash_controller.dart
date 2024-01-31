import 'dart:async';

import 'package:foodapplication/route/app_routes.dart';
import 'package:foodapplication/utils/local_storage.dart';
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
      () {


        if(LocalStorage.token.value.isEmpty){
          Get.offAllNamed(AppRoutes.loginScreen);
        }else if (LocalStorage.userCity.value.isEmpty){
          Get.offAllNamed(AppRoutes.getCityScreen);
        }
        else{
          Get.offAllNamed(AppRoutes.indexScreen);
        }
      },
    );
  }
}
