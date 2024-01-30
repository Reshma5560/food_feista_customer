import 'package:flutter/material.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:get/get.dart';

import '../../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController con = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Image.asset(
            AppAssets.appLogo,
          width: Get.width / 2,
        ),
      ),
    );
  }
}
