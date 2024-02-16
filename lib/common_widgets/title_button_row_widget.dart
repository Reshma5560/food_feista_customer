import 'package:flutter/material.dart';
import 'package:foodapplication/res/app_colors.dart';

import '../res/app_style.dart';

class TitleButtonRowWidget extends StatelessWidget {
  final String? title;
  final String? buttonText;
  final void Function()? onPressed;

  const TitleButtonRowWidget({super.key, this.title, this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText ?? "",
              style: TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}
