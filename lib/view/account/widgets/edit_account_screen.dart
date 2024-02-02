import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/components/edit_account_controller.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:foodapplication/res/app_appbar.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:get/get.dart';

class EditAccountScreen extends StatelessWidget {
  EditAccountScreen({super.key});

  final editAccountController = Get.put(EditAccountController());

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
                  title: "Edit Account",
                  onPressed: () {
                    Get.back();
                  },
                ),
                Expanded(
                    child: ListView(
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
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.greyFontColor,
                      ),
                      controller: editAccountController.firstNameCon,
                      errorMessage: editAccountController.firstNameError.value,
                      showError: editAccountController.firstNameValidation.value,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        editAccountController.firstNameValidation.value = false;
                      },
                    ),
                    SizedBox(height: 10.w),
                    AppTextField(
                      // titleText: "Full Name",
                      hintText: "Enter Last Name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.greyFontColor,
                      ),
                      controller: editAccountController.lastNameCon,
                      errorMessage: editAccountController.lastNameError.value,
                      showError: editAccountController.lastNameValidation.value,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        editAccountController.lastNameValidation.value = false;
                      },
                    ),
                    SizedBox(height: 10.w),
                    AppTextField(
                      // titleText: "Email",
                      hintText: "Enter Email",
                      readOnly: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors.greyFontColor,
                      ),
                      controller: editAccountController.emailCon,
                      errorMessage: editAccountController.emailError.value,
                      showError: editAccountController.emailValidation.value,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        editAccountController.emailValidation.value = false;
                      },
                    ),
                    SizedBox(height: 10.w),
                    AppTextField(
                      controller: editAccountController.mobileNumberCon,
                      errorMessage: editAccountController.mobileError.value,
                      showError: editAccountController.isMobileValid.value,
                      // titleText: "Mobile Number",
                      hintText: "Mobile Number",
                      prefixIcon: Icon(
                        Icons.message,
                        color: AppColors.greyFontColor,
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      onChanged: (value) {
                        if (editAccountController.mobileNumberCon.value.text.length == 10) {
                          FocusScope.of(context).unfocus();
                        }
                        editAccountController.isMobileValid.value = false;
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    AppButton(
                      onPressed: () {
                        DesktopRepository().editProfileApiCall(
                          isLoader: editAccountController.isLoader,
                          // params: {

                          //   "image":editAccountController.name
                          //       // editAccountController.selectedProfileImage?.path
                          // },
                        );
                      },
                      title: "Update",
                    )
                  ],
                ).paddingSymmetric(horizontal: 20))
              ]),
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
            borderRadius: const BorderRadius.all(
              Radius.circular(200),
            ),
            child: Container(
              height: 180,
              width: 180,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Obx(
                () => editAccountController.imagePath.isNotEmpty
                    ? Image.file(
                        io.File(editAccountController.imagePath.value),
                        fit: BoxFit.cover,
                      )
                    : editAccountController.image.value.isNotEmpty
                        ? Image.network(editAccountController.image.value)
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
          bottom: 20,
          right: 100,
          child: Center(
            child: GestureDetector(
              onTap: () {
                editAccountController.showImagePickerBottomSheet();
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
