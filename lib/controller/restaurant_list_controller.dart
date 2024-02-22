import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/get_cuisine_model.dart';
import '../data/models/restaurant_list_model.dart';
import '../repositories/desktop_repositories.dart';

class RestaurantListController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool paginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxInt page = 1.obs;
  ScrollController scrollController = ScrollController();

  RxInt selectVeg = 0.obs;
  RxInt selectNonVeg = 0.obs;
  RxBool selectPureVeg = false.obs;
  RxBool isNearByMe = false.obs;
  RxString categoryId = "".obs;

  RxList<RestaurantListDatum> restaurantList = <RestaurantListDatum>[].obs;

  RxList<CuisineDatum> getCuisineListData = <CuisineDatum>[].obs;

  RxList<String> selectedChoice = <String>[].obs;

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
    await DesktopRepository().getCuisineApiCall(isLoader: isLoading);
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
