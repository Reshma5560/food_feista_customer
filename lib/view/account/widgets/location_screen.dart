// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/components/location_controller.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:foodapplication/utils/local_storage.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final LocationController con = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: Get.height,
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                  center: con.latValue.value.isNotEmpty && con.longValue.value.isNotEmpty
                      ? LatLng(double.parse(con.longValue.value), double.parse(con.latValue.value))
                      : LatLng(LocalStorage.userLat.value, LocalStorage.userLong.value
                          // double.parse("screenController.productDetails!.branch.longitude"),
                          // doubleouble.parse("screenController.productDetails!.branch.latitude"),
                          ),
                  onTap: (TapPosition position, LatLng latLng) {
                    con.handleTap(latLng, position: position);
                  },
                  zoom: 14),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: con.latValue.value.isNotEmpty && con.longValue.value.isNotEmpty
                          ? LatLng(double.parse(con.longValue.value), double.parse(con.latValue.value))
                          : const LatLng(40.7128, -74.0060),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.copyBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: Get.width / 1.4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Expanded(
                            child: Obx(
                              () => con.isLoader.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : con.place != null
                                      ? Text(
                                          "${con.place?.name} ${con.place?.subThoroughfare}, ${con.place?.thoroughfare}, ${con.place?.subLocality}, ${con.place?.locality}, ${con.place?.administrativeArea}, ${con.place?.postalCode}, ${con.place?.country}",
                                          textAlign: TextAlign.left,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.black),
                                        )
                                      : const Text("Select address"),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.greyBorderColor,
                      ),
                      Obx(() => InkWell(
                            onTap: con.isDisable.isTrue
                                ? null
                                : () {
                                    var params = {
                                      "enumType": con.addressEnum,
                                      "addressId": con.addressId.value,
                                      "place": con.place,
                                      "lat": con.latValue.value,
                                      "lng": con.longValue.value,
                                      "name": Get.arguments['name'],
                                      "mobileNo": Get.arguments['mobileNo'],
                                      "zipCode": Get.arguments['zipcode'],
                                      "addressType": Get.arguments['addressType']
                                    };
                                    log(params.toString());
                                    Get.toNamed(
                                      AppRoutes.addAddressScreen,
                                      arguments: {
                                        "enumType": con.addressEnum,
                                        "addressId": con.addressId.value,
                                        "place": con.place,
                                        "lat": con.latValue.value,
                                        "lng": con.longValue.value,
                                        "name": Get.arguments['name'],
                                        "mobileNo": Get.arguments['mobileNo'],
                                        "zipCode": Get.arguments['zipcode'],
                                        "addressType": Get.arguments['addressType']
                                      },
                                    );
                                    // Get.toNamed(AppRoutes.addAddressScreen, arguments: [
                                    //   con.addressEnum,
                                    //   con.addressId,
                                    //   con.place,
                                    //   con.latValue.value,
                                    //   con.longValue.value
                                    // ]);
                                  },
                            child: Text(
                              "CONFIRM LOCATION",
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
                            ),
                          ))
                    ],
                  ).paddingAll(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
