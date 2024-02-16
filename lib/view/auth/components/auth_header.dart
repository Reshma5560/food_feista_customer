import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../../../res/app_assets.dart';
import '../../../res/app_style.dart';
import '../../../utils/local_storage.dart';

class AuthHeader extends StatelessWidget {
  final bool? isLogin;

  const AuthHeader({super.key, this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned(
          bottom: defaultPadding + 8,
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Container(
              color: Theme.of(context).primaryColor,
              width: 100,
              height: 100,
            ),
          ),
        ),
        Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + defaultPadding.w * 2, bottom: defaultPadding.w * 2),
          margin: const EdgeInsets.only(bottom: defaultPadding * 1.5),
          child: Center(
            child: Image.asset(
              AppAssets.appLogo,
              height: 50.w,
            ),
          ),
        ),
        if (isLogin == true)
          Positioned(
            top: defaultPadding,
            right: defaultPadding,
            child: InkWell(
              onTap: () {
                if (LocalStorage.userCity.value.isEmpty) {
                  Get.toNamed(AppRoutes.locationEnableScreen);
                } else {
                  Get.offAllNamed(AppRoutes.indexScreen);
                }
              },
              child: Container(
                width: 80,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white.withOpacity(0.5),
                ),
                child: Text(
                  "SKIP",
                  style: AppStyle.customAppBarTitleStyle(),
                ),
              ),
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
