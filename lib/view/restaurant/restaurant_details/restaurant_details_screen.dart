import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:foodapplication/utils/local_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/restaurant/restaurant_details_controller.dart';
import '../../../data/models/get_review_model.dart';
import '../../../data/models/restaurant_details_model.dart';
import '../../../packages/cached_network_image/cached_network_image.dart';
import '../../../repositories/restaurant_repositories.dart';
import '../../../res/app_assets.dart';
import '../../../res/app_button.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_style.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  RestaurantDetailsScreen({Key? key}) : super(key: key);
  final RestaurantDetailsScreenController con = Get.put(RestaurantDetailsScreenController());

  // final CartDataController cartDataController = Get.find<CartDataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: TweenAnimationBuilder(
        tween: Tween(begin: 20.0, end: 1.0),
        duration: const Duration(milliseconds: 1000),
        builder: (BuildContext context, double value, Widget? child) {
          return AnimatedOpacity(
            opacity: value == 20 ? 0 : 1,
            duration: const Duration(milliseconds: 700),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(AppAssets.appbarBgImage, width: Get.width, fit: BoxFit.fill),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          // color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Text(
                        "Restaurant",
                        style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                      ),
                      const Text("Category", style: TextStyle(color: Colors.transparent)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.1),
                  child: Column(
                    children: [
                      // CommonAppBar(
                      //   title: "Restaurant", // con.restaurantName,
                      //   onPressed: () {
                      //     Get.back();
                      //   },
                      // ),
                      Expanded(
                        child: Obx(
                          () => con.isLoading.isTrue
                              ? const AppLoader()
                              : SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                                        child: MFNetworkImage(
                                          backgroundColor: AppColors.white,
                                          imageUrl: con.restaurantDetails?.coverPhoto ?? "",
                                          fit: BoxFit.fill,
                                          height: 230,
                                          width: Get.width,
                                          borderRadius: BorderRadius.circular(20.r),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        con.restaurantName,
                                        style: TextStyle(color: AppColors.black, fontSize: 22.sp, fontWeight: FontWeight.w700),
                                      ).paddingSymmetric(horizontal: 10.w),
                                      Text(
                                        con.restaurantDetails?.address ?? " ",
                                        style: TextStyle(color: AppColors.black, fontSize: 12.sp, fontWeight: FontWeight.w500),
                                      ).paddingSymmetric(horizontal: 10.w),
                                      Row(
                                        children: [
                                          Text(
                                            con.restaurantDetails?.distance ?? " ",
                                            style: TextStyle(color: AppColors.black, fontSize: 13.sp, fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Container(
                                            height: 25,
                                            width: 45,
                                            alignment: Alignment.center,
                                            // padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 10.sp,
                                                ),
                                                const SizedBox(width: 3),
                                                Text(
                                                  con.restaurantDetails?.ratingCount ?? "",
                                                  style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 12.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ).paddingSymmetric(horizontal: 10.w),
                                      const SizedBox(height: 20),
                                      _menuTypeListModule().paddingSymmetric(horizontal: 10),
                                      const SizedBox(height: 20),
                                      _currentSelectedModule().paddingSymmetric(horizontal: 10),
                                    ],
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Obx(
        () => (LocalStorage.token.value.isNotEmpty && con.menuList[con.selectMenu.value] == "REVIEW" && con.userOrderCount.value > 0)
            ? FloatingActionButton.extended(
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "LEAVE COMMENTS",
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
                            const SizedBox(height: defaultPadding),
                            Text(
                              "Rating *",
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
                                con.ratingValue.value = rating;
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
                                  if (con.ratingValue.value == 0.0) {
                                    toast("Please select rating value minimum 1");
                                  }

                                  if (con.isValid.isFalse && con.ratingValue.value != 0.0) {
                                    await RestaurantRepository().addRestaurantReviewAPI(params: {
                                      "restaurant_id": con.restaurantId,
                                      "description": con.commentCon.value.text.trim(),
                                      "rating": con.ratingValue.value.toString(),
                                    });
                                  }
                                },
                                loader: con.isLoadingReview.value,
                                title: "Submit",
                              ),
                            ),
                          ],
                        ),
                      ),
                      // contentPadding: EdgeInsets.zero,
                      // actionsPadding: EdgeInsets.zero,
                      // title: const Text("Alert Dialog Box"),
                      // content: Container(
                      //   width: Get.width,
                      //   decoration: BoxDecoration(
                      //     color: AppColors.white,
                      //   ),
                      //   child: const Text("You have raised a Alert Dialog Box"),
                      // ),
                      // actions: <Widget>[
                      //   TextButton(
                      //     onPressed: () {
                      //       Navigator.of(ctx).pop();
                      //     },
                      //     child: Container(
                      //       color: Colors.green,
                      //       padding: const EdgeInsets.all(14),
                      //       child: const Text("okay"),
                      //     ),
                      //   ),
                      // ],
                    ),
                  ).whenComplete(() {
                    con.isValid.value = false;
                    con.commentError.value = "";
                    con.commentCon.value.clear();
                  });
                },
                label: Text(
                  "Add Review",
                  style: AppStyle.customAppBarTitleStyle().copyWith(fontSize: 14),
                ),
                icon: const Icon(Icons.add),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _menuTypeListModule() {
    return SizedBox(
      height: 33,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: con.menuList.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                con.selectMenu.value = index;
                _handleMenuItemClick(context, con.menuList[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: con.selectMenu.value == index ? Theme.of(context).primaryColor : AppColors.white,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    con.menuList[index],
                    style: TextStyle(
                        fontSize: 11,
                        color: con.selectMenu.value == index ? AppColors.white : Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ).paddingSymmetric(horizontal: 10),
                ),
              ).paddingOnly(right: 10),
            ),
          );
        },
      ),
    );
  }

  void _handleMenuItemClick(BuildContext context, String menuItem) {
    log("menuItem $menuItem");
    con.selectMenu.value = con.menuList.indexOf(menuItem);
  }

  Widget _currentSelectedModule() {
    switch (con.menuList[con.selectMenu.value]) {
      case "ORDER ONLINE":
        return con.categoryList.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: Get.height / 4),
                child: Text(
                  "No food available",
                  style: AppStyle.errorTextStyle().copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              )
            : _foodListModule();
      case "OVERVIEW":
        return _overViewListModule();
      case "REVIEW":
        return con.restaurantReviewList.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: Get.height / 4),
                child: Text(
                  "No review available",
                  style: AppStyle.errorTextStyle().copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              )
            : _reviewListModule();
      default:
        return con.restaurantGalleryList.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: Get.height / 4),
                child: Text(
                  "No photo available",
                  style: AppStyle.errorTextStyle().copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              )
            : _photosListModule();
    }
  }

  _foodListModule() {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        printWhite(con.categoryList[i].food?.length);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              con.categoryList[i].categoryName ?? "",
              style: AppStyle.authTitleStyle().copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: defaultPadding - 6,
            ),
            ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Food? item = con.categoryList[i].food?[index];

                  return Container(
                    // padding: const EdgeInsets.all(8),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(defaultRadius),
                    //   color: AppColors.white,
                    //   boxShadow: AppStyle.boxShadow(),
                    // ),
                    // margin:
                    //     const EdgeInsets.symmetric(horizontal: defaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: AppStyle.boxShadow(),
                      color: Theme.of(context).colorScheme.background,
                    ),

                    child: Row(
                      children: [
                        MFNetworkImage(
                          height: 100,
                          width: 100,
                          imageUrl: item?.image ?? "",
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item?.foodName ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: item?.veg == 0
                                        ? Image.asset(
                                            AppAssets.vegImg,
                                            height: 20,
                                          )
                                        : Image.asset(
                                            AppAssets.nonVegImg,
                                            height: 20,
                                          ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item?.description ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.searchFiledHintText,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "₹ ${item?.price?.value}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (LocalStorage.token.isNotEmpty) {
                                        if (item!.foodVariant!.isNotEmpty || item.addons!.isNotEmpty) {
                                          // cartDataController.foodVariant.value = item.foodVariant ?? [];
                                          // cartDataController.addons.value = item.addons ?? [];

                                          _addItem(context, item: item);
                                        } else {
                                          await RestaurantRepository().addToCartItemAPI(
                                            params: {
                                              "restaurant_id": con.restaurantDetails?.id ?? "",
                                              "food_id": item.id ?? "",
                                              "total_price": item.price.toString() ?? "",
                                              "total_qty": item.itemCount?.value.toString() ?? "",
                                              "variant_options": con.variantDataForAPI,
                                              "addons": con.addonsData,
                                            },
                                          );
                                        }
                                      } else {
                                        toast("Please login for adding item into cart!!");
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                          //  item?.veg == 0
                                          //     ? AppColors.green
                                          //     : AppColors.nonVegRed,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        "ADD".toUpperCase(),
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).paddingSymmetric(horizontal: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, ind1) {
                  return Divider(color: AppColors.allGroupsText);
                },
                itemCount: con.categoryList[i].food!.length),
          ],
        );
      },
      separatorBuilder: (context, ind) => const SizedBox(
        height: defaultPadding,
      ),
      itemCount: con.categoryList.length,
    );
  }

  _overViewListModule() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              "About this place",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: AppColors.kPrimaryColor.withOpacity(0.4),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.kPrimaryColor),
              ),
              Divider(
                color: AppColors.kPrimaryColor.withOpacity(0.4),
              ),
              Text(
                con.restaurantDetails!.address ?? "",
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 10),
        ),
        const SizedBox(height: 20),
        if (con.cuisineRestaurantList.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.kPrimaryColor.withOpacity(0.4),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cuisines",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.kPrimaryColor),
                ),
                Divider(
                  color: AppColors.kPrimaryColor.withOpacity(0.4),
                ),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: con.cuisineRestaurantList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: (BuildContext context, int i) {
                    CuisineRestaurant item = con.cuisineRestaurantList[i];

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.hintText.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Text(item.cuisine!.cuisineName!).paddingSymmetric(horizontal: 10, vertical: 5),
                      ),
                    );
                  },
                )
              ],
            ).paddingSymmetric(horizontal: 10, vertical: 10),
          ),
        const SizedBox(height: 20),
        if (con.restaurantAmenityList.isNotEmpty)
          Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: AppColors.kPrimaryColor.withOpacity(0.4),
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "More Info",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.kPrimaryColor),
                ),
                Divider(
                  color: AppColors.kPrimaryColor.withOpacity(0.4),
                ),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: con.restaurantAmenityList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: (BuildContext context, int i) {
                    RestaurantAmenity item = con.restaurantAmenityList[i];

                    return Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.hintText.withOpacity(0.1)),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline),
                          Expanded(
                            child: Text(
                              item.amenities!.name!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ).paddingSymmetric(horizontal: 10, vertical: 5),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 10),
                    );
                  },
                )
              ],
            ).paddingSymmetric(horizontal: 10, vertical: 10),
          ),
      ],
    ).paddingOnly(top: 20, right: 20, left: 20);
  }

  _photosListModule() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: con.restaurantGalleryList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (BuildContext context, int i) {
        Gallery item = con.restaurantGalleryList[i];

        return MFNetworkImage(
          imageUrl: item.image ?? "",
          fit: BoxFit.fill,
          borderRadius: BorderRadius.circular(10),
        );
      },
    );
  }

  _reviewListModule() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "COMMENTS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48, top: defaultPadding),
          itemBuilder: (context, i) {
            ReviewComment item = con.restaurantReviewList[i];
            String dateString = item.createdAt.toString();
            DateTime dateTime = DateTime.parse(dateString);
            String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);

            return Row(
              children: [
                MFNetworkImage(
                  height: 80,
                  width: 80,
                  imageUrl: item.user?.image ?? "",
                  fit: BoxFit.fill,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${item.user?.firstName} ${item.user?.lastName}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        item.body ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: con.restaurantReviewList.length,
        ),
      ],
    );
  }

  _addItem(BuildContext context, {required Food item}) {
    item.totalPrice?.value = (double.parse(item.price!.value.toString()) * item.itemCount!.value);

    return Get.bottomSheet(
      isDismissible: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius * 3),
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultRadius * 3),
            topRight: Radius.circular(defaultRadius * 3),
          ),
        ),
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding).copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.foodName ?? "",
                      style: AppStyle.authTitleStyle().copyWith(fontSize: 24, color: AppColors.black),
                    ),
                    InkWell(
                      onTap: () {
                        con.isOpen.value = false;
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        color: AppColors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPadding - 6,
              ),
              Container(
                height: 1,
                width: Get.width,
                color: AppColors.black,
              ),
              const SizedBox(
                height: defaultPadding - 6,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (item.foodVariant != null && item.foodVariant!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Column(
                            children: List.generate(
                              item.foodVariant!.length,
                              (index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.foodVariant![index].variationName ?? "",
                                      style: AppStyle.authTitleStyle().copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: defaultPadding - 6,
                                    ),
                                    Column(
                                      children: List.generate(
                                        item.foodVariant![index].foodVariantOption?.length ?? 0,
                                        (index1) {
                                          var data = item.foodVariant![index].foodVariantOption?[index1];
                                          if (index1 == item.foodVariant?[index].isSelected?.value) {
                                            con.variantData.add(
                                              {"id": item.foodVariant?[index].id, "food_variation_id": data?.id, "price": data?.price},
                                            );
                                            item.variantPrice?.value = item.variantPrice!.value + double.parse(data?.price.toString() ?? "0");
                                            item.totalPrice?.value = (item.totalPrice!.value + double.parse(data?.price ?? "0"));
                                            con.variantDataForAPI.add(data?.id);
                                            con.variantData.take(2);
                                            printWhite("------------------   ${con.variantData}");
                                            printWhite("------------------   ${con.variantDataForAPI}");
                                          }

                                          return Padding(
                                            padding: const EdgeInsets.only(right: defaultPadding - 6),
                                            child: Obx(
                                              () => InkWell(
                                                onTap: () {
                                                  item.foodVariant?[index].isSelected?.value = index1;

                                                  if (index1 == item.foodVariant?[index].isSelected?.value) {
                                                    if (con.variantData.isNotEmpty) {
                                                      bool idExists = con.variantData.any((element) => element['id'] == data?.foodVariationId);
                                                      int selIndex = con.variantData.indexWhere((element) => element["id"] == data?.foodVariationId);

                                                      printWhite("--------0----------   $idExists");
                                                      printWhite("--------1----------   $selIndex");

                                                      if (idExists == false) {
                                                        con.variantData.add(
                                                          {"id": item.foodVariant?[index].id, "food_variation_id": data?.id, "price": data?.price},
                                                        );
                                                        item.variantPrice?.value =
                                                            item.variantPrice!.value + double.parse(data?.price.toString() ?? "0");
                                                        item.totalPrice?.value = (item.totalPrice!.value + double.parse(data?.price ?? "0"));
                                                        con.variantDataForAPI.add(data?.id);
                                                        printWhite("------------------   ${con.variantData}");
                                                        printWhite("--------2----------   ${con.variantDataForAPI}");
                                                      } else {
                                                        item.totalPrice?.value =
                                                            (item.totalPrice!.value - double.parse(con.variantData[selIndex]["price"] ?? "0"));
                                                        con.variantData.removeAt(selIndex);

                                                        con.variantDataForAPI.removeAt(selIndex);
                                                        item.variantPrice?.value =
                                                            item.variantPrice!.value + double.parse(data?.price.toString() ?? "0");
                                                        item.totalPrice?.value = (item.totalPrice!.value + double.parse(data?.price ?? "0"));
                                                        con.variantData.insert(
                                                          selIndex,
                                                          {"id": item.foodVariant?[index].id, "food_variation_id": data?.id, "price": data?.price},
                                                        );
                                                        con.variantDataForAPI.add(data?.id);
                                                        printWhite("------------------   ${con.variantData}");
                                                        printWhite("--------3----------   ${con.variantDataForAPI}");
                                                      }
                                                    } /*else {
                                                      con.variantData.add(
                                                        {"id": item.foodVariant?[index].id, "food_variation_id": data?.id, "price": data?.price},
                                                      );
                                                      item.totalPrice?.value = (item.totalPrice!.value + double.parse(data?.price ?? "0"));
                                                      con.variantDataForAPI.add(data?.id);
                                                      con.variantData.take(2);
                                                      printWhite("------------------   ${con.variantData}");
                                                      printWhite("------------------   ${con.variantDataForAPI}");
                                                    }*/
                                                  }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom: defaultPadding),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${data?.variationOptionName ?? " "} (${data?.price ?? "0"})",
                                                        style: AppStyle.authTitleStyle().copyWith(
                                                          fontSize: 15,
                                                          color: AppColors.black,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 15,
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                            color: (index1 == item.foodVariant?[index].isSelected?.value)
                                                                ? Theme.of(context).primaryColor
                                                                : AppColors.black,
                                                            width: 2,
                                                          ),
                                                          // color: Theme.of(context).primaryColor,
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(1.5),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: (index1 == item.foodVariant?[index].isSelected?.value)
                                                                  ? Theme.of(context).primaryColor
                                                                  : AppColors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: defaultPadding - 6,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      (item.addons != null && item.addons!.isNotEmpty)
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "AddOns",
                                    style: AppStyle.authTitleStyle().copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Column(
                                    children: List.generate(
                                      item.addons!.length,
                                      (index) {
                                        var data = item.addons![index];

                                        if (data.isSelected?.value == true) {
                                          con.addonsData.add(data.id);
                                          item.addonsPrice?.value = item.addonsPrice!.value + double.parse(data.price.toString());
                                          item.totalPrice?.value = (item.totalPrice!.value + double.parse(data.price.toString()));
                                          // printWhite(con.addonsData);
                                        }

                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${data.addonName ?? " "}(${data.price ?? "0"})",
                                              style: AppStyle.authTitleStyle().copyWith(
                                                fontSize: 15,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Obx(
                                              () => Transform.scale(
                                                scale: 0.9,
                                                child: Checkbox(
                                                  value: data.isSelected?.value,
                                                  onChanged: (value) {
                                                    data.isSelected?.value = !data.isSelected!.value;

                                                    if (data.isSelected?.value == true) {
                                                      con.addonsData.add(data.id);
                                                      item.addonsPrice?.value = item.addonsPrice!.value + double.parse(data.price.toString());
                                                      item.totalPrice?.value =
                                                          (item.totalPrice!.value + (double.parse(data.price.toString()) * item.itemCount!.value));
                                                      printWhite(con.addonsData);
                                                    } else {
                                                      if (con.addonsData.contains(data.id)) {
                                                        con.addonsData.remove(data.id);
                                                        item.addonsPrice?.value = item.addonsPrice!.value - double.parse(data.price.toString());
                                                        item.totalPrice?.value =
                                                            (item.totalPrice!.value - (double.parse(data.price.toString()) * item.itemCount!.value));
                                                        printWhite(con.addonsData);
                                                      }
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: AppStyle.boxShadow(
                    offset: const Offset(0, -4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding - 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (item.itemCount!.value < item.minimumCartQuantity!.toInt()) {
                                    } else {
                                      item.itemCount?.value--;

                                      ///old one
                                      item.totalPrice?.value = (item.totalPrice!.value -
                                          (double.parse(
                                                item.price?.value.toString() ?? "0",
                                              ) +
                                              double.parse(
                                                item.addonsPrice.toString(),
                                              ) +
                                              double.parse(
                                                item.variantPrice.toString(),
                                              )));

                                      // item.totalPrice?.value = (item.totalPrice!.value - double.parse(item.totalPrice!.value.toString()));

                                      // con.totalAmount.value = con.totalAmount.value - double.parse(item.price ?? "0");
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(25)),
                                    child: Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Obx(
                                  () => Text(
                                    item.itemCount?.value.toString() ?? "",
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (item.itemCount!.value >= item.maximumCartQuantity!.toInt()) {
                                    } else {
                                      // itemCount++;
                                      item.itemCount?.value++;
                                      // item.totalPrice?.value = (item.totalPrice!.value + double.parse(item.price?.value.toString() ?? "0"));///old one
                                      item.totalPrice?.value = (item.totalPrice!.value +
                                          (double.parse(
                                                item.price?.value.toString() ?? "0",
                                              ) +
                                              double.parse(
                                                item.addonsPrice.toString(),
                                              ) +
                                              double.parse(
                                                item.variantPrice.toString(),
                                              )));

                                      // con.totalAmount.value = con.totalAmount.value + double.parse(item.price?.value.toString() ?? "0");
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(25)),
                                    child: Icon(
                                      Icons.add,
                                      size: 15,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Obx(
                                () => Text(
                                  "₹${item.totalPrice?.value.toString()}",
                                  style: AppStyle.authTitleStyle().copyWith(fontSize: 24, color: AppColors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppButton(
                        width: 110,
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding - 10),
                        onPressed: () async {
                          await RestaurantRepository().addToCartItemAPI(
                            params: {
                              "restaurant_id": con.restaurantDetails?.id ?? "",
                              "food_id": item.id ?? "",
                              "total_price": item.totalPrice?.value.toString() ?? "",
                              "total_qty": item.itemCount?.value.toString() ?? "",
                              "variant_options": con.variantDataForAPI,
                              "addons": con.addonsData,
                            },
                          );
                          Get.back();
                        },
                        title: "Add to cart",
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).whenComplete(() {
      con.variantData.clear();
      con.variantDataForAPI.clear();
    });
  }
}
