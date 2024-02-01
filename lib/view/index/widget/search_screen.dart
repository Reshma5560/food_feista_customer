import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../account/components/wish_list_simmer_tile.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchScreenController con = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appHeader(context),
          const SizedBox(
            height: defaultPadding - 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding - 6),
            child: AppTextField(
              controller: con.searchCon.value,
              fillColor: AppColors.greyShad1,
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, color: AppColors.hintColor),
              prefixIcon: Icon(Icons.search, color: AppColors.hintColor),
              onChanged: (value) {
                Future.delayed(const Duration(seconds: 1)).then(
                  (value) async {
                    await DesktopRepository().getSearchItemAPI();
                  },
                );
              },
            ),
          ),
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
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(defaultRadius),
                                boxShadow: AppStyle.boxShadow(),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: MFNetworkImage(
                                      imageUrl: con.searchItemData[index].logo ?? "",
                                      fit: BoxFit.fill,
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
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppStyle.regularBlack().copyWith(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            con.searchItemData[index].phone ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.regularBlack().copyWith(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            con.searchItemData[index].email ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.regularBlack().copyWith(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            con.searchItemData[index].address ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.regularBlack().copyWith(
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
