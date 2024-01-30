import 'package:flutter/material.dart';
import 'package:foodapplication/view/account/account_screen.dart';
import 'package:foodapplication/view/index/widget/cart_screen.dart';
import 'package:foodapplication/view/index/widget/home_screen.dart';
import 'package:foodapplication/view/index/widget/my_order_screen.dart';
import 'package:foodapplication/view/index/widget/search_screen.dart';
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
    AccountScreen()
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
