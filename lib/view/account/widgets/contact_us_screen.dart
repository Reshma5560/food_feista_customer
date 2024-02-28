import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/components/contact_us_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:get/get.dart';

import '../../../res/app_appbar.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_style.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final ContactUsController con = Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        tween: Tween(begin: 20.0, end: 1.0),
        builder: (context, value, child) {
          return AnimatedOpacity(
            opacity: value == 20 ? 0 : 1,
            duration: const Duration(milliseconds: 700),
            child: Stack(
              children: [
                Image.asset(AppAssets.appbarBgImage),
                Column(
                  children: [
                    CommonAppBar(
                      title: "Contact Us",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        physics: const RangeMaintainingScrollPhysics(),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 20.h),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                color: Theme.of(context).colorScheme.background,
                                boxShadow: AppStyle.boxShadow(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                _fullNameRowModule(),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                _mobileNoRowModule(),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                _emailRowModule(),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                _feedbackRowModule(),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                AppButton(
                                  height: 30.h,
                                  borderRadius: BorderRadius.circular(12.r),
                                  onPressed: con.submitFunction,
                                  child: Text(
                                    "Submit",
                                    style: AppStyle.mediumWhite(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _fullNameRowModule() {
    return AppTextField(
      hintText: "Enter Your Full Name",
      controller: con.fullnameCon,
      errorMessage: con.fullNameError.value,
      showError: con.fullnameValidation.value,
      fillColor: AppColors.white,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        con.fullnameValidation.value = false;
      },
    );
  }

  _mobileNoRowModule() {
    return AppTextField(
      hintText: "Enter Your Mobile Number",
      controller: con.mobilenoCon,
      errorMessage: con.mobileNoError.value,
      showError: con.mobileNoValidation.value,
      fillColor: AppColors.white,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        con.mobileNoValidation.value = false;
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }

  _emailRowModule() {
    return AppTextField(
      hintText: "Enter Email ID",
      controller: con.emailCon,
      readOnly: true,
      fillColor: AppColors.white,
      keyboardType: TextInputType.emailAddress,
    );
  }

  _feedbackRowModule() {
    return AppTextField(
      hintText: "Enter Your Message",
      controller: con.feedbackCon,
      errorMessage: con.feedbackError.value,
      showError: con.feedbackValidation.value,
      fillColor: AppColors.white,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        con.feedbackValidation.value = false;
      },
    );
  }
}
