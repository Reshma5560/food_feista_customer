import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/app_assets.dart';
import '../../../res/app_style.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

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
      ],
    );
  }
}
