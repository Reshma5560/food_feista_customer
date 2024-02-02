import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/common_widgets/title_button_row_widget.dart';
import 'package:foodapplication/controller/home_controller.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../../../data/models/home_data_model.dart';
import '../../../packages/cached_network_image/cached_network_image.dart';
import '../../../res/app_loader.dart';
import '../../../res/box_shadow.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController con = Get.put(HomeController());

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
            child: Obx(
              () => con.isLoading.isTrue
                  ? const AppLoader()
                  : Column(
                      children: [
                        _appHeader(context),
                        const SizedBox(height: 10),
                        _bodyModule(),
                      ],
                    ).paddingOnly(bottom: 20),
            ),
          );
        },
      ),
    );
  }

  Widget _appHeader(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(defaultRadius * 3),
          bottomRight: Radius.circular(defaultRadius * 3),
        ),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          leading: InkWell(
            onTap: () {},
            child: Image.asset(
              AppAssets.menuIcon,
              height: 10.h,
              width: 10.w,
            ).paddingOnly(left: 15),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  AppAssets.profileIcon,
                  height: 16.h,
                  width: 16.w,
                  color: AppColors.white,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "abc",
                  style: AppStyle.customAppBarTitleStyle()
                      .copyWith(color: AppColors.black, fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "abc",
                  style: AppStyle.customAppBarTitleStyle()
                      .copyWith(color: AppColors.black, fontSize: 18),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(Icons.keyboard_arrow_down)
            ],
          ),
          actions: [
            Image.asset(
              AppAssets.scanningIcon,
              height: 20.h,
              width: 20.w,
            ).paddingOnly(right: 15)
          ],
        ));
  }

  Widget _bodyModule() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AppTextField(
            controller: con.searchCon,
            fillColor: AppColors.greyShad1,
            hintText: "search",
            hintStyle: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.hintColor),
            prefixIcon: Icon(Icons.search, color: AppColors.hintColor),
          ),
          const SizedBox(height: 10),
          _sliderModule(),
          const SizedBox(height: 10),
          con.categoryList.isEmpty
              ? Container()
              : TitleButtonRowWidget(
                  title: "BROWSE FOOD CATEGORY",
                  buttonText: "View All",
                  onPressed: () {},
                ).paddingSymmetric(horizontal: 5),
          con.categoryList.isEmpty ? Container() : const SizedBox(height: 10),
          con.categoryList.isEmpty ? Container() : _categoryModule(),
          const SizedBox(height: 20),
          con.restaurantList.isEmpty
              ? Container()
              : TitleButtonRowWidget(
                  title: "OUR SPECIAL RESTAURANT",
                  buttonText: "View All",
                  onPressed: () {},
                ).paddingSymmetric(horizontal: 5),
          con.restaurantList.isEmpty ? Container() : _restaurantModule(),
          const SizedBox(height: 20),
          con.blogList.isEmpty
              ? Container()
              : TitleButtonRowWidget(
                  title: "LATEST NEWS",
                  buttonText: "View All",
                  onPressed: () {},
                ).paddingSymmetric(horizontal: 5),
          con.blogList.isEmpty ? Container() : const SizedBox(height: 20),
          con.blogList.isEmpty ? Container() : _blogModule(),
          con.trendingFoodList.isEmpty
              ? Container()
              : TitleButtonRowWidget(
                  title: "trending Foods".toUpperCase(),
                  buttonText: "View All",
                  onPressed: () {},
                ).paddingSymmetric(horizontal: 5),
          const SizedBox(height: 10),
          con.trendingFoodList.isEmpty ? Container() : _trendingFoodsModule()
        ],
      ).paddingSymmetric(horizontal: 10),
    );
  }

  Widget _sliderModule() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: con.bannerList.length,
          itemBuilder: (context, i, realIndex) {
            return Stack(
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: con.bannerList[i].image ?? "",
                    width: Get.width,
                    fit: BoxFit.cover,
                    height: Get.height * 0.25,
                    errorWidget: (context, str, obj) {
                      return Image.asset(
                        AppAssets.appLogo,
                        height: Get.height * 0.25,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              height: Get.height * 0.25,
              onPageChanged: (index, reason) {
                con.activeSliderIndex.value = index;
              }
              // aspectRatio: 2.5,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: con.bannerList.map((url) {
            int index = con.bannerList.indexOf(url);
            return Obx(
              () => con.activeSliderIndex.value == index
                  ? Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // border: Border.all(color: AppColors.red),
                        color: AppColors.red,
                      ),
                    )
                  : Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey,
                      ),
                    ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _categoryModule() {
    return SizedBox(
      height: Get.height / 6,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: con.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = con.categoryList[index];
          return Container(
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.greyShad1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Image.network(
                  item.image ?? "",
                  height: 90,
                ),
                Text(
                  item.categoryName ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 13),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _restaurantModule() {
    return Obx(
      () => SizedBox(
        height: 210,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: con.restaurantList.length,
          itemBuilder: (context, i) {
            Restaurant item = con.restaurantList[i];
            return InkWell(
              onTap: () =>
                  Get.toNamed(AppRoutes.restaurantDetailsScreen, arguments: [
                item.id.toString(),
                item.restaurantName,
              ]),
              child: Container(
                width: 150,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: AppColors.greyShad1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item.restaurantName ?? "".toUpperCase(),
                            // textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: AppColors.red, fontSize: 12),
                          ),
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () async {
                              await DesktopRepository().postWishListAPI(
                                  index: i,
                                  id: item.id ?? "",
                                  isWishList: false);
                            },
                            child: Icon(
                              item.favorite?.value == 1
                                  ? Icons.favorite_outlined
                                  : Icons.favorite_outline_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.address ?? "".toUpperCase(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.groupSubText, fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    CachedNetworkImage(
                      imageUrl: item.logo ?? "",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorWidget: (context, str, obj) {
                        return Image.asset(
                          AppAssets.appLogo,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10, vertical: 10),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget sellingTypeListModule() {
    return SizedBox(
      height: 33,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: con.sellingTypeList.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx(() => InkWell(
                onTap: () {
                  con.selectSellType.value = index;
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  decoration: BoxDecoration(
                      color: con.selectSellType.value == index
                          ? Theme.of(context).primaryColor
                          : AppColors.white,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      con.sellingTypeList[index],
                      style: TextStyle(
                          fontSize: 11,
                          color: con.selectSellType.value == index
                              ? AppColors.white
                              : Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget foodListByCategoryModule() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: con.foodList.length,
      itemBuilder: (BuildContext context, int index) {
        var item = con.foodList[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: AppColors.greyShad1,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.imagePath ?? "",
                height: 60,
                width: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      item.descripton ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColors.black),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "\$${item.price?.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: AppColors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Type - ${item.type?.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 8.5,
                                color: AppColors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Qty - ${item.qty?.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 8.5,
                                color: AppColors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _blogModule() {
    return SizedBox(
      height: 140,
      width: 250,
      child: ListView.builder(
        itemCount: con.blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          Blog item = con.blogList[i];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MFNetworkImage(
                height: 100,
                width: 250,
                backgroundColor: Colors.grey,
                imageUrl: item.image ?? "",
                fit: BoxFit.cover,
                shape: BoxShape.rectangle,
              ).paddingOnly(bottom: 5),
              Text(
                item.blogName ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ).paddingOnly(left: 15);
        },
      ),
    );
  }

  Widget _trendingFoodsModule() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: con.trendingFoodList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 30,
        childAspectRatio: 0.80,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        TrendingFood item = con.trendingFoodList[i];
        return Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: BoxShadows().shadow(),
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Column(
                children: [
                  // Image module
                  Expanded(
                    flex: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: item.image ?? "",
                        width: Get.width,
                        fit: BoxFit.cover,
                        errorWidget: (context, str, obj) {
                          return Image.asset(
                            AppAssets.appLogo,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  // Text Module - title & content
                  Expanded(
                    flex: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(item.foodName ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )).paddingOnly(bottom: 5),
                        RatingBar.builder(
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 18,
                          initialRating: double.parse(item.ratingCount!),
                          itemBuilder: (context, _) => Icon(
                            Icons.star_rounded,
                            color: AppColors.red,
                          ),
                          ignoreGestures: true,
                          onRatingUpdate: (double value) {},
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 5),
                  ),
                ],
              ),

              // Coupon code show
              Container(
                decoration: BoxDecoration(
                    color: Colors.red.shade900,
                    boxShadow: BoxShadows().shadow(),
                    shape: BoxShape.circle
                    // borderRadius: BorderRadius.circular(25),
                    ),
                child: Text(
                  "${item.discount!}${item.discountType == "percent" ? "%" : "₹"}\nOFF",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ).paddingAll(10),
              ).paddingOnly(top: 10),
            ],
          ).paddingAll(10),
        );
      },
    );
  }
}
