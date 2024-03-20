import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:get/get.dart';

import '../../../controller/search_screen_controller.dart';
import '../../../packages/cached_network_image/cached_network_image.dart';
import '../../../repositories/desktop_repositories.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_strings.dart';
import '../../../res/app_style.dart';
import '../../../res/app_text_field.dart';
import '../../../res/widgets/app_bar.dart';
import '../../../res/widgets/empty_element.dart';
import '../../../route/app_routes.dart';
import '../../account/components/wish_list_simmer_tile.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchScreenController con = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.appbarBgImage,
            width: Get.width,
            fit: BoxFit.fill,
            height: Get.height,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding - 6).copyWith(top: Get.height * 0.06, bottom: Get.height * 0.04),
            child: AppTextField(
              controller: con.searchCon.value,
              fillColor: AppColors.white,
              hintText: "Search Your Favorite",
              hintStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, color: AppColors.hintColor),
              suffixIcon: Obx(
                () => con.searchText.value.isNotEmpty
                    ? IconButton(
                        onPressed: () async {
                          con.searchCon.value.clear();
                          con.searchText.value = "";
                          await DesktopRepository().getSearchItemAPI();
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              onChanged: (value) {
                con.searchCon.value.text = value;
                con.searchText.value = value;
                Future.delayed(const Duration(seconds: 1)).then(
                  (value) async {
                    await DesktopRepository().getSearchItemAPI();
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: defaultPadding - 6,
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.12),
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => con.isLoading.isFalse
                        ? con.searchItemData.isEmpty
                            ? EmptyElement(
                                height: Get.height / 1.9,
                                imageHeight: Get.width / 2.4,
                                imageWidth: Get.width / 2,
                                spacing: 0,
                                title: AppStrings.searchNotFoundTitle,
                                subtitle: AppStrings.searchListNotFoundSubtitle,
                              )
                            : ListView.separated(
                                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: defaultPadding,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      Get.toNamed(AppRoutes.restaurantDetailsScreen, arguments: [
                                        con.searchItemData[index].id.toString(),
                                        con.searchItemData[index].restaurantName,
                                      ]);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                      // decoration: BoxDecoration(
                                      //   color: AppColors.white,
                                      //   borderRadius:
                                      //       BorderRadius.circular(defaultRadius),
                                      //   boxShadow: AppStyle.boxShadow(),
                                      // ),
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),

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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: MFNetworkImage(
                                              imageUrl: con.searchItemData[index].logo ?? "",
                                              // height: 70,
                                              // width: 70,
                                              fit: BoxFit.cover,
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
                                                          con.searchItemData[index].restaurantName ?? "",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w600, fontSize: 14.sp, color: Theme.of(context).primaryColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    con.searchItemData[index].phone ?? "",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp, color: AppColors.black),
                                                  ),
                                                  Text(
                                                    con.searchItemData[index].email ?? "",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp, color: AppColors.black),
                                                  ),
                                                  Text(
                                                    con.searchItemData[index].address ?? "",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp, color: AppColors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 50.h,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: con.searchItemData.length,
                              )
                        : ListView.builder(
                            padding: const EdgeInsets.all(defaultPadding).copyWith(bottom: MediaQuery.of(context).padding.bottom),
                            shrinkWrap: true,
                            itemCount: 8,
                            itemBuilder: (BuildContext context, index) => const WishListSimmerTile(),
                          ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
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
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
        title: "Search",
        centerTitle: true,
        titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: Colors.black),
      ),
    );
  }
}
