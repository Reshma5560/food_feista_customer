import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/components/manage_Address_controller.dart';
import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:foodapplication/res/app_appbar.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

class ManageAddressScreen extends StatelessWidget {
  ManageAddressScreen({super.key});

  final con = Get.put(ManageAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(AppRoutes.locationScreen),
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
                  child: Column(children: [
                    CommonAppBar(
                      title: "Manage Address",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Obx(
                      () => con.isLoader.value
                          ? const AppLoader()
                          : con.getAddressData!.data!.isEmpty
                              ? const Align(alignment: Alignment.center, child: Text("No Address Found"))
                              : Expanded(
                                  child: ListView(
                                    children: [
                                      Text(
                                        "SAVED ADDRESS",
                                        style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      ListView.builder(
                                        itemCount: con.getAddressData?.data?.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context, int index) {
                                          var item = con.getAddressData!.data?[index];
                                          return Container(
                                            margin: const EdgeInsets.symmetric(vertical: 5),
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                            decoration:
                                                BoxDecoration(border: Border.all(color: AppColors.grey), borderRadius: BorderRadius.circular(15)),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      item?.addressType == "home"
                                                          ? Icons.home
                                                          : item?.addressType == "office"
                                                              ? Icons.work
                                                              : Icons.other_houses,
                                                      color: Theme.of(context).primaryColor,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Expanded(
                                                      child: Text(
                                                        item?.addressType == "home"
                                                            ? "Home Address"
                                                            : item?.addressType == "office"
                                                                ? "Work Address"
                                                                : "Other Address",
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        AuthRepository().removeAddressByIdApiCall(addressId: item?.id);
                                                      },
                                                      child: Icon(Icons.delete, color: Theme.of(context).primaryColor),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Icon(Icons.edit, color: Theme.of(context).primaryColor)
                                                  ],
                                                ),
                                                SizedBox(height: 10.w),
                                                Text(
                                                  "${item?.floor} ${item?.address} ${item?.road} ${item?.house} ${item?.city.cityName} ${item?.state.stateName} ${item?.country.countryName}",
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 12, color: AppColors.greyFontColor),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ).paddingSymmetric(horizontal: defaultPadding.w),
                                ),
                    ),
                  ]));
            }));
  }
}
