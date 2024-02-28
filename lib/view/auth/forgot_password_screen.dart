import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/auth/forgot_password_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../../repositories/auth_repositories.dart';
import '../../res/app_button.dart';
import '../../res/app_style.dart';
import '../../res/app_text_field.dart';
import '../../utils/helper.dart';
import '../gradient_container/gradient_container.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ForgotPasswordcontroller con = Get.put(ForgotPasswordcontroller());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: GradientContainer(
          child: Stack(
            // alignment: Alignment.center,
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Image.asset(
                  AppAssets.bgLightImage,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Container(
                    height: Get.height * 0.43,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                            width: 13.w,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.2))),
                    child: TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutCubic,
                      tween: Tween(begin: 20.0, end: 1.0),
                      builder: (context, value, child) {
                        return AnimatedOpacity(
                            opacity: value == 20 ? 0 : 1,
                            duration: const Duration(milliseconds: 700),
                            child: Obx(() => ListView(
                                  padding: EdgeInsets.all(defaultPadding.w),
                                  keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior.onDrag,
                                  physics:
                                      const RangeMaintainingScrollPhysics(),
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(AppAssets.bgLogo),
                                        Text(
                                          "Forgot Password",
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: defaultPadding.h),
                                    AppTextField(
                                      titleText: "Email",
                                      hintText: "Enter Email",
                                      controller: con.emailCon.value,
                                      errorMessage: con.emailError.value,
                                      showError: con.emailValidation.value,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (value) {
                                        con.emailValidation.value = false;
                                      },
                                    ),
                                    SizedBox(height: 30.h),
                                    Obx(
                                      () => TweenAnimationBuilder(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.elasticOut,
                                        tween: con.buttonPress.value
                                            ? Tween(begin: 0.9, end: 0.97)
                                            : Tween(begin: 1.0, end: 1.0),
                                        builder: (context, value, child) {
                                          return Transform.scale(
                                            scale: value,
                                            child: Obx(
                                              () => AppButton(
                                                height: 30.h,
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                title: "Continue",
                                                loader: con.isLoading.value,
                                                onHighlightChanged: (press) {
                                                  con.buttonPress.value = press;
                                                },
                                                onPressed: () {
                                                  if (con.isLoading.isFalse) {
                                                    /// Email validation
                                                    if (con.emailCon.value.text
                                                        .trim()
                                                        .isEmpty) {
                                                      con.emailValidation
                                                          .value = true;
                                                      con.emailError.value =
                                                          "Please enter your email address.";
                                                    } else if (Helper.isEmail(
                                                            con.emailCon.value
                                                                .text
                                                                .trim()) !=
                                                        true) {
                                                      con.emailValidation
                                                          .value = true;
                                                      con.emailError.value =
                                                          "Please enter valid email address.";
                                                    } else {
                                                      con.emailValidation
                                                          .value = false;
                                                    }

                                                    if (con.emailValidation
                                                        .isFalse) {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      AuthRepository()
                                                          .forgotPasswordApiCall(
                                                        isLoader: con.isLoading,
                                                        params: {
                                                          "email": con.emailCon
                                                              .value.text
                                                              .trim(),
                                                        },
                                                      );
                                                    }
                                                  }
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: defaultPadding.h),
                                    Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.loginScreen);
                                        },
                                        child: Text(' Login',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationThickness: 1.5,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    SizedBox(height: defaultPadding.h),
                                  ],
                                ).paddingSymmetric(
                                    horizontal: 10.w, vertical: 15.h)));
                      },
                    )).paddingSymmetric(horizontal: 10.w),
              ),
              UiUtils.scrollGradient(context),
            ],
          ),
        ),
      ),
    );
  }
}
