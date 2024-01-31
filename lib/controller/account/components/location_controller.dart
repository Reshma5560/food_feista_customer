import 'dart:developer';

import 'package:flutter_map/flutter_map.dart';
import 'package:foodapplication/res/app_enum.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LocationController extends GetxController {
  late AddressEnum addressEnum;

  RxString addressId = "".obs;
  Placemark? place;
  Rx<LatLng> tappedLocation = const LatLng(0.0, 0.0).obs;

  RxBool isLoader = false.obs;
  RxString latValue = "".obs;
  RxString longValue = "".obs;

  void handleTap(TapPosition position, LatLng latLng) async {
    isLoader(true);
    tappedLocation.value = latLng;

    // Reverse geocoding to get address from tapped location
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      place = placemarks.first;
      latValue.value = latLng.latitude.toString();
      longValue.value = latLng.longitude.toString();
      log('Tapped Location: ${latLng.latitude}, ${latLng.longitude}');
      log('Address: ${place?.name}, ${place?.subThoroughfare}, ${place?.thoroughfare}, ${place?.subLocality}, ${place?.locality}, ${place?.administrativeArea}, ${place?.postalCode}, ${place?.country}');

      isLoader(false);
    } catch (e) {
      log('Error: $e');

      isLoader(false);
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments["enumType"] != null) {
        addressEnum = Get.arguments["enumType"];
        printAction("===$addressEnum");
      }

      if (Get.arguments["addressId"] != null) {
        addressId.value = Get.arguments["addressId"];
        printAction("===${addressId.value}");
      }
    }
    super.onInit();
  }
}
