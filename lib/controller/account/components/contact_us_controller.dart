import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodapplication/data/api/api_function.dart';
import 'package:foodapplication/data/handler/api_url.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:foodapplication/utils/utils.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  TextEditingController emailCon = TextEditingController();
  TextEditingController fullnameCon = TextEditingController();
  TextEditingController mobilenoCon = TextEditingController();
  TextEditingController feedbackCon = TextEditingController();
  RxBool mobileNoValidation = false.obs;
  RxBool fullnameValidation = false.obs;
  RxBool feedbackValidation = false.obs;

  RxString mobileNoError = ''.obs;
  RxString fullNameError = ''.obs;
  RxString feedbackError = ''.obs;

  RxBool isLoader = false.obs;

  submitFunction() async {
    if (isLoader.isFalse) {
      ///password validation

      if (mobilenoCon.value.text.isEmpty) {
        mobileNoValidation.value = true;
        mobileNoError.value = "Please Enter your mobile number.";
      } else if (mobilenoCon.value.text.length < 10) {
        mobileNoValidation.value = true;
        mobileNoError.value = "Please Enter your mobile number 10 digits.";
      } else {
        mobileNoValidation.value = false;
        mobileNoError.value = "";
      }

      if (fullnameCon.value.text.isEmpty) {
        fullnameValidation.value = true;
        fullNameError.value = "Please Enter your full name.";
      } else {
        fullnameValidation.value = false;
        fullNameError.value = "";
      }

      if (feedbackCon.value.text.isEmpty) {
        feedbackValidation.value = true;
        feedbackError.value = "Please Enter your full name.";
      } else {
        feedbackValidation.value = false;
        feedbackError.value = "";
      }

      if (mobileNoValidation.isFalse &&
          fullnameValidation.isFalse &&
          feedbackValidation.isFalse) {
        FocusScope.of(Get.context!).unfocus();
       await contactUsApi(params: {
          "full_name": fullnameCon.text.trim(),
          "email": emailCon.value.text.trim(),
          "mobile_number": mobilenoCon.text.trim(),
          "message": feedbackCon.text.trim()
        });
      }
    }
  }

  contactUsApi({dynamic params}) async {
    try {
      isLoader.value = true;
      printData(key: "Contact us params", value: params);
      await APIFunction()
          .postApiCall(apiName: ApiUrls.contactUsUrl, params: params)
          .then(
        (response) async {
          printData(key: "contact us response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              Get.offAllNamed(AppRoutes.indexScreen);

              emailCon.clear();
              fullnameCon.clear();
              mobilenoCon.clear();
              feedbackCon.clear();
            }
          }

          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader.value = false;
    }
  }

  @override
  void onInit() {
    emailCon.text = "ffdss@gmail.com";
    super.onInit();
  }
}
