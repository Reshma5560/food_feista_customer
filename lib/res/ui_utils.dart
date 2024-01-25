import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodapplication/res/widgets/icon_button.dart';
import 'package:get/get.dart';

import '../controller/base_controller.dart';
import '../route/app_routes.dart';
import 'app_assets.dart';
import 'app_colors.dart';


Future toast(message) async {
  FToast fToast = FToast();
  fToast.removeQueuedCustomToasts();
  fToast.removeCustomToast();
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    fontSize: 16.0,
  );
}

class UiUtils {
  static Container scrollGradient(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  static Widget notificationButton({bool? showCount = false}) {
    final BaseController baseCon = Get.find<BaseController>();
    return Stack(
      children: [
        MFIconButton(
          onTap: () => Get.toNamed(AppRoutes.notificationScreen),
          // ignore: deprecated_member_use
          icon: SvgPicture.asset(AppAssets.notificationsIcon, color: AppColors.white),
        ),
        Positioned(
          right: showCount == true ? 3.5 : 5,
          top: showCount == true ? 1 : 4,
          child: Obx(
            () => AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: baseCon.notificationCount.value > 0 ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.notificationScreen),
                child: CircleAvatar(
                  radius: showCount == true ? 6 : 4,
                  child: showCount == true
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              baseCon.notificationCount.value < 99 ? "${baseCon.notificationCount.value}" : "99",
                              style: const TextStyle(fontSize: 8.7),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
