import 'package:flutter/material.dart';
import 'package:foodapplication/controller/account/components/contact_us_controller.dart';
import 'package:get/get.dart';

import '../../../res/app_appbar.dart';
import '../../../res/app_assets.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_style.dart';
import '../../../res/widgets/app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final ContactUsController con = Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonAppBar(
            title: "Contact Us",
            onPressed: () {},
          ),
          Expanded(
            child: ListView(
              physics: const RangeMaintainingScrollPhysics(),
              children: [
                Center(
                  child: Image.asset(
                    AppAssets.appLogo,
                    width: Get.width / 2,
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
