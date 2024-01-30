
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/components/update_passwprd_controller.dart';
import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:foodapplication/res/app_appbar.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:get/get.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final con = Get.put(UpdatePasswordController());
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
                  child: Column(children: [
                    CommonAppBar(
                      title: "Terms & Conditions",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          AppTextField(
                            titleText: "Old Password",
                            hintText: "Enter Old Password",
                            controller: con.oldPasswordCon,
                            errorMessage: con.oldPasswordError.value,
                            showError: con.oldPasswordValidation.value,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              if (con.oldPasswordCon.value.text.length == 8) {
                                con.oldPasswordError.value = "";
                                FocusScope.of(context).unfocus();
                              } else if (con.oldPasswordCon.value.text.length <
                                  8) {
                                con.oldPasswordValidation.value = true;
                                con.oldPasswordError.value =
                                    "Please Enter your password at least 8 digits.";
                              } else {
                                con.oldPasswordValidation.value = false;
                                con.oldPasswordError.value = "";
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).viewInsets.bottom +
                                  defaultPadding.w * 3),
                          AppTextField(
                            titleText: "New Password",
                            hintText: "Enter New Password",
                            controller: con.newPasswordCon,
                            errorMessage: con.newPasswordError.value,
                            showError: con.newPasswordValidation.value,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              if (con.newPasswordCon.value.text.length == 8) {
                                con.newPasswordError.value = "";
                                FocusScope.of(context).unfocus();
                              } else if (con.newPasswordCon.value.text.length <
                                  8) {
                                con.newPasswordValidation.value = true;
                                con.newPasswordError.value =
                                    "Please Enter your password at least 8 digits.";
                              } else {
                                con.newPasswordValidation.value = false;
                                con.newPasswordError.value = "";
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).viewInsets.bottom +
                                  defaultPadding.w * 3),
                          AppTextField(
                            titleText: "Password",
                            hintText: "Enter Password",
                            controller: con.cnfmNewPasswordCon,
                            errorMessage: con.cnfmNewPasswordError.value,
                            showError: con.cnfmNewPasswordValidation.value,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              if (con.cnfmNewPasswordCon.value.text.length ==
                                  8) {
                                con.cnfmNewPasswordError.value = "";
                                FocusScope.of(context).unfocus();
                              } else if (con
                                      .cnfmNewPasswordCon.value.text.length <
                                  8) {
                                con.cnfmNewPasswordValidation.value = true;
                                con.cnfmNewPasswordError.value =
                                    "Please Enter your password at least 8 digits.";
                              } else {
                                con.cnfmNewPasswordValidation.value = false;
                                con.cnfmNewPasswordError.value = "";
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).viewInsets.bottom +
                                  defaultPadding.w * 3),
                          AppButton(
                              onPressed: () {
                                AuthRepository().updatePasswordApiCall(params: {
                                  "old_password": con.oldPasswordCon.text,
                                  "password": con.newPasswordCon.text,
                                  "password_confirmation":
                                      con.cnfmNewPasswordCon.text
                                });
                              },
                              title: "UpdateF")
                        ],
                      ),
                    )
                  ]));
            }));
  }
}
