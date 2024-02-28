import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Rx<TextEditingController> firstNameCon = TextEditingController().obs;
  RxBool firstNameValidation = false.obs;
  RxString firstNameError = ''.obs;

  Rx<TextEditingController> emailCon = TextEditingController().obs;
  RxBool emailValidation = false.obs;
  RxString emailError = ''.obs;

  Rx<TextEditingController> lastNameCon = TextEditingController().obs;
  RxBool lastNameValidation = false.obs;
  RxString lastNameError = ''.obs;

  Rx<TextEditingController> mobileNumberCon = TextEditingController().obs;
  RxString mobileError = "".obs;
  RxBool isMobileValid = false.obs;

  Rx<TextEditingController> passwordCon = TextEditingController().obs;
  RxBool passwordValidation = false.obs;
  RxString passwordError = ''.obs;

  RxBool buttonPress = false.obs;
  RxBool isLoading = false.obs;

  RxBool isChecked = false.obs;

}
