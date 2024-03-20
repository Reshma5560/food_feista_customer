import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/my_order_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../repositories/desktop_repositories.dart';
import '../../../../res/app_strings.dart';
import '../../../../res/widgets/empty_element.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key});

  final MyOrderController con = Get.put(MyOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.appbarBgImage,
            fit: BoxFit.fill,
            width: Get.width,
            height: Get.height,
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My Order",
                  style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.1),
            child: Column(
              children: [
                // _appHeader(context),
                const SizedBox(height: 10),
                Expanded(
                  child: Obx(() => con.isLoading.isTrue ? const AppLoader() : _bodyModule()),
                ),
              ],
            ).paddingOnly(bottom: 20),
          ),
        ],
      ),
    );
  }

  Widget _bodyModule() {
    return Container(
      child: con.orderList.isEmpty
          ? RefreshIndicator(
              onRefresh: () async {
                await DesktopRepository().getOrderApiCall();
              },
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  EmptyElement(
                    height: Get.height / 1.8,
                    imageHeight: Get.width / 2.4,
                    imageWidth: Get.width / 2,
                    spacing: 0,
                    title: AppStrings.wishListNotFoundTitle,
                    subtitle: AppStrings.wishListNotFoundSubtitle,
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await DesktopRepository().getOrderApiCall();
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                shrinkWrap: true,
                itemCount: con.orderList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = con.orderList[index];

                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.orderTrackScreen, arguments: {'orderId': item.id});
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: AppStyle.boxShadow(),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Theme.of(context).colorScheme.background, AppColors.white])
                          // color: Theme.of(context).colorScheme.background,
                          ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              item.restaurant?.logo ?? "",
                              height: 100,
                              // width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      item.restaurant?.restaurantName ?? "",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Theme.of(context).primaryColor),
                                    )),
                                    Text(
                                      "\$${item.orderAmount.toString()}",
                                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                    )
                                  ],
                                ),
                                Text(DateFormat('DD MMM yyyy, HH:mma').format(item.createdAt ?? DateTime.now()),
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11.sp, color: AppColors.black)),
                                Text("${item.orderDetail?[0].quantity} Item",
                                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11.sp, color: AppColors.black)),
                                Text(
                                  "Order ID - ${item.invoiceNumber}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Payment Type - ${item.paymentType?.paymentTypeName ?? ""}"),
                                Text(item.orderStatus?.statusName ?? "",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.green))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
