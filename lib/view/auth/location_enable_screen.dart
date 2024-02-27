import 'package:flutter/material.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:get/get.dart';

import '../../controller/location_permission_controler.dart';
import '../../res/app_style.dart';
import '../../route/app_routes.dart';

class LocationEnableScreen extends StatelessWidget {
  LocationEnableScreen({super.key});

  final LocationPermissionController con = Get.put(LocationPermissionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Set your location to start exploring restaurants near you",
              textAlign: TextAlign.center,
              style: AppStyle.authSubtitleStyle().copyWith(fontWeight: FontWeight.w600),
            ),

            Image(
              image: AssetImage(
                AppAssets.locationBanner,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding).copyWith(bottom: defaultPadding),
              child: Column(
                children: [
                  AppButton(
                    onPressed: () {
                      con.checkLocationPermission();
                    },
                    title: "Enable Device Location",
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  AppButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.getCityScreen);
                    },
                    buttonType: ButtonType.outline,
                    title: "Enter Your Location Manually",
                  ),
                ],
              ),
            ),
            // Container(
            //   height: ,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(
            //         AppAssets.locationBanner,
            //       ),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
