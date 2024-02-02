import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/restaurant/restaurant_details_controller.dart';
import '../../../data/models/get_review_model.dart';
import '../../../data/models/restaurant_details_model.dart';
import '../../../packages/cached_network_image/cached_network_image.dart';
import '../../../res/app_appbar.dart';
import '../../../res/app_assets.dart';
import '../../../res/app_colors.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  RestaurantDetailsScreen({Key? key}) : super(key: key);
  final RestaurantDetailsScreenController con =
      Get.put(RestaurantDetailsScreenController());

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
                                  imageUrl: con.restaurantDetails?.logo ?? "",
                                  fit: BoxFit.fill,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                _menuTypeListModule()
                                    .paddingSymmetric(horizontal: 10),
                                const SizedBox(height: 20),
                                _currentSelectedModule()
                                    .paddingSymmetric(horizontal: 10),
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
                    color: con.selectMenu.value == index
                        ? Theme.of(context).primaryColor
                        : AppColors.white,
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
                          color: con.selectMenu.value == index
                              ? AppColors.white
                              : Theme.of(context).primaryColor,
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
        return con.foodList.isEmpty
            ? const Text("No food available")
            : _foodListModule();
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
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        Food item = con.foodList[i];
        return Row(
          children: [
            MFNetworkImage(
              height: 100,
              width: 100,
              imageUrl: item.image ?? "",
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
                      item.veg == 0
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
                    item.foodName ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    item.description ?? "",
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
                          "₹ ${item.price}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: item.veg == 0
                                ? AppColors.green
                                : AppColors.nonVegRed,
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) =>
          Divider(color: AppColors.allGroupsText),
      itemCount: con.foodList.length,
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
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor),
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
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor),
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
                      child: Text(item.cuisine!.cuisineName!)
                          .paddingSymmetric(horizontal: 10, vertical: 5),
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
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.hintText.withOpacity(0.1)),
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
            String formattedDate =
                DateFormat('yyyy-MM-dd').format(dateTime);

            return Row(
              children: [
                MFNetworkImage(
                  height: 100,
                  width: 100,
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
}
