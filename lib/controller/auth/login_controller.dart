import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Rx<TextEditingController> mobileNumberCon = TextEditingController().obs;
  // RxString mobileError = "".obs;
  // RxBool isMobileValid = false.obs;
  Rx<TextEditingController> emailCon = TextEditingController().obs;
  RxBool emailValidation = false.obs;
  RxString emailError = ''.obs;

  Rx<TextEditingController> passwordCon = TextEditingController().obs;
  RxBool passwordValidation = false.obs;
  RxString passwordError = ''.obs;

  RxBool buttonPress = false.obs;
  RxBool isLoading = false.obs;
}
