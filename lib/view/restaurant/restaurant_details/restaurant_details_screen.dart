import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/restaurant/restaurant_details_controller.dart';
import '../../../data/models/get_review_model.dart';
import '../../../data/models/restaurant_details_model.dart';
import '../../../packages/cached_network_image/cached_network_image.dart';
import '../../../repositories/restaurant_repositories.dart';
import '../../../res/app_appbar.dart';
import '../../../res/app_assets.dart';
import '../../../res/app_button.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_style.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  RestaurantDetailsScreen({Key? key}) : super(key: key);
  final RestaurantDetailsScreenController con = Get.put(RestaurantDetailsScreenController());

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
            child: Column(
              children: [
                CommonAppBar(
                  title: con.restaurantName,
                  onPressed: () {
                    Get.back();
                  },
                ),
                Expanded(
                  child: Obx(
                    () => con.isLoading.isTrue
                        ? const AppLoader()
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                MFNetworkImage(
                                  imageUrl: con.restaurantDetails?.coverPhoto ?? "",
                                  fit: BoxFit.fill,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                _menuTypeListModule().paddingSymmetric(horizontal: 10),
                                const SizedBox(height: 20),
                                _currentSelectedModule().paddingSymmetric(horizontal: 10),
                              ],
                            ),
                          ),
                  ),
                )
              ],
            ).paddingOnly(bottom: 20),
          );
        },
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
          return Obx(() => InkWell(
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
              ));
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
        return con.categoryList.isEmpty ? const Text("No food available") : _foodListModule();
      case "OVERVIEW":
        return _overViewListModule();
      case "REVIEW":
        return _reviewListModule();
      default:
        return _photosListModule();
    }
  }

  _foodListModule() {
    return ListView.separated(
      padding: EdgeInsets.zero,
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
            ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Food? item = con.categoryList[i].food?[index];

                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      color: AppColors.white,
                      boxShadow: AppStyle.boxShadow(),
                    ),
                    child: Row(
                      children: [
                        MFNetworkImage(
                          height: 100,
                          width: 100,
                          imageUrl: item?.image ?? "",
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  item?.veg == 0
                                      ? Image.asset(
                                          AppAssets.vegImg,
                                          height: 25,
                                        )
                                      : Image.asset(
                                          AppAssets.nonVegImg,
                                          height: 25,
                                        ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item?.foodName ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
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
                                children: [
                                  Expanded(
                                    child: Text(
                                      "₹ ${item?.price}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (item!.addons!.isNotEmpty || item.addons!.isNotEmpty) {
                                        _addItem(context, item: item);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: item?.veg == 0 ? AppColors.green : AppColors.nonVegRed,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        "ADD".toUpperCase(),
                                        style: const TextStyle(
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
          itemBuilder: (context, i) {
            ReviewComment item = con.restaurantReviewList[i];
            String dateString = item.createdAt.toString();
            DateTime dateTime = DateTime.parse(dateString);
            String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

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
    item.totalPrice?.value = double.parse(item.price.toString());

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
                                          return Padding(
                                            padding: const EdgeInsets.only(right: defaultPadding - 6),
                                            child: Obx(
                                              () => InkWell(
                                                onTap: () {
                                                  item.foodVariant?[index].isSelected?.value = index1;

                                                  data?.isSelected?.value = true;
                                                  // printWhite(index1);
                                                  // printWhite(con.variantData);

                                                  if (index1 == item.foodVariant?[index].isSelected?.value) {
                                                    if (con.variantData.isNotEmpty) {
                                                      for (var element in con.variantData) {
                                                        if (element["id"] != data?.foodVariationId) {
                                                          con.variantData.add(
                                                            {"id": item.foodVariant?[index].id, "food_variation_id": data?.id},
                                                          );
                                                          printWhite("--------111----------   ${con.variantData}");
                                                        } else {
                                                          con.variantData.remove(element);
                                                          printWhite("-----123-------------   ${con.variantData}");
                                                        }
                                                      }
                                                    } else {
                                                      con.variantData.add(
                                                        {"id": item.foodVariant?[index].id, "food_variation_id": data?.id},
                                                      );
                                                      con.variantData.take(2);
                                                      printWhite("------------------   ${con.variantData}");
                                                    }
                                                  } else {
                                                    printWhite("------------------");
                                                  }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom: defaultPadding),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        data?.variationOptionName ?? "",
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
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data.addonName ?? "",
                                              style: AppStyle.authTitleStyle().copyWith(
                                                fontSize: 15,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Obx(
                                              () => Transform.scale(
                                                scale: 0.7,
                                                child: Checkbox(
                                                  value: data.isSelected?.value,
                                                  onChanged: (value) {
                                                    data.isSelected?.value = !data.isSelected!.value;

                                                    if (data.isSelected?.value == true) {
                                                      con.addonsData.add(data.id);
                                                      printWhite(con.addonsData);
                                                    } else {
                                                      if (con.addonsData.contains(data.id)) {
                                                        con.addonsData.remove(data.id);
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
                                      item.totalPrice?.value = (item.totalPrice!.value - double.parse(item.price?.value.toString() ?? "0"));

                                      // con.totalAmount.value = con.totalAmount.value - double.parse(item.price ?? "0");
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
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
                                    style: const TextStyle(fontWeight: FontWeight.w700),
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
                                      item.totalPrice?.value = (item.totalPrice!.value + double.parse(item.price?.value.toString() ?? "0"));

                                      // con.totalAmount.value = con.totalAmount.value + double.parse(item.price?.value.toString() ?? "0");
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
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
                                  "₹${item.totalPrice.toString()}",
                                  style: AppStyle.authTitleStyle().copyWith(fontSize: 24, color: AppColors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppButton(
                        width: 100,
                        height: 30,
                        onPressed: () {
                          RestaurantRepository().addToCartItemAPI(
                            params: {
                              "restaurant_id": con.restaurantDetails?.id ?? "",
                              "food_id": item.id ?? "",
                              "total_price": item.totalPrice?.value.toString() ?? "",
                              "total_qty": item.itemCount?.value.toString() ?? "",
                              "variant_options": [],
                              "addons": con.addonsData,
                            },
                          );
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
    );
  }
}
