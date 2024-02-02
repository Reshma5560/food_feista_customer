import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapplication/controller/account/components/contact_us_controller.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:get/get.dart';

import '../../../res/app_appbar.dart';
import '../../../res/app_assets.dart';
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
            child: Column(
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
                        horizontal: defaultPadding, vertical: defaultPadding),
                    physics: const RangeMaintainingScrollPhysics(),
                    children: [
                      Center(
                        child: Image.asset(
                          AppAssets.appLogo,
                          width: Get.width / 2,
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
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
                        onPressed: con.submitFunction,
                        child: Text(
                          "Submit",
                          style: AppStyle.mediumWhite(),
                        ),
                      ).paddingSymmetric(horizontal: 50)
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _fullNameRowModule() {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Text("Full Name -",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              )),
        ),
        Expanded(
          flex: 2,
          child: AppTextField(
            titleText: "Full Name",
            hintText: "Enter Your Full Name",
            controller: con.fullnameCon,
            // errorMessage: con.passwordError.value,
            // showError: con.passwordValidation.value,
            fillColor: AppColors.greyShad1,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              // if (con.passwordCon.value.text.length == 8) {
              //   con.passwordError.value = "";
              //   FocusScope.of(context).unfocus();
              // } else if (con.passwordCon.value.text.length < 8) {
              //   con.passwordValidation.value = true;
              //   con.passwordError.value = "Please Enter your password at least 8 digits.";
              // } else {
              //   con.passwordValidation.value = false;
              //   con.passwordError.value = "";
              // }
            },
            inputFormatters: const [
              // FilteringTextInputFormatter.digitsOnly,
              // LengthLimitingTextInputFormatter(8),
            ],
          ),
        ),
      ],
    );
  }

  _mobileNoRowModule() {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Text("Mobile No -",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              )),
        ),
        Expanded(
          flex: 2,
          child: AppTextField(
            titleText: "Mobile No",
            hintText: "Enter Your Mobile Number",
            controller: con.mobilenoCon,
            // errorMessage: con.passwordError.value,
            // showError: con.passwordValidation.value,
            fillColor: AppColors.greyShad1,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              // if (con.passwordCon.value.text.length == 8) {
              //   con.passwordError.value = "";
              //   FocusScope.of(context).unfocus();
              // } else if (con.passwordCon.value.text.length < 8) {
              //   con.passwordValidation.value = true;
              //   con.passwordError.value = "Please Enter your password at least 8 digits.";
              // } else {
              //   con.passwordValidation.value = false;
              //   con.passwordError.value = "";
              // }
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
          ),
        ),
      ],
    );
  }

  _emailRowModule() {
    return Row(children: [
      const Expanded(
        flex: 1,
        child: Text("Email ID -",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            )),
      ),
      Expanded(
          flex: 2,
          child: AppTextField(
            titleText: "Email ID",
            hintText: "Enter Email ID",
            controller: con.emailCon,
            // errorMessage: con.emailError.value,
            readOnly: true,
            fillColor: AppColors.greyShad1,
            // showError: con.emailValidation.value,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              // con.emailValidation.value = false;
            },
          ))
    ]);
  }

  _feedbackRowModule() {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Text("Feedback -",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              )),
        ),
        Expanded(
          flex: 2,
          child: AppTextField(
            titleText: "Feedback",
            hintText: "Enter Your Message",
            controller: con.feedbackCon,
            // errorMessage: con.passwordError.value,
            // showError: con.passwordValidation.value,
            fillColor: AppColors.greyShad1,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              // if (con.passwordCon.value.text.length == 8) {
              //   con.passwordError.value = "";
              //   FocusScope.of(context).unfocus();
              // } else if (con.passwordCon.value.text.length < 8) {
              //   con.passwordValidation.value = true;
              //   con.passwordError.value = "Please Enter your password at least 8 digits.";
              // } else {
              //   con.passwordValidation.value = false;
              //   con.passwordError.value = "";
              // }
            },
            inputFormatters: const [
              // FilteringTextInputFormatter.digitsOnly,
              // LengthLimitingTextInputFormatter(8),
            ],
          ),
        ),
      ],
    );
  }
}
