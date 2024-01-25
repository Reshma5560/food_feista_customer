import 'package:flutter/material.dart';
import 'package:foodapplication/res/widgets/app_bar.dart';

import 'app_colors.dart';
import 'app_style.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const CommonAppBar({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(defaultRadius * 3),
        bottomRight: Radius.circular(defaultRadius * 3),
      ),
      child: MyAppBar(
        bgColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: onPressed,
        ),
        title: title,
        centerTitle: true,
        titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black),
      ),
    );
  }
}
