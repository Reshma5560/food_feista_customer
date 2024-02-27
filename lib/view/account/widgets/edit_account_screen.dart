import 'dart:io' as io;

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/components/edit_account_controller.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:foodapplication/res/app_appbar.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:get/get.dart';

class EditAccountScreen extends StatelessWidget {
  EditAccountScreen({super.key});

  final EditAccountController con = Get.put(EditAccountController());

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
                  Column(children: [
                    CommonAppBar(
                      title: "Edit Account",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                        child: ListView(
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
                              _profileImageWidget(),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              AppTextField(
                                // titleText: "Full Name",
                                hintText: "Enter First Name",
                                fillColor: AppColors.white,
                                controller: con.firstNameCon,
                                errorMessage: con.firstNameError.value,
                                showError: con.firstNameValidation.value,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  con.firstNameValidation.value = false;
                                },
                              ),
                              SizedBox(height: 10.w),
                              AppTextField(
                                // titleText: "Full Name",
                                hintText: "Enter Last Name",
                                controller: con.lastNameCon,
                                errorMessage: con.lastNameError.value,
                                showError: con.lastNameValidation.value,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  con.lastNameValidation.value = false;
                                },
                              ),
                              SizedBox(height: 10.w),
                              AppTextField(
                                // titleText: "Email",
                                hintText: "Enter Email",
                                readOnly: true,
                                controller: con.emailCon,
                                errorMessage: con.emailError.value,
                                showError: con.emailValidation.value,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  con.emailValidation.value = false;
                                },
                              ),
                              SizedBox(height: 10.w),
                              AppTextField(
                                controller: con.mobileNumberCon,
                                errorMessage: con.mobileError.value,
                                showError: con.isMobileValid.value,
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
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Obx(
                                () => AppButton(
                                    height: 30.h,
                                  borderRadius: BorderRadius.circular(12.r),
                                loader: con.isLoader.value,
                                  onPressed: () async {
                                    DesktopRepository().editProfileApiCall(
                                      isLoader: con.isLoader,
                                      data: {
                                        "first_name":
                                            con.firstNameCon.text.trim(),
                                        "last_name":
                                            con.lastNameCon.text.trim(),
                                        "email": con.emailCon.text.trim(),
                                        "phone":
                                            con.mobileNumberCon.text.trim(),
                                        if (con.apiImage != null)
                                          "image":
                                              await dio.MultipartFile.fromFile(
                                            con.apiImage!.path,
                                            filename: con.imagePath.value
                                                .split("/")
                                                .last,
                                          ),
                                      },
                                    );
                                  },
                                  title: "Update",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 20))
                  ]),
                ],
              ),
            );
          }),
    );
  }

  Widget _profileImageWidget() {
    return Stack(children: [
      Positioned(
        // left: 20,
        // top: 20,
        // right: 20,
        // bottom: 20,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                color: Colors.grey,
                // shape: BoxShape.circle,
              ),
              child: Obx(
                () => con.imagePath.isNotEmpty
                    ? Image.file(
                        io.File(con.imagePath.value),
                        fit: BoxFit.cover,
                      )
                    : con.image.value.isNotEmpty
                        ? Image.network(
                            con.image.value,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                            fit: BoxFit.cover,
                          ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 14,
          right: 95,
          child: Center(
            child: GestureDetector(
              onTap: () {
                con.showImagePickerBottomSheet();
              },
              child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(Get.context!).primaryColor,
                    // colorScheme.background,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Icon(
                    Icons.camera,
                    // AppIcons.cameraIcon,\
                    color: AppColors.white,
                    //  Theme.of(Get.context!).primaryColor,
                    // height: 25,
                    // width: 25,
                    size: 25,
                  )),
            ),
          ))
    ]);
  }
}
