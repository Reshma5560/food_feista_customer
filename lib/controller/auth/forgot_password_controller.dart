import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordcontroller extends GetxController{
  
  Rx<TextEditingController> emailCon = TextEditingController(text: kDebugMode ? "flutterdemo1234@gmail.com" : "").obs;
  RxBool emailValidation = false.obs;
  RxString emailError = ''.obs;

  
  RxBool buttonPress = false.obs;
  RxBool isLoading = false.obs;
}