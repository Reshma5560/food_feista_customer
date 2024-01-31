import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/wish_list_data_model.dart';
import '../../../repositories/desktop_repositories.dart';

class WishListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool paginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxInt page = 1.obs;
  ScrollController scrollController = ScrollController();
  RxList<WishDatum> wishListData = <WishDatum>[].obs;

  @override
  void onReady() {
    DesktopRepository().getWishListAPI(isInitial: true);
    super.onReady();
  }

  void manageScrollController() async {
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent == scrollController.position.pixels && isLoading.isFalse) {
          if (nextPageStop.isTrue && paginationLoading.isFalse) {
            paginationLoading.value = true;
            DesktopRepository().getWishListAPI(isInitial: false);
          }
        }
      },
    );
  }
}
