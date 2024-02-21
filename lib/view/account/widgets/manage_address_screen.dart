import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/components/manage_Address_controller.dart';
import 'package:foodapplication/res/app_appbar.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_enum.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

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
                  child: ListView(padding: EdgeInsets.zero, children: [
                    CommonAppBar(
                      title: "Manage Address",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Obx(
                      () => con.isLoader.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : con.addressList.isEmpty
                              ? const Center(child: Text("No Address Found"))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // shrinkWrap: true,
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "SAVED ADDRESS",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Theme.of(context).primaryColor,
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
                                          (BuildContext context, int index) {
                                        var item = con.addressList[index];
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 12),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    item.addressType == "home"
                                                        ? Icons.home
                                                        : item.addressType ==
                                                                "office"
                                                            ? Icons.work
                                                            : Icons
                                                                .other_houses,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Expanded(
                                                    child: Text(
                                                      item.addressType == "home"
                                                          ? "Home Address"
                                                          : item.addressType ==
                                                                  "office"
                                                              ? "Work Address"
                                                              : "Other Address",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    // onTap: () => showDialog(
                                                    //   barrierDismissible: false,
                                                    //   context: Get.context!,
                                                    //   builder: (context) {
                                                    //     return CustomLogoutAlertDialog(
                                                    //       text: "Delete",
                                                    //       content: "Are you sure you want Delete.?",
                                                    //       yesButtonText: "Yes",
                                                    //       onYesPressed: () {
                                                    //         con.addressList.removeAt(index);
                                                    //         AuthRepository().removeAddressByIdApiCall(addressId: item.id).then((value) {
                                                    //           Get.back();
                                                    //         });
                                                    //       },
                                                    //       //  () async => await DesktopRepository()
                                                    //       //     .logOutApiCall(isLoader: profileController.isLoader),
                                                    //       noButtonText: "No",
                                                    //       onNoPressed: () => Get.back(),
                                                    //       bgColor: Theme.of(context).primaryColor,
                                                    //     );
                                                    //   },
                                                    // ),
                                                    child: Icon(Icons.delete,
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      printYellow(
                                                          item.latitude);
                                                      printYellow(
                                                          item.longitude);

                                                      Get.toNamed(
                                                        AppRoutes
                                                            .locationScreen,
                                                        arguments: {
                                                          "enumType":
                                                              AddressEnum.edit,
                                                          "addressId": item.id,
                                                          "lat": item.latitude
                                                                  .isEmpty
                                                              ? null
                                                              : item.latitude,
                                                          "long": item.longitude
                                                                  .isEmpty
                                                              ? null
                                                              : item.longitude,
                                                          "name": item
                                                              .contactPersonName,
                                                          "mobileNo": item
                                                              .contactPersonNumber,
                                                          "zipCode":
                                                              item.zipCode,
                                                          "addressType":
                                                              item.addressType
                                                        },
                                                      );
                                                    },
                                                    child: Icon(Icons.edit,
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 10.w),
                                              Text(
                                                "${item.floor} ${item.address} ${item.road} ${item.house} ${item.city.cityName} ${item.state.stateName} ${item.country.countryName}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
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
                  ]));
            }));
  }
}
