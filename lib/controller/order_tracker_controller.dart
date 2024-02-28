import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:foodapplication/data/models/order_track_model.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class OrderTrackController extends GetxController {
  Rx<OrderTrackModel> orderTrackModel = OrderTrackModel().obs;
  RxBool isLoading = true.obs;
  RxBool isLoadingCan = false.obs;
  RxBool isCanceled = true.obs;
  var orderId = Get.arguments['orderId'];

  ///add review variable
  RxDouble ratingForOrderValue = 0.0.obs;
  RxDouble ratingForDeliveryMenValue = 0.0.obs;
  Rx<TextEditingController> commentCon = TextEditingController().obs;
  RxBool isValid = false.obs;
  RxString commentError = "".obs;
  RxBool isLoadingReview = false.obs;

  Future<void> downloadFile({required String url, required String fileName, required bool isDownload}) async {
    try {
      // Request WRITE_EXTERNAL_STORAGE permission at runtime
      await _requestStoragePermission();

      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: '/storage/emulated/0/Download/',
        fileName: fileName,
        showNotification: true,
        openFileFromNotification: true,
        saveInPublicStorage: true,
      ).then((value) => toast("File downloaded successfully!"));
      isDownload = false;

      log('Download task ID: $taskId');
    } catch (e) {
      log('Error during download: $e');
    }
  }

  Future<void> _requestStoragePermission() async {
    try {
      // Ask for permission
      await Permission.storage.request();
    } on PlatformException catch (e) {
      log('Error requesting storage permission: $e');
    }
  }

  @override
  Future<void> onReady() async {
    await DesktopRepository().orderTrackApiCall(orderId: orderId);
    super.onReady();
  }
}
