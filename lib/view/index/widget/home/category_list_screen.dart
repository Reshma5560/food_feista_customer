import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/widgets/empty_element.dart';
import 'package:get/get.dart';

import '../../../../controller/category_list_controller.dart';
import '../../../../packages/cached_network_image/cached_network_image.dart';
import '../../../../repositories/desktop_repositories.dart';
import '../../../../res/app_colors.dart';
import '../../../../route/app_routes.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});

  final CategoryListController con = Get.put(CategoryListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(AppAssets.appbarBgImage, fit: BoxFit.fill, width: Get.width),
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
                  "Category",
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
                // _appHeader(context),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await DesktopRepository().getCategoryListAPI(isInitial: true);
                    },
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      child: Column(
                        children: [
                          Obx(
                            () => con.isLoading.isFalse
                                ? con.categoryList.isNotEmpty
                                    ? GridView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        controller: con.scrollController,
                                        padding: const EdgeInsets.all((defaultPadding - 6) * 2),
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: defaultPadding - 6,
                                          crossAxisSpacing: defaultPadding - 6,
                                          childAspectRatio: 2 / 2.3,
                                        ),
                                        itemCount: con.categoryList.length,
                                        itemBuilder: (context, index) {
                                          var item = con.categoryList[index];
                                          return InkWell(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              Get.toNamed(AppRoutes.restaurantListScreen, arguments: {"category_id": item.id});
                                            },
                                            child: Container(
                                              // height: 100,
                                              margin: const EdgeInsets.only(right: defaultPadding - 6),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context).colorScheme.background,
                                                borderRadius: BorderRadius.circular(defaultRadius),
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  MFNetworkImage(
                                                    imageUrl: item.image ?? "",
                                                    fit: BoxFit.cover,
                                                    height: 60.h,
                                                    width: 65.w,
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(50.r),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    item.categoryName ?? "",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
                                                  ),
                                                  const SizedBox(
                                                    height: defaultPadding - 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : EmptyElement(
                                        height: Get.height / 1.8,
                                        imageHeight: Get.width / 2.4,
                                        imageWidth: Get.width / 2,
                                        spacing: 0,
                                        title: "No Category Found",
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
          ),
        ],
      ),
    );
  }
}
