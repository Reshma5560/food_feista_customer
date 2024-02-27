import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/index_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/box_shadow.dart';
import 'package:get/get.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final IndexController con = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => IndexedStack(
            index: con.selectedIndex.value,
            children: con.pages,
          )),
      bottomNavigationBar:
          // Theme(
          // data: ThemeData(
          //   splashColor: Colors.transparent,
          //   highlightColor: Colors.transparent,
          // ),
          // child:
          Obx(
        () => con.isLoading.value
            ? Container()
            : Container(
                height: 40.h,

                margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.w),
                // color: Colors.transparent,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  border: Border.all(color: Colors.transparent),
                  boxShadow: BoxShadows().shadow(),
                  borderRadius: BorderRadius.circular(30.0),
                ), // decoration class
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: BottomNavigationBar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle: const TextStyle(fontSize: 8
                        // color: finalPrimaryColor,
                        ),
                    selectedItemColor: Theme.of(context).primaryColor,
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          AppAssets.homeIcon,
                          height: 14.w,
                          color: con.selectedIndex.value == 0
                              ? Theme.of(context).primaryColor
                              : AppColors.black.withOpacity(0.4),
                        ),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          AppAssets.categoryIcon,
                          height: 14.w,
                          color: con.selectedIndex.value == 1
                              ? Theme.of(context).primaryColor
                              : AppColors.black.withOpacity(0.4),
                        ),
                        label: "Order",
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          AppAssets.searchIcon,
                          color: con.selectedIndex.value == 2
                              ? Theme.of(context).primaryColor
                              : AppColors.black.withOpacity(0.4),
                          height: 14.w,
                        ),
                        label: "search",
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          AppAssets.shoppingBasketIcon,
                          color: con.selectedIndex.value == 3
                              ? Theme.of(context).primaryColor
                              : AppColors.black.withOpacity(0.4),
                          height: 14.w,
                        ),
                        label: "Card",
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          AppAssets.profileIcon,
                          color: con.selectedIndex.value == 4
                              ? Theme.of(context).primaryColor
                              : AppColors.black.withOpacity(0.4),
                          height: 14.w,
                        ),
                        label: "Profile",
                      ),
                    ],
                    currentIndex: con.selectedIndex.value,
                    onTap: (value) {
                      con.changeIndex(value);
                    },
                  ),
                ),
              ).paddingSymmetric(),
        //   ),
      ),
    );
  }
}
