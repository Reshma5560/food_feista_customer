// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/order_tracker_controller.dart';
import 'package:foodapplication/packages/cached_network_image/cached_network_image.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../res/app_text_field.dart';
import '../../../../../res/ui_utils.dart';

class OrderTrackScreen extends StatelessWidget {
  OrderTrackScreen({super.key});

  final OrderTrackController con = Get.put(OrderTrackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => con.isLoading.isTrue
            ? const AppLoader()
            : Column(
                children: [
                  _appHeader(context),
                  const SizedBox(height: 10),
                  Expanded(child: _bodyModule()),
                ],
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Obx(
        () => (con.orderTrackModel.value.data?.orderStatus?.statusName == "Order Delivered" && con.orderTrackModel.value.data?.comments == null)
            ? FloatingActionButton.extended(
                label: Text(
                  "Add Review",
                  style: AppStyle.customAppBarTitleStyle().copyWith(fontSize: 14),
                ),
                icon: const Icon(Icons.add),
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (ctx) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      insetPadding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "REVIEW",
                                    style: AppStyle.authTitleStyle().copyWith(fontSize: 18.sp, color: AppColors.black),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.clear, color: Colors.black),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(height: 1, color: Colors.grey),
                              const SizedBox(height: defaultPadding),
                              Text(
                                "Order Rating *",
                                style: AppStyle.authSubtitleStyle(),
                              ),
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.only(right: 5),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  con.ratingForOrderValue.value = rating;
                                },
                              ),
                              const SizedBox(height: defaultPadding),
                              Text(
                                "Deliverymen Rating *",
                                style: AppStyle.authSubtitleStyle(),
                              ),
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.only(right: 5),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  con.ratingForDeliveryMenValue.value = rating;
                                },
                              ),
                              const SizedBox(height: defaultPadding),
                              Text(
                                "COMMENT *",
                                style: AppStyle.authSubtitleStyle(),
                              ),
                              const SizedBox(height: 5),
                              Obx(
                                () => AppTextField(
                                  maxLines: 3,
                                  controller: con.commentCon.value,
                                  showError: con.isValid.value,
                                  errorMessage: con.commentError.value,
                                ),
                              ),
                              const SizedBox(height: defaultPadding),
                              Obx(
                                () => AppButton(
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();

                                    /// comment validation
                                    if (con.commentCon.value.text.trim().isEmpty) {
                                      con.isValid.value = true;
                                      con.commentError.value = "Please enter your comment";
                                    } else {
                                      con.isValid.value = false;
                                    }

                                    ///rating validation
                                    if (con.ratingForOrderValue.value == 0.0) {
                                      toast("Please select Order rating value minimum 1");
                                    } else if (con.ratingForDeliveryMenValue.value == 0.0) {
                                      toast("Please select deliverymen rating value minimum 1");
                                    }

                                    if (con.isValid.isFalse && con.ratingForOrderValue.value != 0.0 && con.ratingForDeliveryMenValue.value != 0.0) {
                                      await DesktopRepository().addOrderReviewAPI(
                                        params: {
                                          "order_id": con.orderId,
                                          "body": con.commentCon.value.text.trim(),
                                          "order_rating": con.ratingForOrderValue.value.toString(),
                                          "deliveryman_rating": con.ratingForDeliveryMenValue.value.toString(),
                                        },
                                      );
                                    }
                                  },
                                  loader: con.isLoadingReview.value,
                                  title: "Submit",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).whenComplete(() {
                    con.isValid.value = false;
                    con.commentError.value = "";
                    con.commentCon.value.clear();
                  });
                },
              )
            : const SizedBox.shrink(),
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: "Track Order",
          centerTitle: true,
          titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 14)),
    );
  }

  Widget _bodyModule() {
    var item = con.orderTrackModel.value.data;
    return ListView(
      padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48),
      physics: const RangeMaintainingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text(
          "Order Summery",
          style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w600),
        ),
        Text(
          "${item?.restaurant?.restaurantName}",
          style: TextStyle(fontSize: 14.sp, color: AppColors.black, fontWeight: FontWeight.w600),
        ),
        Text(
          "${item?.restaurant?.address}",
          style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w500),
        ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Your Order",
          style: TextStyle(fontSize: 14.sp, color: AppColors.black, fontWeight: FontWeight.w600),
        ),
        Divider(
          color: AppColors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Item total",
              style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w500),
            ),
            Text(
              "₹${item?.orderAmount}",
              style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        _orderItemList(),
        Divider(
          color: AppColors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Taxes",
              style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
            Text(
              "₹0.0",
              style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Charge",
              style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
            Text(
              "₹0.0",
              style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Restaurant Packibg Charges",
              style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
            Text(
              "₹0.0",
              style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Divider(
          color: AppColors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Grand total",
              style: TextStyle(fontSize: 15.sp, color: AppColors.black, fontWeight: FontWeight.w700),
            ),
            Text(
              "₹${item?.orderAmount}",
              style: TextStyle(fontSize: 15.sp, color: AppColors.black, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Divider(
          color: AppColors.grey,
        ),
        SizedBox(
          height: defaultPadding.h,
        ),
        Text(
          "Order Details",
          style: TextStyle(fontSize: 14.sp, color: AppColors.black, fontWeight: FontWeight.w600),
        ),
        Divider(
          color: AppColors.grey,
        ),
        Text(
          "Order Number",
          style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        Text(
          "${item?.invoiceNumber}",
          style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Payment",
          style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        Text(
          "${item?.paymentStatus?.statusName}",
          style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Date",
          style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        Text(
          "${DateFormat("MMMM DD,yyy").format(item?.createdAt ?? DateTime.now())} at ${DateFormat("HH:mm a").format(item?.createdAt ?? DateTime.now())}",
          style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Phone number",
          style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        Text(
          item?.user?.phone?.replaceRange(6, 10, "XXXX") ?? "",
          style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10.h,
        ),
        Visibility(
          visible: item?.deliveryAddress != null ? true : false,
          child: Text(
            "Deliver to",
            style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
          ),
        ),
        Visibility(
          visible: item?.deliveryAddress != null ? true : false,
          child: Text(
            "${item?.deliveryAddress?.house ?? ""} ${item?.deliveryAddress?.road ?? ""} ${item?.deliveryAddress?.address}, ${item?.deliveryAddress?.city?.cityName}, ${item?.deliveryAddress?.state?.stateName}.",
            style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Divider(
          color: AppColors.grey,
        ),
        Center(
          child: InkWell(
            onTap: () async {
              Uri phoneno = Uri.parse('tel:+91${item?.restaurant?.phone}');
              if (await launchUrl(phoneno)) {
                //dialer opened
              } else {
                //dailer is not opened
              }
            },
            child: Text("Call ${item?.restaurant?.restaurantName} (${item?.restaurant?.phone})",
                style: TextStyle(fontSize: 14, color: Theme.of(Get.context!).primaryColor, fontWeight: FontWeight.w600)),
          ),
        ),
        Divider(
          color: AppColors.grey,
        ),
        SizedBox(
          height: 15.h,
        ),
        Obx(
          () => con.isCanceled.isTrue
              ? AppButton(
                  onPressed: () {},
                  title: "CANCEL ORDER",
                )
              : const SizedBox.shrink(),
        ),
      ],
    ).paddingSymmetric(horizontal: 10.w);
  }

  Widget _orderItemList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: con.orderTrackModel.value.data?.orderDetail?.length,
      itemBuilder: (BuildContext context, int index) {
        var item = con.orderTrackModel.value.data?.orderDetail?[index];
        return Row(
          children: [
            MFNetworkImage(
              imageUrl: item?.food?.image ?? "",
              height: 60.h,
              width: 60.w,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: defaultPadding - 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item?.food?.foodName ?? "",
                          style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w500),
                        ),
                        Image.asset(
                          item?.food?.veg == 0 ? AppAssets.nonVegImg : AppAssets.vegImg,
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                    // Visibility(
                    //   visible: item.variant.isNotEmpty ? true : false,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         "Types of ${item.food.foodName} : ",
                    //         style: TextStyle(fontSize: 12),
                    //       ),
                    //       SizedBox(
                    //         height: 20,
                    //         child: ListView.builder(
                    //           scrollDirection: Axis.horizontal,
                    //           shrinkWrap: true,
                    //           itemCount: item.variant.length,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             return Text(
                    //               "${item.variant[index].foodVariant.variationName} (${item.variant[index].variationOptionName})",
                    //               maxLines: 2,
                    //               overflow: TextOverflow.ellipsis,
                    //               style: TextStyle(fontSize: 12),
                    //             );
                    //           },
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Text(
                      "${item?.quantity} X ₹${item?.food?.price}",
                      style: TextStyle(fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
