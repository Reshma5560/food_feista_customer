import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:get/get.dart';

import '../../../controller/auth/cms_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  final CmsController con = Get.find<CmsController>();

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
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.appbarBgImage,
                  fit: BoxFit.fill,
                  width: Get.width,
                  height: Get.height,
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 16.sp,
                          // color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Text(
                        "Privacy Policy",
                        style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                      ),
                      const Text("Aboutus", style: TextStyle(color: Colors.transparent)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.12),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const RangeMaintainingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Html(
                          data: con.privacyPolicyData.value.body,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
