import 'package:flutter/material.dart';
import 'package:foodapplication/data/models/order_track_model.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:get/get.dart';

class OrderTrackController extends GetxController {
  Rx<OrderTrackModel> orderTrackModel = OrderTrackModel().obs;
  RxBool isLoading = true.obs;
  RxBool isCanceled = true.obs;
  var orderId = Get.arguments['orderId'];

  ///add review variable
  RxDouble ratingForOrderValue = 0.0.obs;
  RxDouble ratingForDeliveryMenValue = 0.0.obs;
  Rx<TextEditingController> commentCon = TextEditingController().obs;
  RxBool isValid = false.obs;
  RxString commentError = "".obs;
  RxBool isLoadingReview = false.obs;

  @override
  Future<void> onReady() async {
    await DesktopRepository().orderTrackApiCall(orderId: orderId);
    super.onReady();
  }
}
