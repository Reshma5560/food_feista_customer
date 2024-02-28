import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:get/get.dart';

import '../../../controller/account/components/manage_Address_controller.dart';
import '../../../controller/place_order_controller.dart';
import '../../../controller/razoraypay_controller.dart';
import '../../../repositories/desktop_repositories.dart';
import '../../../res/app_appbar.dart';
import '../../../res/app_button.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_enum.dart';
import '../../../res/app_loader.dart';
import '../../../res/app_style.dart';
import '../../../route/app_routes.dart';

class PlaceOrderScreen extends StatelessWidget {
  PlaceOrderScreen({super.key});

  final PlaceOrderController con = Get.put(PlaceOrderController());
  final ManageAddressController addCon = Get.put(ManageAddressController());
  final RazorpayController razorpayCon = Get.put(RazorpayController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.appbarBgImage, width: Get.width, height: Get.height, fit: BoxFit.fill),
          Column(
            // padding: EdgeInsets.zero,
            children: [
              CommonAppBar(
                title: "Place Order",
                onPressed: () {
                  Get.back();
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => (addCon.isLoader.value || con.isLoader.isTrue)
                        ? const AppLoader()
                        : addCon.addressList.isEmpty
                            ? const Center(child: Text("No Address Found"))
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // shrinkWrap: true,
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "ADDRESS",
                                    style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: addCon.addressList.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      var item = addCon.addressList[index];
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          con.selectedIndex.value = index;
                                          con.addressId.value = addCon.addressList[index].id;
                                        },
                                        child: Obx(
                                          () => Container(
                                            margin: const EdgeInsets.symmetric(vertical: 5),
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                            decoration: BoxDecoration(
                                              color: con.selectedIndex.value == index ? Theme.of(context).colorScheme.background : Colors.transparent,
                                              border: Border.all(
                                                  color: con.selectedIndex.value == index ? Theme.of(context).primaryColor : AppColors.grey),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      item.addressType == "home"
                                                          ? Icons.home
                                                          : item.addressType == "office"
                                                              ? Icons.work
                                                              : Icons.other_houses,
                                                      color: Theme.of(context).primaryColor,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Expanded(
                                                      child: Text(
                                                        item.addressType == "home"
                                                            ? "Home Address"
                                                            : item.addressType == "office"
                                                                ? "Work Address"
                                                                : "Other Address",
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.w),
                                                Text(
                                                  "${item.floor} ${item.address} ${item.road} ${item.house} ${item.city.cityName} ${item.state.stateName} ${item.country.countryName}",
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 12, color: AppColors.greyFontColor),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        AppRoutes.locationScreen,
                                        arguments: {
                                          "enumType": AddressEnum.add,
                                        },
                                      );
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      width: Get.width,
                                      margin: const EdgeInsets.symmetric(vertical: 5),
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.background,
                                        border: Border.all(color: Theme.of(context).primaryColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).primaryColor.withOpacity(0.5),
                                              borderRadius: BorderRadius.circular(defaultRadius),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            "Add new Address".toUpperCase(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12, color: AppColors.greyFontColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Payment Process".toUpperCase(),
                                    style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          con.selectedIndex2.value = index;

                                          if (index == 0) {
                                            con.paymentType.value = "COD";
                                          } else {
                                            con.paymentType.value = "Razor";
                                          }
                                        },
                                        child: Obx(
                                          () => Container(
                                            margin: const EdgeInsets.symmetric(vertical: 5),
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                            decoration: BoxDecoration(
                                              // color: con.selectedIndex2.value == index ? Theme.of(context).colorScheme.background : Colors.transparent,
                                              border: Border.all(
                                                  color: con.selectedIndex2.value == index ? Theme.of(context).primaryColor : AppColors.grey),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  index == 0 ? "Cash On Delivery" : "Razorpay",
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: con.selectedIndex2.value == index
                                                        ? Theme.of(context).primaryColor
                                                        : AppColors.black.withOpacity(0.5),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Add notes".toUpperCase(),
                                    style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  AppTextField(
                                    hintText: "Enter your notes",
                                    controller: con.noteCon.value,
                                    maxLines: 3,
                                  ),
                                  // Spacer(),
                                ],
                              ).paddingSymmetric(
                                horizontal: defaultPadding.w,
                              ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => (addCon.isLoader.isFalse)
            ? Padding(
                padding: const EdgeInsets.all(defaultPadding - 6).copyWith(bottom: 20),
                child: AppButton(
                  height: 35.h,
                  borderRadius: BorderRadius.circular(12.r),
                  loader: con.isLoader.value,
                  onPressed: () async {
                    if (con.addressId.value.isNotEmpty && con.paymentType.value.isNotEmpty) {
                      if (con.paymentType.value == "COD") {
                        await DesktopRepository().createOrderApiCall(
                          isLoader: con.isLoader,
                          params: {
                            "address_id": con.addressId.value,
                            "cart_id": con.cartId.value,
                            "coupon_id": con.couponId.value,
                            "payment_type_name": con.paymentType.value,
                            "payment_id": "",
                            "order_note": con.noteCon.value.text.trim(),
                          },
                        );
                      } else {
                        razorpayCon.openCheckout(amount: con.amount.value);
                      }
                    } else {
                      if (con.addressId.value.isEmpty) {
                        toast("Please select your address");
                      } else if (con.paymentType.value.isEmpty) {
                        toast("Please select your payment type");
                      }
                    }
                  },
                  title: "Place Order".toUpperCase(),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
