import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/auth/signup_controller.dart';
import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/utils/helper.dart';
import 'package:get/get.dart';

import '../../res/app_button.dart';
import '../../res/app_style.dart';
import '../../res/app_text_field.dart';
import '../../res/ui_utils.dart';
import '../../route/app_routes.dart';
import '../gradient_container/gradient_container.dart';
import 'components/auth_header.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController con = Get.put(SignUpController());

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
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                              physics: const RangeMaintainingScrollPhysics(),
                              children: [
                                SizedBox(height: double.parse(value.toString())),
                                Text(
                                  "SignUp",
                                  style: AppStyle.authTitleStyle(),
                                ),
                                SizedBox(height: defaultPadding.w),
                                Text(
                                  "We required your basic information for your identify.",
                                  style: AppStyle.authSubtitleStyle(),
                                ),
                                // SizedBox(height: defaultPadding.w),
                                // Center(
                                //   child: Stack(
                                //     alignment: Alignment.bottomRight,
                                //     children: [
                                //       Container(
                                //         height: 100,
                                //         width: 100,
                                //         decoration: BoxDecoration(
                                //           shape: BoxShape.circle,
                                //           color: Theme.of(context).colorScheme.background,
                                //         ),
                                //       ),
                                //       InkWell(
                                //         onTap: () {},
                                //         child: Container(
                                //           height: 30,
                                //           width: 30,
                                //           alignment: Alignment.center,
                                //           decoration: BoxDecoration(
                                //             color: AppColors.kPrimaryColor,
                                //             shape: BoxShape.circle,
                                //             boxShadow: [
                                //               BoxShadow(
                                //                 color: AppColors.black.withOpacity(0.2),
                                //                 spreadRadius: 1,
                                //                 blurRadius: 5,
                                //               ),
                                //             ],
                                //           ),
                                //           child: Icon(
                                //             Icons.camera_alt_outlined,
                                //             color: Colors.white,
                                //             size: 15.w,
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  titleText: "First Name",
                                  hintText: "Enter First Name",
                                  controller: con.firstNameCon.value,
                                  errorMessage: con.firstNameError.value,
                                  showError: con.firstNameValidation.value,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    con.firstNameValidation.value = false;
                                  },
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  titleText: "Last Name",
                                  hintText: "Enter Last Name",
                                  controller: con.lastNameCon.value,
                                  errorMessage: con.lastNameError.value,
                                  showError: con.lastNameValidation.value,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    con.lastNameValidation.value = false;
                                  },
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  titleText: "Email",
                                  hintText: "Enter Email",
                                  controller: con.emailCon.value,
                                  errorMessage: con.emailError.value,
                                  showError: con.emailValidation.value,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    con.emailValidation.value = false;
                                  },
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  controller: con.mobileNumberCon.value,
                                  errorMessage: con.mobileError.value,
                                  showError: con.isMobileValid.value,
                                  textInputAction: TextInputAction.next,
                                  titleText: "Mobile Number",
                                  hintText: "Mobile Number",
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  onChanged: (value) {
                                    if (con.mobileNumberCon.value.text.length == 10) {
                                      FocusScope.of(context).unfocus();
                                    }
                                    con.isMobileValid.value = false;
                                  },
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  titleText: "Password",
                                  hintText: "Enter Password",
                                  controller: con.passwordCon.value,
                                  errorMessage: con.passwordError.value,
                                  showError: con.passwordValidation.value,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    if (con.passwordCon.value.text.length == 16) {
                                      con.passwordValidation.value = false;
                                      con.passwordError.value = "";
                                      FocusScope.of(context).unfocus();
                                    } else if (con.passwordCon.value.text.length < 8) {
                                      con.passwordValidation.value = true;
                                      con.passwordError.value = "Please Enter your password at least 8 digits.";
                                    } else {
                                      con.passwordValidation.value = false;
                                      con.passwordError.value = "";
                                    }
                                  },
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
                                      style: TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).viewInsets.bottom + defaultPadding.w),
                                Obx(
                                  () => TweenAnimationBuilder(
                                    duration: const Duration(milliseconds: 1000),
                                    curve: Curves.elasticOut,
                                    tween: con.buttonPress.value ? Tween(begin: 0.9, end: 0.97) : Tween(begin: 1.0, end: 1.0),
                                    builder: (context, value, child) {
                                      return Transform.scale(
                                        scale: value,
                                        child: Obx(
                                          () => AppButton(
                                            title: "SIGNUP",
                                            loader: con.isLoading.value,
                                            onHighlightChanged: (press) {
                                              con.buttonPress.value = press;
                                            },
                                            onPressed: () {
                                              if (con.isLoading.isFalse) {
                                                /// First name Validation
                                                if (con.firstNameCon.value.text.trim().isEmpty) {
                                                  con.firstNameValidation.value = true;
                                                  con.firstNameError.value = "Please enter your first name";
                                                } else {
                                                  con.firstNameValidation.value = false;
                                                }

                                                /// Last name Validation
                                                if (con.lastNameCon.value.text.trim().isEmpty) {
                                                  con.lastNameValidation.value = true;
                                                  con.lastNameError.value = "Please enter your last name";
                                                } else {
                                                  con.lastNameValidation.value = false;
                                                }

                                                ///password validation
                                                if (con.passwordCon.value.text.isEmpty) {
                                                  con.passwordValidation.value = true;
                                                  con.passwordError.value = "Please Enter your password.";
                                                } else if (con.passwordCon.value.text.length < 8) {
                                                  con.passwordValidation.value = true;
                                                  con.passwordError.value = "Please Enter your password at least 8 digits.";
                                                } else {
                                                  con.passwordValidation.value = false;
                                                  con.passwordError.value = "";
                                                }

                                                // email validation
                                                if (con.emailCon.value.text.trim().isEmpty) {
                                                  con.emailValidation.value = true;
                                                  con.emailError.value = "Please enter your email address";
                                                } else if (Helper.isEmail(con.emailCon.value.text.trim()) != true) {
                                                  con.emailValidation.value = true;
                                                  con.emailError.value = "Please enter valid email address";
                                                } else {
                                                  con.emailValidation.value = false;
                                                }

//mobile no validation
                                                if (con.mobileNumberCon.value.text.isEmpty) {
                                                  con.isMobileValid.value = true;
                                                  con.mobileError.value = "Please Enter your mobile number.";
                                                } else if (con.mobileNumberCon.value.text.length < 10) {
                                                  con.isMobileValid.value = true;
                                                  con.mobileError.value = "Please Enter your mobile number 10 digits.";
                                                } else {
                                                  con.isMobileValid.value = false;
                                                  con.mobileError.value = "";
                                                }

                                                if (con.firstNameValidation.isFalse &&
                                                    con.emailValidation.isFalse &&
                                                    con.passwordValidation.isFalse &&
                                                    con.lastNameValidation.isFalse &&
                                                    con.isMobileValid.isFalse) {
                                                  FocusScope.of(context).unfocus();
                                                  AuthRepository().signUpApi(
                                                    // mobileNumber: int.parse(
                                                    //     loginCon.mobileNumberCon
                                                    //         .value.text
                                                    //         .trim()),
                                                    isLoader: con.isLoading,
                                                    params: {
                                                      "first_name": con.firstNameCon.value.text.trim(),
                                                      "last_name": con.lastNameCon.value.text.trim(),
                                                      "email": con.emailCon.value.text.trim(),
                                                      "phone": con.mobileNumberCon.value.text.trim(),
                                                      "password": con.passwordCon.value.text.trim(),
                                                      "newsletter_subscribe": con.isChecked.value == true ? 1 : 0,
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
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Already have an account?',
                                            style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w300),
                                          ),
                                          TextSpan(
                                              text: ' Login', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: defaultPadding.h),
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
