import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/auth/signup_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../../repositories/auth_repositories.dart';
import '../../res/app_button.dart';
import '../../res/app_style.dart';
import '../../res/app_text_field.dart';
import '../../utils/helper.dart';
import '../gradient_container/gradient_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController con = Get.put(SignUpController());

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
                  child: TweenAnimationBuilder(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOutCubic,
                tween: Tween(begin: 20.0, end: 1.0),
                builder: (context, value, child) {
                  return AnimatedOpacity(
                      opacity: value == 20 ? 0 : 1,
                      duration: const Duration(milliseconds: 700),
                      child: Obx(() => Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            height: con.firstNameValidation.isFalse &&
                                    con.lastNameValidation.isFalse &&
                                    con.emailValidation.isFalse &&
                                    con.isMobileValid.isFalse &&
                                    con.passwordValidation.isFalse
                                ? Get.height * 0.80
                                : Get.height * 0.94,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30.r),
                                border: Border.all(
                                    width: 13.w,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2))),
                            child: ListView(
                              padding: EdgeInsets.all(defaultPadding.w),
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              physics:
                                  const NeverScrollableScrollPhysics(), // const RangeMaintainingScrollPhysics(),
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(AppAssets.bgLogo),
                                    Text(
                                      "Create Account",
                                      style: AppStyle.loginTitleStyle(),
                                    ),
                                  ],
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  // titleText: "First Name",
                                  hintText: "Enter First Name",
                                  controller: con.firstNameCon.value,
                                  errorMessage: con.firstNameError.value,
                                  showError: con.firstNameValidation.value,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    con.firstNameValidation.value = false;
                                  },
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  // titleText: "Last Name",
                                  hintText: "Enter Last Name",
                                  controller: con.lastNameCon.value,
                                  errorMessage: con.lastNameError.value,
                                  showError: con.lastNameValidation.value,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    con.lastNameValidation.value = false;
                                  },
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  // titleText: "Email",
                                  hintText: "Enter Email",
                                  controller: con.emailCon.value,
                                  errorMessage: con.emailError.value,
                                  showError: con.emailValidation.value,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    con.emailValidation.value = false;
                                  },
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  controller: con.mobileNumberCon.value,
                                  errorMessage: con.mobileError.value,
                                  showError: con.isMobileValid.value,
                                  textInputAction: TextInputAction.next,
                                  // titleText: "Mobile Number",
                                  hintText: "Mobile Number",
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  onChanged: (value) {
                                    if (con.mobileNumberCon.value.text.length ==
                                        10) {
                                      FocusScope.of(context).unfocus();
                                    }
                                    con.isMobileValid.value = false;
                                  },
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  // titleText: "Password",
                                  hintText: "Enter Password",
                                  controller: con.passwordCon.value,
                                  errorMessage: con.passwordError.value,
                                  showError: con.passwordValidation.value,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    if (con.passwordCon.value.text.length ==
                                        16) {
                                      con.passwordValidation.value = false;
                                      con.passwordError.value = "";
                                      FocusScope.of(context).unfocus();
                                    } else if (con
                                            .passwordCon.value.text.length <
                                        8) {
                                      con.passwordValidation.value = true;
                                      con.passwordError.value =
                                          "Please Enter your password at least 8 digits.";
                                    } else {
                                      con.passwordValidation.value = false;
                                      con.passwordError.value = "";
                                    }
                                  },
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.r)),
                                      borderSide:
                                          BorderSide(color: AppColors.white)),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(16),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() => Checkbox(
                                          value: con.isChecked.value,
                                          onChanged: (value) {
                                            con.isChecked.value = value!;
                                          },
                                        )),
                                    Text(
                                      'Subsribe to the newsletter',
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                SizedBox(height: defaultPadding.w),
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
                                            title: "SIGNUP",
                                            loader: con.isLoading.value,
                                            onHighlightChanged: (press) {
                                              con.buttonPress.value = press;
                                            },
                                            onPressed: () {
                                              if (con.isLoading.isFalse) {
                                                /// First name Validation
                                                if (con.firstNameCon.value.text
                                                    .trim()
                                                    .isEmpty) {
                                                  con.firstNameValidation
                                                      .value = true;
                                                  con.firstNameError.value =
                                                      "Please enter your first name";
                                                } else {
                                                  con.firstNameValidation
                                                      .value = false;
                                                }

                                                /// Last name Validation
                                                if (con.lastNameCon.value.text
                                                    .trim()
                                                    .isEmpty) {
                                                  con.lastNameValidation.value =
                                                      true;
                                                  con.lastNameError.value =
                                                      "Please enter your last name";
                                                } else {
                                                  con.lastNameValidation.value =
                                                      false;
                                                }

                                                ///password validation
                                                if (con.passwordCon.value.text
                                                    .isEmpty) {
                                                  con.passwordValidation.value =
                                                      true;
                                                  con.passwordError.value =
                                                      "Please Enter your password.";
                                                } else if (con.passwordCon.value
                                                        .text.length <
                                                    8) {
                                                  con.passwordValidation.value =
                                                      true;
                                                  con.passwordError.value =
                                                      "Please Enter your password at least 8 digits.";
                                                } else {
                                                  con.passwordValidation.value =
                                                      false;
                                                  con.passwordError.value = "";
                                                }

                                                // email validation
                                                if (con.emailCon.value.text
                                                    .trim()
                                                    .isEmpty) {
                                                  con.emailValidation.value =
                                                      true;
                                                  con.emailError.value =
                                                      "Please enter your email address";
                                                } else if (Helper.isEmail(con
                                                        .emailCon.value.text
                                                        .trim()) !=
                                                    true) {
                                                  con.emailValidation.value =
                                                      true;
                                                  con.emailError.value =
                                                      "Please enter valid email address";
                                                } else {
                                                  con.emailValidation.value =
                                                      false;
                                                }

                                                //mobile no validation
                                                if (con.mobileNumberCon.value
                                                    .text.isEmpty) {
                                                  con.isMobileValid.value =
                                                      true;
                                                  con.mobileError.value =
                                                      "Please Enter your mobile number.";
                                                } else if (con.mobileNumberCon
                                                        .value.text.length <
                                                    10) {
                                                  con.isMobileValid.value =
                                                      true;
                                                  con.mobileError.value =
                                                      "Please Enter your mobile number 10 digits.";
                                                } else {
                                                  con.isMobileValid.value =
                                                      false;
                                                  con.mobileError.value = "";
                                                }

                                                if (con.firstNameValidation
                                                        .isFalse &&
                                                    con.emailValidation
                                                        .isFalse &&
                                                    con.passwordValidation
                                                        .isFalse &&
                                                    con.lastNameValidation
                                                        .isFalse &&
                                                    con.isMobileValid.isFalse) {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  AuthRepository().signUpApi(
                                                    // mobileNumber: int.parse(
                                                    //     loginCon.mobileNumberCon
                                                    //         .value.text
                                                    //         .trim()),
                                                    isLoader: con.isLoading,
                                                    params: {
                                                      "first_name": con
                                                          .firstNameCon
                                                          .value
                                                          .text
                                                          .trim(),
                                                      "last_name": con
                                                          .lastNameCon
                                                          .value
                                                          .text
                                                          .trim(),
                                                      "email": con
                                                          .emailCon.value.text
                                                          .trim(),
                                                      "phone": con
                                                          .mobileNumberCon
                                                          .value
                                                          .text
                                                          .trim(),
                                                      "password": con
                                                          .passwordCon
                                                          .value
                                                          .text
                                                          .trim(),
                                                      "newsletter_subscribe":
                                                          con.isChecked.value ==
                                                                  true
                                                              ? 1
                                                              : 0,
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
                                    child: RichText(
                                      text: TextSpan(
                                        text: '',
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '', //Already have an account?',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          TextSpan(
                                              text: ' Login',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationThickness: 1.5,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: defaultPadding.h),
                              ],
                            ).paddingSymmetric(
                                horizontal: 10.w, vertical: 15.h),
                          )));
                },
              )),
              // UiUtils.scrollGradient(context),
            ],
          ),
        ),
      ),
    );
  }
}
