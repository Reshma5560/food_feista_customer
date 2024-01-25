import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../../controller/auth/login_controller.dart';
import '../../res/app_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          Column(
            children: [
              Container(
                height: Get.height / 3,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding).copyWith(bottom: defaultPadding * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Are you ready to continue your culinary journey, Foodie? Log in to your account now.",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "OR",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(AppAssets.googleIcon, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: defaultPadding,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(AppAssets.facebookIcon, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Looking For a New Account? ",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              TextSpan(
                                text: "Signup",
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(AppRoutes.registerScreen);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: Get.height / 2,
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(defaultRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  // physics: const RangeMaintainingScrollPhysics(),
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),

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
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      fillColor: AppColors.greyShad1,
                    ),
                    // const SizedBox(
                    //   height: defaultPadding * 5,
                    // ),
                    AppButton(
                      width: Get.width / 2,
                      loader: con.isLoading.value,
                      borderRadius: BorderRadius.circular(26),
                      title: "LOGIN",
                      onPressed: () {
                        /// Mobile Number Validation
                        if (con.mobileNumberCon.value.text.trim().isEmpty) {
                          con.isMobileValid.value = true;
                          con.mobileError.value = "Please enter mobile number";
                        } else {
                          if (con.mobileNumberCon.value.text.trim().length == 10) {
                            con.isMobileValid.value = false;
                          } else {
                            con.mobileError.value = "Please enter valid mobile number";
                            con.isMobileValid.value = true;
                          }
                        }

                        Get.toNamed(AppRoutes.termsConditionsScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
