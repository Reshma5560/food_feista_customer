import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/account/components/wish_list_controller.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  final WishListController con = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
