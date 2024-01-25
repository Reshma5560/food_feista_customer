import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app_colors.dart';

const double defaultPadding = 20.0;
const double defaultRadius = 6.0;

class AppStyle {
  //* Regular ///
  static TextStyle regularPrimary() => TextStyle(
        fontSize: 14.sp,
        color: AppColors.kPrimaryColor,
        fontWeight: FontWeight.w400,
      );

  static TextStyle regularWhite() => TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      );

  static TextStyle mediumWhite() => TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      );

  static TextStyle regularBlack() => TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      );

  //* AUTH_FLOW ///
  // static String fontFamilyName = 'Lexend';
  // static String fontFamilyName = 'Assistant';
  // static String fontFamilyName = 'Hind Madurai';
  // static String fontFamilyName = 'Lato';
  static String fontFamilyName = 'Montserrat';

  static TextStyle authTitleStyle() => TextStyle(
        color: Theme.of(Get.context!).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      );

  static TextStyle authSubtitleStyle() => TextStyle(
        fontSize: 14.sp,
      );

  static TextStyle authFooterStyle() => TextStyle(
        fontSize: 12.sp,
      );

  ///GLOBAL///
  static TextStyle textFieldTitleStyle() => TextStyle(
        fontSize: 13.5.sp,
        color: Theme.of(Get.context!).primaryColor,
      );

  static TextStyle errorTextStyle() => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
        color: Theme.of(Get.context!).colorScheme.error,
      );

  static TextStyle buttonTitleStyle() => TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );

  static TextStyle customAppBarTitleStyle() => TextStyle(
        fontSize: 20.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  static boxShadow({double? blurRadius, double? spreadRadius, Color? color, Offset? offset}) => [
        BoxShadow(
          color: color ?? AppColors.blackColor.withOpacity(0.2),
          spreadRadius: spreadRadius ?? 1,
          blurRadius: blurRadius ?? 4,
          offset: offset ?? const Offset(0, 3),
        ),
      ];
  static Widget simmerContainer({double? height, double? width, double? borderRadius, Widget? child, Decoration? decoration}) => Container(
        height: height,
        width: width,
        decoration: decoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 50),
              color: AppColors.kPrimaryColor.withOpacity(0.1),
            ),
      );
}
