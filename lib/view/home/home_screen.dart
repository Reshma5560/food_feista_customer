import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/common_widgets/title_button_row_widget.dart';
import 'package:foodapplication/controller/home_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:foodapplication/res/app_theme.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());
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
            child: Column(
              children: [
                _appHeader(context),
                const SizedBox(
                  height: 10,
                ),
                _bodyModule()
              ],
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
          leading: Image.asset(
            AppAssets.menuIcon,
            height: 10.h,
            width: 10.w,
          ).paddingOnly(left: 15),
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
              const SizedBox(
                width: 10,
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
          controller: homeController.searchCon,
          fillColor: AppColors.greyShad1,
          hintText: "search",
          hintStyle: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.hintColor),
          prefixIcon: Icon(Icons.search, color: AppColors.hintColor),
        ),
        const SizedBox(
          height: 10,
        ),
        _sliderModule(),
        const SizedBox(
          height: 10,
        ),
        TitleButtonRowWidget(
          title: "Categories",
          buttonText: "View All",
          onPressed: () {},
        ).paddingSymmetric(horizontal: 5),
        const SizedBox(
          height: 10,
        ),
        _categoryModule(),
        const SizedBox(
          height: 20,
        ),
        _sellingTypeListModule(),
        const SizedBox(
          height: 10,
        ),
        _foodListByCategoryModule(),
        const SizedBox(
          height: 10,
        ),
        AppButton(
          height: 35,
          onPressed: () {},
          title: "View All Popular Product",
          titleStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ).paddingSymmetric(horizontal: 90),
        _popularProductModule()
      ],
    ).paddingSymmetric(horizontal: 10));
  }

  Widget _sliderModule() {
    return Container();
  }

  Widget _categoryModule() {
    return SizedBox(
      height: Get.height / 6,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: homeController.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = homeController.categoryList[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.greyShad1,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Image.asset(
                  item.imagePath ?? "",
                  height: 90,
                  width: 90,
                ),
                Text(
                  item.title ?? "",
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

  Widget _sellingTypeListModule() {
    return SizedBox(
      height: 33,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: homeController.sellingTypeList.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx(() => InkWell(
                onTap: () {
                  homeController.selectSellType.value = index;
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  decoration: BoxDecoration(
                      color: homeController.selectSellType.value == index
                          ? Theme.of(context).primaryColor
                          : AppColors.white,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      homeController.sellingTypeList[index],
                      style: TextStyle(
                          fontSize: 11,
                          color: homeController.selectSellType.value == index
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

  Widget _foodListByCategoryModule() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: homeController.foodList.length,
      itemBuilder: (BuildContext context, int index) {
        var item = homeController.foodList[index];
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
              )),
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

  Widget _popularProductModule() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: homeController.popularProductList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          var item = homeController.popularProductList[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              children: [
                Image.asset(
                  item.imagePath ?? "",
                  height: 140,
                  width: 140,
                ),
                Positioned(
                    left: 10,
                    top: 35,
                    child: Text(
                      item.title ?? "",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
