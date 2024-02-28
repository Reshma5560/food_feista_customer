import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:get/get.dart';

import '../../../../controller/restaurant_list_controller.dart';
import '../../../../packages/cached_network_image/cached_network_image.dart';
import '../../../../repositories/desktop_repositories.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_loader.dart';
import '../../../../res/app_style.dart';
import '../../../../res/widgets/app_bar.dart';
import '../../../../res/widgets/empty_element.dart';
import '../../../../route/app_routes.dart';

class RestaurantListScreen extends StatelessWidget {
  RestaurantListScreen({super.key});

  final RestaurantListController con = Get.put(RestaurantListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.appbarBgImage),
          Column(
            children: [
              _appHeader(context),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await DesktopRepository().getRestaurantListAPI(isInitial: true, categoryID: con.categoryId.value);
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () => con.isLoading.isFalse
                              ? con.restaurantList.isNotEmpty
                                  ? GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      controller: con.scrollController,
                                      padding: const EdgeInsets.all((defaultPadding - 6) * 2),
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: (defaultPadding - 6) * 2,
                                        crossAxisSpacing: (defaultPadding - 6) * 2,
                                        childAspectRatio: 3 / 4,
                                      ),
                                      itemCount: con.restaurantList.length,
                                      itemBuilder: (context, i) {
                                        var item = con.restaurantList[i];
                                        return InkWell(
                                          onTap: () => Get.toNamed(AppRoutes.restaurantDetailsScreen, arguments: [
                                            item.id.toString(),
                                            item.restaurantName,
                                          ]),
                                          child: Container(
                                            width: 170,
                                            margin: const EdgeInsets.only(right: defaultPadding - 6),
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFFF9EE),
                                              borderRadius: BorderRadius.circular(defaultRadius),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(defaultRadius),
                                                      ),
                                                      child: MFNetworkImage(
                                                        width: Get.width,
                                                        imageUrl: item.logo ?? "",
                                                        fit: BoxFit.fill,
                                                        borderRadius: BorderRadius.circular(defaultRadius),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.topRight,
                                                      child: Obx(
                                                        () => InkWell(
                                                          onTap: () async {
                                                            await DesktopRepository().postWishListAPIForRestaurant(
                                                              index: i,
                                                              id: item.id ?? "",
                                                              isWishList: false,
                                                            );
                                                          },
                                                          child: Icon(
                                                            item.favorite?.value == 1 ? Icons.favorite_outlined : Icons.favorite_outline_outlined,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Expanded(
                                                  child: Text(
                                                    item.restaurantName ?? "".toUpperCase(),
                                                    // textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: AppColors.black, fontSize: 11.sp, fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                const SizedBox(height: 2),
                                                Expanded(
                                                  child: Text(
                                                    item.address ?? "".toUpperCase(),
                                                    textAlign: TextAlign.left,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: AppColors.groupSubText, fontSize: 10.sp),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
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
                                                            item.ratingCount ?? "",
                                                            style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 10.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      item.distanceKm ?? "",
                                                      style: TextStyle(
                                                          color: AppColors.black.withOpacity(0.7), fontSize: 10.sp, fontWeight: FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ).paddingSymmetric(horizontal: 10, vertical: 10),
                                          ),
                                        );
                                      },
                                    )
                                  : EmptyElement(
                                      height: Get.height / 1.8,
                                      imageHeight: Get.width / 2.4,
                                      imageWidth: Get.width / 2,
                                      spacing: 0,
                                      title: "No Restaurant Found",
                                    )
                              : const AppLoader(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _appHeader(BuildContext context) {
    return MyAppBar(
        bgColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              _filterRestaurant();
            },
            icon: const Icon(
              Icons.filter_alt,
            ),
          ),
        ],
        title: "Restaurant",
        centerTitle: true,
        titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 14));
  }

  void _filterRestaurant() {
    Get.bottomSheet(
      isDismissible: false,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius * 3),
      ),
      Container(
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(defaultRadius * 3),
            topRight: Radius.circular(defaultRadius * 3),
          ),
        ),
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding).copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
                    style: AppStyle.authTitleStyle().copyWith(fontSize: 18.sp, color: Theme.of(Get.context!).primaryColor),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(color: AppColors.greyBorderColor, borderRadius: BorderRadius.circular(10.r)),
                      child: Icon(
                        Icons.close,
                        color: AppColors.white,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding - 6,
              ),
              Container(
                height: 1,
                width: Get.width,
                color: AppColors.black,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: defaultPadding - 6),
                      Text(
                        "Select Cuisine",
                        style: AppStyle.authTitleStyle().copyWith(fontSize: 14.sp, color: AppColors.black),
                      ),
                      const SizedBox(
                        height: defaultPadding - 6,
                      ),
                      Wrap(
                        children: _buildChoiceList(),
                      ),
                      const SizedBox(height: defaultPadding - 6),
                      Text(
                        "Select Veg or non-veg",
                        style: AppStyle.authTitleStyle().copyWith(fontSize: 14.sp, color: AppColors.black),
                      ),
                      const SizedBox(height: defaultPadding - 6),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (con.selectVeg.value == 0) {
                                con.selectVeg.value = 1;
                              } else {
                                con.selectVeg.value = 0;
                              }
                            },
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: con.selectVeg.value != 0 ? Theme.of(Get.context!).primaryColor : AppColors.white,
                                  border: Border.all(
                                    color: con.selectVeg.value != 0 ? Theme.of(Get.context!).primaryColor : AppColors.black.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(defaultRadius),
                                ),
                                child: Text(
                                  "Veg",
                                  style: TextStyle(
                                    fontWeight: con.selectVeg.value != 0 ? FontWeight.w500 : FontWeight.w400,
                                    color: con.selectVeg.value != 0 ? AppColors.white : null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: defaultPadding - 6),
                          InkWell(
                            onTap: () {
                              if (con.selectNonVeg.value == 0) {
                                con.selectNonVeg.value = 1;
                              } else {
                                con.selectNonVeg.value = 0;
                              }
                            },
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: con.selectNonVeg.value != 0 ? Theme.of(Get.context!).primaryColor : AppColors.white,
                                  border: Border.all(
                                    color: con.selectNonVeg.value != 0 ? Theme.of(Get.context!).primaryColor : AppColors.black.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(defaultRadius),
                                ),
                                child: Text(
                                  "Non-Veg",
                                  style: TextStyle(
                                    fontWeight: con.selectNonVeg.value != 0 ? FontWeight.w500 : FontWeight.w400,
                                    color: con.selectNonVeg.value != 0 ? AppColors.white : null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: defaultPadding - 6),
                          InkWell(
                            onTap: () {
                              con.selectPureVeg.value = !con.selectPureVeg.value;
                            },
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: con.selectPureVeg.isTrue ? Theme.of(Get.context!).primaryColor : AppColors.white,
                                  border: Border.all(
                                    color: con.selectPureVeg.isTrue ? Theme.of(Get.context!).primaryColor : AppColors.black.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(defaultRadius),
                                ),
                                child: Text(
                                  "Pure Veg",
                                  style: TextStyle(
                                    fontWeight: con.selectPureVeg.isTrue ? FontWeight.w500 : FontWeight.w400,
                                    color: con.selectPureVeg.isTrue ? AppColors.white : null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding - 6),
                      Text(
                        "If you select near by me option then you show near by your restaurant list",
                        style: AppStyle.authTitleStyle().copyWith(fontSize: 14.sp, color: AppColors.black.withOpacity(0.5)),
                      ),
                      const SizedBox(height: defaultPadding - 6),
                      InkWell(
                        onTap: () {
                          con.isNearByMe.value = !con.isNearByMe.value;
                        },
                        child: Obx(
                          () => Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: con.isNearByMe.isTrue ? Theme.of(Get.context!).primaryColor : AppColors.white,
                              border: Border.all(
                                color: con.isNearByMe.isTrue ? Theme.of(Get.context!).primaryColor : AppColors.black.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(defaultRadius),
                            ),
                            child: Text(
                              "Near by me",
                              style: TextStyle(
                                fontWeight: con.isNearByMe.isTrue ? FontWeight.w500 : FontWeight.w400,
                                color: con.isNearByMe.isTrue ? AppColors.white : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              height: 30.h,
                              onPressed: () async {
                                Get.back();
                                await DesktopRepository().getRestaurantListAPI(isInitial: true, categoryID: con.categoryId.value);
                              },
                              title: "Apply Filter",
                            ),
                          ),
                          const SizedBox(width: defaultPadding),
                          Expanded(
                            child: AppButton(
                              height: 30.h,
                              onPressed: () async {
                                Get.back();
                                con.selectVeg.value = 0;
                                con.selectNonVeg.value = 0;
                                con.selectPureVeg.value = false;
                                con.isNearByMe.value = false;
                                con.selectedChoice.clear();
                                await DesktopRepository().getRestaurantListAPI(isInitial: true, categoryID: con.categoryId.value);
                              },
                              buttonType: ButtonType.outline,
                              title: "Clear Filter",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding),
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

  _buildChoiceList() {
    List<Widget> choices = <Widget>[];
    for (var item in con.getCuisineListData) {
      choices.add(
        Container(
          margin: const EdgeInsets.only(right: defaultPadding - 6),
          padding: const EdgeInsets.all(2.0),
          child: Obx(
            () => ChoiceChip(
              selectedColor: Theme.of(Get.context!).primaryColor,
              label: Text(
                item.cuisineName ?? "",
                style: TextStyle(
                  fontWeight: con.selectedChoice.contains(item.id) ? FontWeight.w500 : FontWeight.w400,
                  color: con.selectedChoice.contains(item.id) ? AppColors.white : null,
                ),
              ),
              checkmarkColor: AppColors.white,
              selected: con.selectedChoice.contains(item.id),
              onSelected: (selected) {
                if (con.selectedChoice.contains(item.id)) {
                  con.selectedChoice.remove(item.id);

                  printYellow("--- remove ${con.selectedChoice}");
                } else {
                  con.selectedChoice.add(item.id ?? "");
                  printYellow("--- added ${con.selectedChoice}");
                }
              },
            ),
          ),
        ),
      );
    }
    return choices;
  }
}
