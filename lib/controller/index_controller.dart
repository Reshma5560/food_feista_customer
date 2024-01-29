import 'package:flutter/material.dart';
import 'package:foodapplication/controller/cart_controller.dart';
import 'package:foodapplication/view/cart/cart_screen.dart';
import 'package:foodapplication/view/category/category_screen.dart';
import 'package:foodapplication/view/home/home_screen.dart';
import 'package:foodapplication/view/my%20order/my_order_screen.dart';
import 'package:foodapplication/view/profile/profile_screen.dart';
import 'package:foodapplication/view/search/search_screen.dart';
import 'package:get/get.dart';

class IndexController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt selectedIndex = 0.obs;

  void changeIndex(int index) async {
    selectedIndex.value = index;
    if (index == 0) {
    } else if (index == 1) {
    } else if (index == 2) {}
  }

  final pages = <Widget>[
    HomeScreen(),
    // CategoryScreen(),
    MyOrderScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
