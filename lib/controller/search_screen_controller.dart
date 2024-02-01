import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/search_item_data_model.dart';

class SearchScreenController extends GetxController {
  Rx<TextEditingController> searchCon = TextEditingController().obs;
  RxBool isLoading = false.obs;
  RxList<SearchDataList> searchItemData = <SearchDataList>[].obs;
}
