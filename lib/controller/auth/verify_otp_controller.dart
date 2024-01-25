import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/ui_utils.dart';

class VerifyOtpController extends GetxController {
  Rx<TextEditingController> otpController = TextEditingController().obs;
  RxBool otpValid = false.obs;
  RxString codeError = ''.obs;

  FocusNode otpFocus = FocusNode();
  RxBool isResendOtp = false.obs;
  RxBool isTimerComplete = true.obs;
  RxInt timeLimit = 0.obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    timerStart();
    super.onReady();
  }

  Future timerStart() async {
    isResendOtp.value = false;
    isTimerComplete.value = false;
    timeLimit = (59.obs);
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (timeLimit.value > 1) {
          timeLimit.value--;
        } else if (timeLimit.value >= 1) {
          isTimerComplete.value = true;
          timeLimit.value = 0;
          timer.cancel();
        }
      },
    );
  }

  RxBool validation() {
    FocusScope.of(Get.context!).unfocus();
    if (otpController.value.text.length < 4) {
      codeError.value = "Please enter 6 digit OTP";
      toast(codeError.value);
      otpValid.value = false;
      Future.delayed(const Duration(milliseconds: 1500)).then(
        (value) {
          codeError.value = "";
          otpFocus.requestFocus();
        },
      );
    } else {
      otpValid.value = true;
    }
    return otpValid;
  }
}
