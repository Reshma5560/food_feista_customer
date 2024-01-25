import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'app_style.dart';

class AppTextField extends StatelessWidget {
  final String? titleText;
  final Color? titleTextColor;
  final Color? fillColor;
  final String? hintText;
  final TextEditingController? controller;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final int maxLines;

  final Color? cursorColor;
  final Color? textColor;
  final String? errorMessage;
  final bool? showError;
  final bool? autofocus;
  final VoidCallback? onTap;
  final VoidCallback? prefixOnTap;
  final VoidCallback? suffixOnTap;
  final double? radius;
  final double? cursorHeight;
  final bool? enabled;
  final bool? readOnly;
  final int? maxLength;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  final InputBorder? enabledBorder;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;

  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const AppTextField({
    super.key,
    this.titleText,
    this.titleTextColor,
    this.fillColor,
    this.hintText,
    this.controller,
    this.initialValue,
    this.validate,
    this.onChanged,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus,
    this.maxLength = 0,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.cursorColor,
    this.textColor = Colors.white,
    this.inputFormatters,
    this.errorMessage,
    this.showError = false,
    this.readOnly,
    this.onTap,
    this.radius,
    this.focusNode,
    this.prefixOnTap,
    this.suffixOnTap,
    this.style,
    this.hintStyle,
    this.enabledBorder,
    this.border,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.errorBorder,
    this.cursorHeight,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    if (/*titleText != null &&*/ errorMessage != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleText != null) filedTitle(),
          myTextFormField(context),
          if (errorMessage != null && errorMessage!.isNotEmpty) errorMessageWidget(),
        ],
      );
    } else {
      return myTextFormField(context);
    }
  }

  Padding filedTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 7),
      child: Text(
        titleText!,
        style: AppStyle.textFieldTitleStyle(),
      ),
    );
  }

  AnimatedContainer errorMessageWidget() {
    return AnimatedContainer(
      margin: EdgeInsets.only(left: 0, top: showError == false ? 0 : 5),
      alignment: Alignment.centerLeft,
      duration: const Duration(milliseconds: 180),
      height: showError == false ? 0 : 15 * 1.5,
      child: Text(
        errorMessage ?? "",
        style: AppStyle.errorTextStyle(),
      ),
    );
  }

  Widget myTextFormField(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      textInputAction: textInputAction,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: cursorColor ?? Theme.of(context).primaryColor,
      initialValue: initialValue,
      controller: controller,
      enabled: enabled,
      cursorHeight: cursorHeight,
      maxLength: maxLength != 0 ? maxLength : null,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      maxLines: maxLines,
      onFieldSubmitted: onFieldSubmitted,
      style: style ?? TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: titleTextColor ?? Theme.of(context).primaryColor),
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        filled: true,
        isCollapsed: true,
        contentPadding: contentPadding ?? const EdgeInsets.all(18),
        fillColor: enabled == false ? Theme.of(context).primaryColor.withAlpha(22) : fillColor ?? Colors.white,
        prefixIcon: prefixIcon != null
            ? InkWell(
                overlayColor: MaterialStateProperty.all(Get.isDarkMode ? null : Colors.white),
                onTap: prefixOnTap,
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? InkWell(
                overlayColor: MaterialStateProperty.all(Get.isDarkMode ? null : Colors.white),
                onTap: suffixOnTap,
                child: suffixIcon,
              )
            : null,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: AppColors.hintColor),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
                borderSide: BorderSide(color: showError == false ? AppColors.lightRed : Theme.of(context).colorScheme.error)),
        border: border ??
            OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.4))),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor.withOpacity(readOnly == true ? 0.2 : 1))),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.4))),
        disabledBorder: disabledBorder ??
            OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.4))),
        errorBorder: errorBorder ??
            OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
      ),
    );
  }
}
