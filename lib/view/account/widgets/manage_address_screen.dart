import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/components/manage_Address_controller.dart';
import 'package:foodapplication/res/app_appbar.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_enum.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../../../repositories/auth_repositories.dart';

class ManageAddressScreen extends StatelessWidget {
  ManageAddressScreen({super.key});

  final con = Get.put(ManageAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(
              AppRoutes.locationScreen,
              arguments: {
                "enumType": AddressEnum.add,
              },
            );
            log("==========${AddressEnum.add}");
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ),
        resizeToAvoidBottomInset: true,
        body: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutCubic,
            tween: Tween(begin: 20.0, end: 1.0),
            builder: (context, value, child) {
              return AnimatedOpacity(
                  opacity: value == 20 ? 0 : 1,
                  duration: const Duration(milliseconds: 700),
                  child: Stack(
                    children: [
                      Image.asset(
                        AppAssets.appbarBgImage,
                        fit: BoxFit.fill,
                        width: Get.width,
                        height: Get.height,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 16.sp,
                                // color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            Text(
                              "Manage Address",
                              style: AppStyle.customAppBarTitleStyle().copyWith(
                                  color: AppColors.black, fontSize: 16.sp),
                            ),
                            const Text("",
                                style: TextStyle(color: Colors.transparent)),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.1),
                          child: Expanded(
                            child: Obx(
                              () => con.isLoader.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : con.addressList.isEmpty
                                      ? const Center(
                                          child: Text("No Address Found"))
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // shrinkWrap: true,
                                          children: [
                                            Text(
                                              "SAVED ADDRESS",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 10.w,
                                            ),
                                            ListView.builder(
                                              padding: EdgeInsets.zero,
                                              itemCount: con.addressList.length,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                var item =
                                                    con.addressList[index];
                                                return Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 12),
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .background,
                                                      // gradient: LinearGradient(
                                                      //     begin: Alignment
                                                      //         .bottomCenter,
                                                      //     end:
                                                      //         Alignment.topCenter,
                                                      //     colors: [
                                                      //       AppColors.white,
                                                      //       Theme.of(context)
                                                      //           .colorScheme
                                                      //           .background
                                                      //     ]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22.r),
                                                      boxShadow:
                                                          AppStyle.boxShadow()),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            item.addressType ==
                                                                    "home"
                                                                ? Icons.home
                                                                : item.addressType ==
                                                                        "office"
                                                                    ? Icons.work
                                                                    : Icons
                                                                        .other_houses,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          Expanded(
                                                            child: Text(
                                                              item.addressType ==
                                                                      "home"
                                                                  ? "Home Address"
                                                                  : item.addressType ==
                                                                          "office"
                                                                      ? "Work Address"
                                                                      : "Other Address",
                                                              style:
                                                                  const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            decoration: BoxDecoration(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.r)),
                                                            child: InkWell(
                                                              onTap: () {
                                                                printYellow(item
                                                                    .latitude);
                                                                printYellow(item
                                                                    .longitude);

                                                                Get.toNamed(
                                                                  AppRoutes
                                                                      .locationScreen,
                                                                  arguments: {
                                                                    "enumType":
                                                                        AddressEnum
                                                                            .edit,
                                                                    "addressId":
                                                                        item.id,
                                                                    "lat": item
                                                                            .latitude
                                                                            .isEmpty
                                                                        ? null
                                                                        : item
                                                                            .latitude,
                                                                    "long": item
                                                                            .longitude
                                                                            .isEmpty
                                                                        ? null
                                                                        : item
                                                                            .longitude,
                                                                    "name": item
                                                                        .contactPersonName,
                                                                    "mobileNo":
                                                                        item.contactPersonNumber,
                                                                    "zipCode": item
                                                                        .zipCode,
                                                                    "addressType":
                                                                        item.addressType
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(
                                                                  Icons.edit,
                                                                  size: 14.sp,
                                                                  color: AppColors
                                                                      .white),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            decoration: BoxDecoration(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor
                                                                    .withOpacity(
                                                                        0.3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.r)),
                                                            child: InkWell(
                                                              onTap: () =>
                                                                  Get.dialog(
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 40),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Theme.of(Get.context!).colorScheme.background,
                                                                                border: Border.all(width: 3, color: Theme.of(Get.context!).primaryColor),
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(20),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(20.0),
                                                                                child: Material(
                                                                                  color: Theme.of(Get.context!).colorScheme.background,
                                                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                    const SizedBox(height: 10),
                                                                                    Text(
                                                                                      "Delete",
                                                                                      style: TextStyle(
                                                                                        // fontFamily: FontFamilyText.sFProDisplayRegular,
                                                                                        color: Theme.of(Get.context!).primaryColor,
                                                                                        fontSize: 14.sp,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 10.h),
                                                                                    Text(
                                                                                      "Are you sure you want Delete.?",
                                                                                      style: TextStyle(
                                                                                        // fontFamily: FontFamilyText.sFProDisplayRegular,
                                                                                        color: Theme.of(Get.context!).primaryColor,
                                                                                        fontSize: 14.sp,
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 20.h),
                                                                                    Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: AppButton(
                                                                                            height: 30.h,
                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                            onPressed: () {
                                                                                              con.addressList.removeAt(index);
                                                                                              AuthRepository().removeAddressByIdApiCall(addressId: item.id).then((value) {
                                                                                                Get.back();
                                                                                              });
                                                                                            },
                                                                                            child: Text(
                                                                                              "Yes",
                                                                                              style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        const SizedBox(width: 15),
                                                                                        Expanded(
                                                                                          child: AppButton(
                                                                                            height: 30.h,
                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                            onPressed: () {
                                                                                              Get.back();
                                                                                            },
                                                                                            child: Text(
                                                                                              "No",
                                                                                              style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ]),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      barrierDismissible:
                                                                          false),
                                                              child: Icon(
                                                                  Icons.delete,
                                                                  size: 14.sp,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.w),
                                                      Text(
                                                        "${item.floor} ${item.address} ${item.road} ${item.house} ${item.city.cityName} ${item.state.stateName} ${item.country.countryName}",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: AppColors
                                                                .greyFontColor),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ).paddingSymmetric(
                                          horizontal: defaultPadding.w),
                            ),
                          )),
                    ],
                  ));
            }));
  }
}
