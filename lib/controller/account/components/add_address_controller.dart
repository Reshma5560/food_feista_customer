import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:foodapplication/model/get_city_model.dart';
import 'package:foodapplication/model/get_country_model.dart';
import 'package:foodapplication/model/get_state_model.dart';
import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AddAddressController extends GetxController {
  TextEditingController addressCon = TextEditingController();
  TextEditingController receiverNameCon = TextEditingController();
  TextEditingController mobilenoCon = TextEditingController();
  TextEditingController zipcodeCon = TextEditingController();
  TextEditingController latTextEditingController = TextEditingController();
  TextEditingController logTextEditingController = TextEditingController();

  RxBool mobileNoValidation = false.obs;
  RxBool receiveerNameValidation = false.obs;
  RxBool zipcodeValidation = false.obs;
  RxBool addressValidation = false.obs;

  RxBool latValidation = false.obs;
  RxBool longValidation = false.obs;

  RxString mobileNoError = ''.obs;
  RxString receiveerNameError = ''.obs;
  RxString zipcodeError = ''.obs;
  RxString addressError = ''.obs;
  RxString latError = ''.obs;
  RxString longError = ''.obs;

  RxString typeValue = 'home'.obs;

  RxBool isLoader = false.obs;

  RxList<Country> countryList = <Country>[].obs;
  Country countryDropDownValue = Country(countryName: 'Select country');

  RxList<StateList> stateList = <StateList>[].obs;
  StateList stateDropDownValue = StateList(stateName: 'Select state');

  RxList<City> cityList = <City>[].obs;
  City cityDropDownValue = City(cityName: 'Select city');

  Placemark? place;
  Rx<LatLng> tappedLocation = const LatLng(0.0, 0.0).obs;

  void handleTap(TapPosition position, LatLng latLng) async {
    isLoader(true);
    tappedLocation.value = latLng;
    isLoader(false);

    // Reverse geocoding to get address from tapped location
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      place = placemarks.first;
      latTextEditingController.text = latLng.latitude.toString();
      logTextEditingController.text = latLng.longitude.toString();
      log('Tapped Location: ${latLng.latitude}, ${latLng.longitude}');
      log('Address: ${place?.name}, ${place?.subThoroughfare}, ${place?.thoroughfare}, ${place?.subLocality}, ${place?.locality}, ${place?.administrativeArea}, ${place?.postalCode}, ${place?.country}');
      addressCon.text =
          " ${place?.subThoroughfare}, ${place?.thoroughfare}, ${place?.subLocality}, ${place?.locality}, ${place?.administrativeArea}, ${place?.postalCode}, ${place?.country}";
    } catch (e) {
      log('Error: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    AuthRepository().getCountryApiCall();
    super.onReady();
  }
}

