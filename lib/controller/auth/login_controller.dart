import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodapplication/utils/local_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailCon = TextEditingController(text: kDebugMode ? "customer@gmail.com" : "").obs;
  RxBool emailValidation = false.obs;
  RxString emailError = ''.obs;

  Rx<TextEditingController> passwordCon = TextEditingController(text: kDebugMode ? "123456789" : "").obs;
  RxBool passwordValidation = false.obs;
  RxString passwordError = ''.obs;

  RxBool buttonPress = false.obs;
  RxBool isLoading = false.obs;
  RxBool isCheck = false.obs;
  RxBool isShow = false.obs;

  @override
  void onInit() {
    if (LocalStorage.email.value.isNotEmpty) {
      emailCon.value.text = LocalStorage.email.value;
    }

    if (LocalStorage.password.value.isNotEmpty) {
      passwordCon.value.text = LocalStorage.password.value;
    }

    isCheck = LocalStorage.isRemember;

    super.onInit();
  }
}
