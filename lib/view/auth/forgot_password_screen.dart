import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/auth/forgot_password_controller.dart';
import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:foodapplication/utils/helper.dart';
import 'package:foodapplication/view/auth/components/auth_header.dart';
import 'package:foodapplication/view/gradient_container/gradient_container.dart';
import 'package:get/get.dart';


class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ForgotPasswordcontroller con = Get.put(ForgotPasswordcontroller());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: GradientContainer(
          child: Column(
            children: [
              const AuthHeader(),
              Expanded(
                child: Stack(
                  children: [
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutCubic,
                      tween: Tween(begin: 20.0, end: 1.0),
                      builder: (context, value, child) {
                        return AnimatedOpacity(
                          opacity: value == 20 ? 0 : 1,
                          duration: const Duration(milliseconds: 700),
                          child: Obx(
                            () => ListView(
                              padding: EdgeInsets.all(defaultPadding.w),
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              physics: const RangeMaintainingScrollPhysics(),
                              children: [
                                SizedBox(
                                    height: double.parse(value.toString())),
                                Text(
                                  "Forgot Password",
                                  style: AppStyle.authTitleStyle(),
                                ),
                                SizedBox(height: defaultPadding.w),
                                Text(
                                 "Enter your email and we will send you instruction to reset your password.",
                                   style: AppStyle.authSubtitleStyle(),
                                ),
                                SizedBox(height: defaultPadding.w),
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
                                SizedBox(
                                    height: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom +
                                        defaultPadding.w * 3),
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
                                            title: "CONTINUE",
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
                                                  con.emailValidation.value =
                                                      true;
                                                  con.emailError.value =
                                                      "Please enter your email address.";
                                                } else if (Helper.isEmail(con
                                                        .emailCon.value.text
                                                        .trim()) !=
                                                    true) {
                                                  con.emailValidation.value =
                                                      true;
                                                  con.emailError.value =
                                                      "Please enter valid email address.";
                                                } else {
                                                  con.emailValidation.value =
                                                      false;
                                                }

                                             

                                                if (con
                                                    .emailValidation.isFalse) {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  AuthRepository().forgotPasswordApiCall(
                                                    isLoader: con.isLoading,
                                                    params: {
                                                      "email": con
                                                          .emailCon.value.text
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
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    UiUtils.scrollGradient(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
