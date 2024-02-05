import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/my_order_controller.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/widgets/app_bar.dart';
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
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        tween: Tween(begin: 20.0, end: 1.0),
        builder: (context, value, child) {
          return AnimatedOpacity(
            opacity: value == 20 ? 0 : 1,
            duration: const Duration(milliseconds: 700),
            child: Obx(
              () => con.isLoading.isTrue
                  ? const AppLoader()
                  : Column(
                      children: [
                        _appHeader(context),
                        const SizedBox(height: 10),
                        Expanded(
                          child: _bodyModule(),
                        ),
                      ],
                    ).paddingOnly(bottom: 20),
            ),
          );
        },
      ),
    );
  }

  Widget _appHeader(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(defaultRadius * 3),
        bottomRight: Radius.circular(defaultRadius * 3),
      ),
      child: MyAppBar(
        bgColor: Theme.of(context).colorScheme.background,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_outlined,
        //     color: Theme.of(context).primaryColor,
        //   ),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        title: "My Order",
        centerTitle: true,
        titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: Colors.black),
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
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                      boxShadow: AppStyle.boxShadow(),
                      color: AppColors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.network(
                              item.restaurant?.logo ?? "",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            )),
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
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.black)),
                              Text("${item.orderDetail?[0].quantity} Item",
                                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: AppColors.black)),
                              Text(
                                "Order ID - ${item.invoiceNumber}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text("Payment Type - ${item.paymentType?.paymentTypeName ?? ""}"),
                              Text(item.orderStatus?.statusName ?? "",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.black))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
