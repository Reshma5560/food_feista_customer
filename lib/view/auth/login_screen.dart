import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:get/get.dart';

import '../../controller/auth/login_controller.dart';
import '../../res/app_colors.dart';
import '../../res/ui_utils.dart';
import '../../utils/helper.dart';
import '../gradient_container/gradient_container.dart';
import 'components/auth_header.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController con = Get.put(LoginController());

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
                                  "Welcome",
                                  style: AppStyle.authTitleStyle(),
                                ),
                                SizedBox(height: defaultPadding.w),
                                Text(
                                  "Are you ready to continue your culinary journey, Foodie? Log in to your account now.",
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
                                SizedBox(height: defaultPadding.w),
                                AppTextField(
                                  titleText: "Password",
                                  hintText: "Enter Password",
                                  controller: con.passwordCon.value,
                                  errorMessage: con.passwordError.value,
                                  showError: con.passwordValidation.value,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    con.passwordValidation.value = false;
                                  },
                                  inputFormatters: [

                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).viewInsets.bottom + defaultPadding.w * 3),
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
                                            title: "LOGIN",
                                            loader: con.isLoading.value,
                                            onHighlightChanged: (press) {
                                              con.buttonPress.value = press;
                                            },
                                            onPressed: () {
                                              if (con.isLoading.isFalse) {
                                                /// Email validation
                                                if (con.emailCon.value.text.trim().isEmpty) {
                                                  con.emailValidation.value = true;
                                                  con.emailError.value = "Please enter your email address";
                                                } else if (Helper.isEmail(con.emailCon.value.text.trim()) != true) {
                                                  con.emailValidation.value = true;
                                                  con.emailError.value = "Please enter valid email address";
                                                } else {
                                                  con.emailValidation.value = false;
                                                }





                                                if (con.emailValidation.isFalse) {
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
