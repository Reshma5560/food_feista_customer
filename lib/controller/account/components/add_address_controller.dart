// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:foodapplication/data/models/get_city_model.dart';
import 'package:foodapplication/data/models/get_country_model.dart';
import 'package:foodapplication/data/models/get_state_model.dart';
// import 'package:foodapplication/model/get_city_model.dart';
// import 'package:foodapplication/model/get_country_model.dart';
// import 'package:foodapplication/model/get_state_model.dart';
import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:foodapplication/res/app_enum.dart';
import 'package:get/get.dart';

import '../../../data/models/get_add_by_id_model.dart';
import '../../../res/color_print.dart';

class AddAddressController extends GetxController {
  late AddressEnum addressEnum;
  RxString addressId = "".obs;
  var place; //= Get.arguments['place'] ?? "";
  GetAddressByIdModel? getAddressData;

  TextEditingController addressCon = TextEditingController();
  TextEditingController floorCon = TextEditingController();
  TextEditingController houseCon = TextEditingController();

  TextEditingController receiverNameCon = TextEditingController();
  TextEditingController mobilenoCon = TextEditingController();
  TextEditingController zipcodeCon = TextEditingController();
  TextEditingController latTextEditingController = TextEditingController();
  TextEditingController logTextEditingController = TextEditingController();

  RxBool mobileNoValidation = false.obs;
  RxBool receiveerNameValidation = false.obs;
  RxBool zipcodeValidation = false.obs;
  RxBool addressValidation = false.obs;
  RxBool floorValidation = false.obs;
  RxBool houseValidation = false.obs;
  RxBool latValidation = false.obs;
  RxBool longValidation = false.obs;

  RxString mobileNoError = ''.obs;
  RxString receiveerNameError = ''.obs;
  RxString zipcodeError = ''.obs;
  RxString addressError = ''.obs;
  RxString latError = ''.obs;
  RxString longError = ''.obs;

  RxString floorError = ''.obs;
  RxString houseError = ''.obs;

  RxString typeValue = 'home'.obs;

  RxBool isLoader = false.obs;

  RxList<Country> countryList = <Country>[].obs;
  Country countryDropDownValue = Country(countryName: 'Select country');

  RxList<StateList> stateList = <StateList>[].obs;
  StateList stateDropDownValue = StateList(stateName: 'Select state');

  RxList<City> cityList = <City>[].obs;
  City cityDropDownValue = City(cityName: 'Select city');

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments["enumType"] != null) {
        addressEnum = Get.arguments["enumType"];
        printAction("===$addressEnum");
      }

      if (Get.arguments["AddressId"] != "") {
        addressId.value = Get.arguments["AddressId"];
        printAction("===${addressId.value}");
      }
      if (Get.arguments["place"] != null) {
        place = Get.arguments["place"];
        printAction("===$place");
      }
      if (Get.arguments["lat"] != null) {
        latTextEditingController.text = Get.arguments["lat"];
        printAction("===${latTextEditingController.text}");
      }
      if (Get.arguments["lng"] != null) {
        logTextEditingController.text = Get.arguments["lng"];
        printAction("===${logTextEditingController.text}");
      }
    }

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    AuthRepository().getCountryApiCall();
    if (Get.arguments['AddressId'] != null) {
      floorCon.text = " ${place.subThoroughfare}";
      houseCon.text = "${place.thoroughfare}";
      addressCon.text = "${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";

      await AuthRepository().getAddressByIdApiCall(isLoader: isLoader, addressId: addressId.value);
    }
    super.onReady();
  }
}
