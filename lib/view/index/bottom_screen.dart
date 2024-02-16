import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/index_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:get/get.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final IndexController con = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: con.selectedIndex.value,
            children: con.pages,
          )),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Obx(
          () => con.isLoading.value
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(color: Colors.transparent),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0.0, 1.0), //(x,y)
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                  ), // decoration class
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      type: BottomNavigationBarType.fixed,
                      selectedLabelStyle: const TextStyle(
                        fontSize: 10,
                        // color: finalPrimaryColor,
                      ),
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            AppAssets.homeIcon,
                            height: 18.w,
                            color: con.selectedIndex.value == 0 ? Theme.of(context).primaryColor : AppColors.black.withOpacity(0.4),
                          ),
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            AppAssets.categoryIcon,
                            height: 18.w,
                            color: con.selectedIndex.value == 1 ? Theme.of(context).primaryColor : AppColors.black.withOpacity(0.4),
                          ),
                          label: "Category",
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            AppAssets.searchIcon,
                            color: con.selectedIndex.value == 2 ? Theme.of(context).primaryColor : AppColors.black.withOpacity(0.4),
                            height: 18.w,
                          ),
                          label: "search",
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            AppAssets.shoppingBasketIcon,
                            color: con.selectedIndex.value == 3 ? Theme.of(context).primaryColor : AppColors.black.withOpacity(0.4),
                            height: 18.w,
                          ),
                          label: "shopping basket",
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            AppAssets.profileIcon,
                            color: con.selectedIndex.value == 4 ? Theme.of(context).primaryColor : AppColors.black.withOpacity(0.4),
                            height: 18.w,
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
        ),
      ),
    );
  }
}
