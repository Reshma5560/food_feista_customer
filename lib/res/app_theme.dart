import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_style.dart';

class AppTheme {
  static ThemeData lightMode() {
    const ColorScheme colorSchemeLight = ColorScheme.light();
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      // useMaterial3: false,
      primaryColor: AppColors.kPrimaryColor,
      visualDensity: VisualDensity.comfortable,
      scaffoldBackgroundColor: const Color(0xFFF9FCFF),
      appBarTheme: AppBarTheme(color: AppColors.kPrimaryColor),
      popupMenuTheme: const PopupMenuThemeData(color: Color(0xFFFFFFFF)),
      iconTheme: const IconThemeData(color: Color(0xff2b2b2b)),
      shadowColor: const Color(0xFFdedcdc),
      indicatorColor: AppColors.kPrimaryColor,
      splashColor: AppColors.kPrimaryColor.withOpacity(0.2),
      hoverColor: AppColors.kPrimaryColor.withOpacity(0.1),
      splashFactory: InkRipple.splashFactory,
      canvasColor: const Color(0xFFFFFFFF),
      disabledColor: const Color(0xFFD3D9DD),
      textTheme: buildTextTheme(base.textTheme),
      primaryTextTheme: buildTextTheme(base.primaryTextTheme),
      // ignore: deprecated_member_use
      // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      // platform: TargetPlatform.android,
      colorScheme: colorSchemeLight.copyWith(
        error: AppColors.errorColor,
        primary: AppColors.kPrimaryColor,
        background: AppColors.kBackgroundColor,
      ),
    );
  }

  static ThemeData darkMode() {
    const ColorScheme colorSchemeDark = ColorScheme.dark();
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      // useMaterial3: false,
      primaryColor: AppColors.kPrimaryColor,
      visualDensity: VisualDensity.comfortable,
      scaffoldBackgroundColor: const Color(0xFF181818),
      appBarTheme: const AppBarTheme(color: Color(0xFF616161)),
      popupMenuTheme: const PopupMenuThemeData(color: Color(0xFF303642)),
      iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
      shadowColor: const Color(0x8F000000),
      indicatorColor: AppColors.kPrimaryColor,
      splashColor: AppColors.kPrimaryColor.withOpacity(0.2),
      hoverColor: AppColors.kPrimaryColor.withOpacity(0.1),
      splashFactory: InkRipple.splashFactory,
      canvasColor: const Color(0xFF1E1E1E),
      disabledColor: const Color(0xFFCCCCCC),
      textTheme: buildTextTheme(base.textTheme),
      primaryTextTheme: buildTextTheme(base.primaryTextTheme),
      // ignore: deprecated_member_use
      // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      // platform: TargetPlatform.android,
      colorScheme: colorSchemeDark.copyWith(error: AppColors.errorColor, primary: AppColors.kPrimaryColor, background: AppColors.kBackgroundColor),
    );
  }

/* ===================> Custom Light TextStyle <================== */
  static TextTheme buildTextTheme(TextTheme base) {
    // ======Font=Family=======> Montserrat <=======Font=Family====== //
    return base.copyWith(
      /// Body Text
      bodyLarge: TextStyle(
          fontSize: 16.0, letterSpacing: 0.5, fontWeight: FontWeight.w400, color: base.bodyLarge!.color, fontFamily: AppStyle.fontFamilyName),

      /// This style is flutter default body textStyle (without textStyle) ///
      bodyMedium: TextStyle(
          fontSize: 14.0, letterSpacing: 0.25, fontWeight: FontWeight.w400, color: base.bodyMedium!.color, fontFamily: AppStyle.fontFamilyName),

      /// Head Line
      displayLarge: TextStyle(
          fontSize: 96.0, letterSpacing: -1.5, fontWeight: FontWeight.w300, color: base.displayLarge!.color, fontFamily: AppStyle.fontFamilyName),
      displayMedium: TextStyle(
          fontSize: 60.0, letterSpacing: -0.5, fontWeight: FontWeight.w300, color: base.displayMedium!.color, fontFamily: AppStyle.fontFamilyName),
      displaySmall: TextStyle(
          fontSize: 48.0, letterSpacing: 0.0, fontWeight: FontWeight.w400, color: base.displaySmall!.color, fontFamily: AppStyle.fontFamilyName),
      headlineMedium: TextStyle(
          fontSize: 34.0, letterSpacing: 0.25, fontWeight: FontWeight.w400, color: base.headlineMedium!.color, fontFamily: AppStyle.fontFamilyName),
      headlineSmall: TextStyle(
          fontSize: 24.0, letterSpacing: 0.0, fontWeight: FontWeight.w400, color: base.headlineSmall!.color, fontFamily: AppStyle.fontFamilyName),
      titleLarge: TextStyle(
          fontSize: 20.0, letterSpacing: 0.15, fontWeight: FontWeight.w500, color: base.titleLarge!.color, fontFamily: AppStyle.fontFamilyName),

      /// Sub Title
      titleMedium: TextStyle(
          fontSize: 16.0, letterSpacing: 0.15, fontWeight: FontWeight.w400, color: base.titleMedium!.color, fontFamily: AppStyle.fontFamilyName),
      titleSmall: TextStyle(
          fontSize: 14.0, letterSpacing: 0.1, fontWeight: FontWeight.w500, color: base.titleSmall!.color, fontFamily: AppStyle.fontFamilyName),

      /// Caption
      bodySmall: TextStyle(
          fontSize: 12.0, letterSpacing: 0.4, fontWeight: FontWeight.w400, color: base.bodySmall!.color, fontFamily: AppStyle.fontFamilyName),

      /// Over Line
      labelSmall: TextStyle(
          fontSize: 10.0, letterSpacing: 1.5, fontWeight: FontWeight.w400, color: base.labelSmall!.color, fontFamily: AppStyle.fontFamilyName),

      /// Button
      labelLarge: TextStyle(
          fontSize: 14.0, letterSpacing: 1.25, fontWeight: FontWeight.w400, color: base.labelLarge!.color, fontFamily: AppStyle.fontFamilyName),
    );
  }
}
