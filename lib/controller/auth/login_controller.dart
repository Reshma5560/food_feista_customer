import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Rx<TextEditingController> mobileNumberCon = TextEditingController().obs;
  // RxString mobileError = "".obs;
  // RxBool isMobileValid = false.obs;
  Rx<TextEditingController> emailCon = TextEditingController(text: kDebugMode ? "priya@omtecweb.com" : "").obs;
  RxBool emailValidation = false.obs;
  RxString emailError = ''.obs;

  Rx<TextEditingController> passwordCon = TextEditingController(text: kDebugMode ? "12547892" : "").obs;
  RxBool passwordValidation = false.obs;
  RxString passwordError = ''.obs;

  RxBool buttonPress = false.obs;
  RxBool isLoading = false.obs;
}
