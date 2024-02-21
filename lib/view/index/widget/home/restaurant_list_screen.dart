import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Column(
        children: [
          _appHeader(context),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await DesktopRepository().getRestaurantListAPI(isInitial: true);
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
                                    childAspectRatio: 3 / 5,
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
                                        // width: 180,
                                        // margin: const EdgeInsets.only(right: defaultPadding - 6),
                                        decoration: BoxDecoration(
                                          color: AppColors.greyShad1,
                                          borderRadius: BorderRadius.circular(defaultRadius),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    item.restaurantName ?? "".toUpperCase(),
                                                    // textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: AppColors.red, fontSize: 12.sp, fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                Obx(
                                                  () => InkWell(
                                                    onTap: () async {
                                                      await DesktopRepository().postWishListAPI(index: i, id: item.id ?? "", isWishList: false);
                                                    },
                                                    child: Icon(
                                                      item.favorite?.value == 1 ? Icons.favorite_outlined : Icons.favorite_outline_outlined,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              item.address ?? "".toUpperCase(),
                                              textAlign: TextAlign.left,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(color: AppColors.groupSubText, fontSize: 12.sp),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  item.distanceKm ?? "",
                                                  style: TextStyle(
                                                      color: AppColors.black.withOpacity(0.7), fontSize: 13.sp, fontWeight: FontWeight.w500),
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
                                                        item.ratingCount ?? "",
                                                        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 12.sp),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Expanded(
                                              flex: 1,
                                              child: MFNetworkImage(
                                                width: Get.width,
                                                imageUrl: item.logo ?? "",
                                                fit: BoxFit.fill,
                                                borderRadius: BorderRadius.circular(defaultRadius),
                                              ),
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
          title: "Restaurant",
          centerTitle: true,
          titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 14)),
    );
  }
}
