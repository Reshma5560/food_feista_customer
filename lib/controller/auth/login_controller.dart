import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> mobileNumberCon = TextEditingController().obs;
  RxString mobileError = "".obs;
  RxBool isMobileValid = false.obs;

  RxBool isLoading = false.obs;
}
