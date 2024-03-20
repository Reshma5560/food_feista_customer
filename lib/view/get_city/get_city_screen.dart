import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:get/get.dart';

import '../../controller/get_city_controller.dart';
import '../../data/models/get_city_model.dart';
import '../../repositories/auth_repositories.dart';
import '../../res/ui_utils.dart';
import '../../route/app_routes.dart';
import '../../utils/local_storage.dart';
import '../gradient_container/gradient_container.dart';

class GetCityScreen extends StatelessWidget {
  GetCityScreen({super.key});

  final GetCityController con = Get.put(GetCityController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GradientContainer(
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Image.asset(
                  AppAssets.bgLightImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 20.w),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16.sp,
                    ),
                  ),
                ),
              ),
              // Column(
              //   children: [
              //     CommonAppBar(
              //       title: "",
              //       onPressed: () {
              //         Get.back();
              //       },
              //     ),
              //   ],
              // ),
              Obx(
                () => con.isLoading.isTrue
                    ? const AppLoader()
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: Get.height * 0.40,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(width: 13.w, color: Theme.of(context).primaryColor.withOpacity(0.2))),
                        child: Stack(
                          children: [
                            Obx(
                              () => ListView(
                                padding: EdgeInsets.all(defaultPadding.w),
                                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                // physics: const RangeMaintainingScrollPhysics(),
                                children: [
                                  // SizedBox(
                                  //   height: double.parse(
                                  //     value.toString(),
                                  //   ),
                                  // ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(AppAssets.bgLogo),
                                      Text(
                                        "Locate Me",
                                        style: AppStyle.loginTitleStyle(),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   "Locate Me",
                                  //   style:
                                  //       AppStyle.authTitleStyle(),
                                  // ),
                                  SizedBox(height: defaultPadding.w),
                                  Text(
                                    "ORDER FOOD FROM FAVOURITE RESTAURANTS NEAR YOU.",
                                    style: AppStyle.authSubtitleStyle(),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 40,
                                    child: TypeAheadField(
                                      suggestionsCallback: (text) {
                                        // log("00000");
                                        String searchText = con.cityTextController.value.text.trim();
                                        // log("searchText 0 $searchText");
                                        return con.getSearchTextListFunction(searchText);
                                      },
                                      textFieldConfiguration: TextFieldConfiguration(
                                        controller: con.cityTextController.value,
                                        onChanged: (value) async {
                                          await AuthRepository().getSearchCityListOnlyCall(searchText: con.cityTextController.value.text);
                                          con.isLoading(true);
                                          con.isLoading(false);
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                          filled: true,
                                          fillColor: AppColors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                                          hintText: 'Select City...',
                                          suffixIcon: con.cityTextController.value.text == ""
                                              ? null
                                              : IconButton(
                                                  icon: const Icon(Icons.close),
                                                  color: Colors.grey,
                                                  iconSize: 20,
                                                  onPressed: () async {
                                                    con.cityTextController.value.clear();
                                                    await AuthRepository().getSearchCityListOnlyCall(searchText: con.cityTextController.value.text);
                                                    con.isLoading(true);
                                                    con.isLoading(false);
                                                  },
                                                ),
                                        ),
                                      ),
                                      itemBuilder: (context, suggestion) {
                                        final cat = suggestion! as City;
                                        log("cat.cityName ${cat.cityName}");
                                        return ListTile(
                                          title: Text(cat.cityName.toString()),
                                        );
                                      },
                                      onSuggestionSelected: (suggestion) async {
                                        // log("text");
                                        City selectedCity = suggestion as City;
                                        con.cityTextController.value.text = selectedCity.cityName.toString();
                                        con.cityId.value = selectedCity.cityName.toString();
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Obx(
                                    () => TweenAnimationBuilder(
                                      duration: const Duration(milliseconds: 1000),
                                      curve: Curves.elasticOut,
                                      tween: con.buttonPress.value ? Tween(begin: 0.9, end: 0.97) : Tween(begin: 1.0, end: 1.0),
                                      builder: (context, value, child) {
                                        return Transform.scale(
                                          scale: value,
                                          child: Obx(
                                            () => AppButton(
                                              height: 30.h,
                                              borderRadius: BorderRadius.circular(12.r),
                                              title: "Find food".toUpperCase(),
                                              loader: con.isLoading.value,
                                              onHighlightChanged: (press) {
                                                con.buttonPress.value = press;
                                              },
                                              onPressed: () async {
                                                if (con.isLoading.isFalse) {
                                                  FocusScope.of(context).unfocus();

                                                  if (con.cityTextController.value.text.isNotEmpty) {
                                                    /// Set User location
                                                    await LocalStorage.setCity(city: con.cityId.value);
                                                    Get.offAllNamed(AppRoutes.indexScreen);
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            UiUtils.scrollGradient(context),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
