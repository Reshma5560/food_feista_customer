import 'package:flutter/material.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/widgets/empty_element.dart';
import 'package:get/get.dart';

import '../../../../controller/category_list_controller.dart';
import '../../../../packages/cached_network_image/cached_network_image.dart';
import '../../../../repositories/desktop_repositories.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/widgets/app_bar.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});

  final CategoryListController con = Get.put(CategoryListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appHeader(context),
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
                                    childAspectRatio: 2 / 3,
                                  ),
                                  itemCount: con.categoryList.length,
                                  itemBuilder: (context, index) {
                                    var item = con.categoryList[index];
                                    return Container(
                                      height: 200,
                                      margin: const EdgeInsets.only(right: defaultPadding - 6),
                                      decoration: BoxDecoration(
                                        color: AppColors.greyShad1,
                                        borderRadius: BorderRadius.circular(defaultRadius),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: MFNetworkImage(
                                              imageUrl: item.image ?? "",
                                              fit: BoxFit.cover,
                                              borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(defaultRadius),
                                                topRight: Radius.circular(defaultRadius),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: defaultPadding - 10,
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
          title: "Category",
          centerTitle: true,
          titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 14)),
    );
  }
}
