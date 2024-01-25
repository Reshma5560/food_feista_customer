import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Rx<TextEditingController> firstNameCon = TextEditingController().obs;
  RxBool firstNameValidation = false.obs;
  RxString firstNameError = ''.obs;

  Rx<TextEditingController> emailCon = TextEditingController().obs;
  RxBool emailValidation = false.obs;
  RxString emailError = ''.obs;

  Rx<TextEditingController> cityCon = TextEditingController().obs;
  RxBool cityValidation = false.obs;
  RxString cityError = ''.obs;

  Rx<TextEditingController> stateCon = TextEditingController().obs;
  RxBool stateValidation = false.obs;
  RxString stateError = ''.obs;

  Rx<TextEditingController> mobileNumberCon = TextEditingController().obs;
  RxString mobileError = "".obs;
  RxBool isMobileValid = false.obs;

  Rx<TextEditingController> referralCodeCon = TextEditingController().obs;
  RxBool referralCodeValidation = false.obs;
  RxString referralCodeError = ''.obs;

  RxBool buttonPress = false.obs;
  RxBool isLoading = false.obs;
}
