import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/widgets/empty_element.dart';
import 'package:get/get.dart';

import '../../../controller/account/components/wish_list_controller.dart';
import '../../../packages/cached_network_image/cached_network_image.dart';
import '../../../res/app_strings.dart';
import '../../../res/app_style.dart';
import '../components/wish_list_simmer_tile.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  final WishListController con = Get.put(WishListController());

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
            child: Stack(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 16.sp,
                          // color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Text(
                        "Wishlist",
                        style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                      ),
                      const Text("wishlist", style: TextStyle(color: Colors.transparent)),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.12),
                    child: Obx(
                      () => con.isLoading.isFalse
                          ? con.wishListData.isEmpty
                              ? EmptyElement(
                                  height: Get.height / 1.8,
                                  imageHeight: Get.width / 2.4,
                                  imageWidth: Get.width / 2,
                                  spacing: 0,
                                  title: AppStrings.wishListNotFoundTitle,
                                  subtitle: AppStrings.wishListNotFoundSubtitle,
                                )
                              : ListView.separated(
                                  controller: con.scrollController,
                                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: defaultPadding,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.background,
                                        // gradient: LinearGradient(
                                        //     begin: Alignment.bottomRight,
                                        //     end: Alignment.topRight,
                                        //     colors: [
                                        //       AppColors.white,
                                        //       Theme.of(context)
                                        //           .colorScheme
                                        //           .background
                                        //     ]),
                                        borderRadius: BorderRadius.circular(22.r),
                                        boxShadow: AppStyle.boxShadow(),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(25.r),
                                              child: MFNetworkImage(
                                                imageUrl: con.wishListData[index].logo ?? "",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: defaultPadding - 10).copyWith(left: defaultPadding - 6),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          con.wishListData[index].restaurantName ?? "",
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: AppStyle.regularBlack().copyWith(
                                                            fontSize: 13.sp,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(right: defaultPadding - 6),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            await DesktopRepository().postWishListAPI(
                                                                id: con.wishListData[index].id ?? "", index: index, isWishList: true);
                                                          },
                                                          child: const Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    con.wishListData[index].phone ?? "",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppStyle.regularBlack().copyWith(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    con.wishListData[index].email ?? "",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppStyle.regularBlack().copyWith(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    con.wishListData[index].address ?? "",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppStyle.regularBlack().copyWith(
                                                      fontSize: 11.sp,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: con.wishListData.length,
                                )
                          : ListView.builder(
                              padding: const EdgeInsets.all(defaultPadding).copyWith(bottom: MediaQuery.of(context).padding.bottom),
                              shrinkWrap: true,
                              itemCount: 8,
                              itemBuilder: (BuildContext context, index) => const WishListSimmerTile(),
                            ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
