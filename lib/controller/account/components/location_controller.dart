import 'dart:developer';

import 'package:foodapplication/res/app_enum.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../utils/local_storage.dart';

class LocationController extends GetxController {
  late AddressEnum addressEnum;

  RxString addressId = "".obs;
  Placemark? place;

  // Rx<LatLng> tappedLocation = const LatLng(0.0, 0.0).obs;

  RxBool isLoader = false.obs;
  RxDouble latValue = 0.0.obs;
  RxDouble longValue = 0.0.obs;
  RxBool isDisable = true.obs;

  void handleTap(LatLng latLng /*, {
    TapPosition? position,
  }*/
      ) async {
    isLoader(true);
    // tappedLocation.value = latLng;

    // Reverse geocoding to get address from tapped location
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      place = placemarks.first;
      latValue.value = latLng.latitude;
      longValue.value = latLng.longitude;
      log('Tapped Location: ${latLng.latitude}, ${latLng.longitude}');
      log('Address: ${place?.name}, ${place?.subThoroughfare}, ${place?.thoroughfare}, ${place?.subLocality}, ${place?.locality}, ${place?.administrativeArea}, ${place?.postalCode}, ${place?.country}');
      isDisable(false);
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

      if (Get.arguments["lat"] != null && Get.arguments["long"] != null) {
        double lat, long;

        printWhite(Get.arguments["lat"]);
        lat = double.parse(Get.arguments["lat"].toString());
        long = double.parse(Get.arguments["long"].toString());
        latValue.value = lat;
        longValue.value = long;
        log("$lat $long");
        handleTap(LatLng(lat, long));
      } else {
        handleTap(LatLng(LocalStorage.userLat.value, LocalStorage.userLong.value));
      }
    }
    super.onInit();
  }
}
