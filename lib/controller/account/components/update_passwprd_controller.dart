import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController {
  TextEditingController oldPasswordCon = TextEditingController();

  TextEditingController newPasswordCon = TextEditingController();
  TextEditingController cnfmNewPasswordCon = TextEditingController();

  RxBool oldPasswordValidation = false.obs;
  RxBool newPasswordValidation = false.obs;
  RxBool cnfmNewPasswordValidation = false.obs;
  RxString oldPasswordError = ''.obs;
  RxString newPasswordError = ''.obs;
  RxString cnfmNewPasswordError = ''.obs;
}
