import 'package:flutter/material.dart';
import 'package:foodapplication/view/account/account_screen.dart';
import 'package:foodapplication/view/index/widget/cart_screen.dart';
import 'package:foodapplication/view/index/widget/home_screen.dart';
import 'package:foodapplication/view/index/widget/order/my_order_screen.dart';
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
    const SearchScreen(),
    CartScreen(),
    AccountScreen()
  ];

}
