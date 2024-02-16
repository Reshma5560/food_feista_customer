import 'package:flutter/material.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:get/get.dart';

class PlaceOrderController extends GetxController {
  RxInt selectedIndex = (-1).obs;
  RxInt selectedIndex2 = (-1).obs;

  RxString addressId = "".obs;
  RxString paymentType = "".obs;
  RxString cartId = "".obs;
  RxString couponId = "".obs;
  RxBool isLoader = false.obs;
  Rx<TextEditingController> noteCon = TextEditingController().obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments["cart_id"].runtimeType == String) {
        cartId.value = Get.arguments["cart_id"];

        printYellow(cartId.value);
      }
      if (Get.arguments["coupon_id"].runtimeType == String) {
        couponId.value = Get.arguments["coupon_id"];
        printYellow(couponId.value);
      }
    }

    super.onInit();
  }
}
