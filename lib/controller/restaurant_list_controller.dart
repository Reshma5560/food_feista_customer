import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/restaurant_list_model.dart';
import '../repositories/desktop_repositories.dart';

class RestaurantListController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool paginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxInt page = 1.obs;
  ScrollController scrollController = ScrollController();

  RxString categoryId = "".obs;

  RxList<RestaurantListDatum> restaurantList = <RestaurantListDatum>[].obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments["category_id"].runtimeType == String) {
        categoryId.value = Get.arguments["category_id"];
      }
    }
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await DesktopRepository().getRestaurantListAPI(isInitial: true, categoryID: categoryId.value);
    manageScrollController();
  }

  void manageScrollController() async {
    scrollController.addListener(
      () async {
        if (scrollController.position.maxScrollExtent == scrollController.position.pixels && isLoading.isFalse) {
          if (nextPageStop.isTrue && paginationLoading.isFalse) {
            paginationLoading.value = true;
            await DesktopRepository().getRestaurantListAPI(isInitial: false, categoryID: categoryId.value);
          }
        }
      },
    );
  }
}
