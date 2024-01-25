import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/auth/signup_controller.dart';
import 'package:foodapplication/utils/helper.dart';
import 'package:get/get.dart';

import '../../res/app_button.dart';
import '../../res/app_colors.dart';
import '../../res/app_style.dart';
import '../../res/app_text_field.dart';
import '../../res/ui_utils.dart';
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
                                SizedBox(height: defaultPadding.w),
                                Center(
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).colorScheme.background,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.kPrimaryColor,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.black.withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.white,
                                            size: 15.w,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  titleText: "Full Name",
                                  hintText: "Enter Full Name",
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
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  titleText: "City",
                                  hintText: "Select City",
                                  controller: con.cityCon.value,
                                  errorMessage: con.cityError.value,
                                  showError: con.cityValidation.value,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    con.cityValidation.value = false;
                                  },
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  titleText: "State",
                                  hintText: "Select State",
                                  controller: con.stateCon.value,
                                  errorMessage: con.stateError.value,
                                  showError: con.stateValidation.value,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    con.stateValidation.value = false;
                                  },
                                ),
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  controller: con.mobileNumberCon.value,
                                  errorMessage: con.mobileError.value,
                                  showError: con.isMobileValid.value,
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
                                  titleText: "Referral Code",
                                  hintText: "Enter Referral Code",
                                  controller: con.referralCodeCon.value,
                                  errorMessage: con.referralCodeError.value,
                                  showError: con.referralCodeValidation.value,
                                  keyboardType: TextInputType.streetAddress,
                                  onChanged: (value) {
                                    con.referralCodeValidation.value = false;
                                  },
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

                                                // Last name validation
                                                if (con.emailCon.value.text.trim().isEmpty) {
                                                  con.emailValidation.value = true;
                                                  con.emailError.value = "Please enter your email address";
                                                } else if (Helper.isEmail(con.emailCon.value.text.trim()) != true) {
                                                  con.emailValidation.value = true;
                                                  con.emailError.value = "Please enter valid email address";
                                                } else {
                                                  con.emailValidation.value = false;
                                                }

                                                if (con.firstNameValidation.isFalse && con.emailValidation.isFalse) {
                                                  FocusScope.of(context).unfocus();
                                                  // AuthRepository().signUpApi(
                                                  //   mobileNumber: int.parse(loginCon.mobileNumberCon.value.text.trim()),
                                                  //   isLoader: con.isLoading,
                                                  //   params: {
                                                  //     "mobile_no": loginCon.mobileNumberCon.value.text.trim(),
                                                  //     "first_name": con.firstNameCon.value.text.trim(),
                                                  //     "last_name": con.lastNameCon.value.text.trim(),
                                                  //     "device_token": Get.find<FirebaseController>().deviceToken.value,
                                                  //     "device_type": loginCon.deviceType.value,
                                                  //     "device_id": "${loginCon.deviceId.value}_${loginCon.mobileNumberCon.value.text.trim()}",
                                                  //   },
                                                  // );
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
