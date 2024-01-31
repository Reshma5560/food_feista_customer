import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/search_city_model.dart';

class GetCityController extends GetxController {
  Rx<TextEditingController>  cityTextController = TextEditingController().obs;
  RxString cityError = ''.obs;
  RxBool cityValidation = false.obs;
  SearchCity?searchCityData;
  RxBool isLoading = false.obs;
  RxBool buttonPress = false.obs;
  RxBool hasSearchMore = true.obs;



  @override
  void onReady() {
    super.onReady();
  }
}
