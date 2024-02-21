import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../res/app_dialog.dart';
import '../res/color_print.dart';
import '../route/app_routes.dart';
import '../utils/local_storage.dart';

class LocationPermissionController extends GetxController with WidgetsBindingObserver {
  PermissionStatus? permissionStatus;
  RxString currentAddress = "".obs;
  Position? currentPosition;

  @override
  void onInit() {
    checkLocationPermission();
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        checkLocationPermission();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
  }

  Future<void> checkLocationPermission() async {
    final status = await Permission.location.status;

    permissionStatus = status;
    if (permissionStatus == PermissionStatus.granted) {
      await getCurrentPosition();
    } else if (permissionStatus == PermissionStatus.denied) {
      await Permission.location.request();
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      AppDialogs.enableLocationDialog(
        Get.context!,
        deleteOnTap: () async {
          await openAppSettings().whenComplete(() {
            Get.back();
          });
        },
      );
    }

    printYellow("-----------------  $permissionStatus");
    printYellow("-----------------  ${PermissionStatus.denied.isDenied}");
  }

  Future<void> getCurrentPosition() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) async {
      currentPosition = position;
      if (currentPosition != null) {
        await LocalStorage.setLatLong(lat: position.latitude, long: position.longitude);
        getAddressFromLatLng(currentPosition!);
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude).then((List<Placemark> placemarks) async {
      Placemark place = placemarks[0];

      currentAddress.value = place.locality ?? "" /*'${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}'*/;
      printYellow("-----------------  ${currentAddress.value}");
      if (currentAddress.value.isNotEmpty) {
        if (currentAddress.value != LocalStorage.userCity.value) {
          await LocalStorage.setCity(city: currentAddress.value);
          Get.offAllNamed(AppRoutes.indexScreen);
        }
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
