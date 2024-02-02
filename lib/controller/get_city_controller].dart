// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/get_city_model.dart';
import '../repositories/auth_repositories.dart';

class GetCityController extends GetxController {
  Rx<TextEditingController> cityTextController = TextEditingController().obs;
  RxString cityError = ''.obs;
  RxString cityId = ''.obs;
  RxBool cityValidation = false.obs;
  RxBool isLoading = false.obs;
  RxBool buttonPress = false.obs;
  RxBool hasSearchMore = true.obs;

  RxList<City> cityList = <City>[].obs;
  Rx<City> cityDropDownValue = City(cityName: 'Select city').obs;

  // SearchField Search Function
  getSearchTextListFunction(String searchText) {
    List searchList = [];
    searchList = cityTextController.value.text.trim().isEmpty
        ? cityList
        : cityList.where(
            (element) {
              String searchListString =
                  element.cityName.toString().toLowerCase();
              String searchTextNew = searchText.toLowerCase();
              return searchListString.contains(searchTextNew);
            },
          ).toList();
    return searchList;
  }

  @override
  void onReady() {
    AuthRepository().getSearchCityListOnlyCall(searchText: "");
    super.onReady();
  }
}
