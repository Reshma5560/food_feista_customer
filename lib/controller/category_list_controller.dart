import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/category__list_model.dart';
import '../repositories/desktop_repositories.dart';

class CategoryListController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool paginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxInt page = 1.obs;
  ScrollController scrollController = ScrollController();
  RxList<CategoryListDatum> categoryList = <CategoryListDatum>[].obs;

  @override
  Future<void> onReady() async {
    await DesktopRepository().getCategoryListAPI(isInitial: true);
    manageScrollController();
    super.onReady();
  }

  void manageScrollController() async {
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent == scrollController.position.pixels && isLoading.isFalse) {
          if (nextPageStop.isTrue && paginationLoading.isFalse) {
            paginationLoading.value = true;
            DesktopRepository().getCategoryListAPI(isInitial: false);
          }
        }
      },
    );
  }
}
