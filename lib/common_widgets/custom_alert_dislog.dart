// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomLogoutAlertDialog extends StatelessWidget {
  String text;
  String content;
  String yesButtonText;
  String noButtonText;
  Function() onYesPressed;
  Function() onNoPressed;
  Color bgColor;
  // Color? activeColor;
  EdgeInsetsGeometry? titlePadding;
  EdgeInsetsGeometry? contentPadding;

  CustomLogoutAlertDialog({
    Key? key,
    required this.text,
    required this.content,
    required this.onYesPressed,
    required this.onNoPressed,
    required this.yesButtonText,
    required this.noButtonText,
    required this.bgColor,
    this.titlePadding,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      titlePadding: titlePadding,
      title: Text(
        text,
        // style: TextStyleConfig.textStyle(
        //   // fontFamily: FontFamilyText.sFProDisplayRegular,
        //   textColor: AppColors.blackColor,
        //   fontSize: 14.sp,
        //   fontWeight: FontWeight.bold,
        // ),
      ),
      contentPadding: contentPadding,
      content: Text(
        content,
        // style: TextStyleConfig.textStyle(
        //   // fontFamily: FontFamilyText.sFProDisplayRegular,
        //   textColor: AppColors.blackColor,
        //   fontSize: 12.sp,
        //   fontWeight: FontWeight.bold,
        // ),
      ),
      actions: [
        // const Divider(thickness: 1),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onYesPressed,
                child: Text(yesButtonText),
              ),
              //  CustomRoundedButton(
              //   text: yesButtonText,
              //   onTap: onYesPressed,
              //   fontWeight: FontWeight.bold,
              //   textsize: 13.sp,
              //   textColor: AppColors.whiteColor,
              //   backgroundColor: bgColor,
              // ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: ElevatedButton(
                onPressed: onNoPressed,
                child: Text(noButtonText),
              ),
              // CustomRoundedButton(
              //   text: noButtonText,
              //   onTap: onNoPressed,
              //   fontWeight: FontWeight.bold,
              //   textsize: 13.sp,
              //   textColor: AppColors.whiteColor,
              //   backgroundColor: bgColor,
              // ),
            ),
          ],
        ),
      ],
    );
  }
}
