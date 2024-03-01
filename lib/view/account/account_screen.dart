import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/account_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:foodapplication/utils/local_storage.dart';
import 'package:get/get.dart';

import '../../res/widgets/empty_element.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final ProfileController con = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.appbarBgImage,
            fit: BoxFit.fill,
            width: Get.width,
            height: Get.height,
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Setting",
                  style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.12),
            child: LocalStorage.token.value.isNotEmpty
                ? _bodyWidget()
                : Column(
                    children: [
                      EmptyElement(
                        height: Get.height / 1.8,
                        imageHeight: Get.width / 2.4,
                        imageWidth: Get.width / 2,
                        spacing: 5,
                        title: "Please Login !!",
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: AppButton(
                          onPressed: () {
                            Get.offAllNamed(AppRoutes.loginScreen);
                          },
                          title: "Login",
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // Widget _profileImageWidget() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
  //     child: Row(
  //       children: [
  //         Center(
  //           child: Obx(
  //             () => con.userApiImageFile.value.isNotEmpty
  //                 ? MFNetworkImage(
  //                     height: 100,
  //                     width: 100,
  //                     imageUrl: con.userApiImageFile.value,
  //                     fit: BoxFit.cover,
  //                     shape: BoxShape.circle,
  //                   )
  //                 : Container(
  //                     height: 100,
  //                     width: 100,
  //                     decoration: BoxDecoration(
  //                       color: Colors.grey,
  //                       shape: BoxShape.circle,
  //                       image: DecorationImage(
  //                         image: AssetImage(AppAssets.profileIcon),
  //                         onError: (exception, stackTrace) => Image.asset(
  //                           AppAssets.profileIcon,
  //                           fit: BoxFit.fill,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: defaultPadding),
  //           child: Column(
  //             // mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Obx(
  //                 () => Text(
  //                   "${con.userName}",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: 18.sp,
  //                   ),
  //                 ),
  //               ),
  //               Obx(
  //                 () => Text(
  //                   "+91 ${con.phoneNoName.value}",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16.sp,
  //                     color: AppColors.greyFontColor,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _appHeader(BuildContext context) {
  //   return MyAppBar(
  //     bgColor: Colors.transparent,
  //     // leading: IconButton(
  //     //   icon: Icon(
  //     //     Icons.arrow_back_outlined,
  //     //     color: Theme.of(context).primaryColor,
  //     //   ),
  //     //   onPressed: () {
  //     //     Get.back();
  //     //   },
  //     // ),
  //     title: "Setting",
  //     centerTitle: true,
  //     titleStyle:
  //         AppStyle.customAppBarTitleStyle().copyWith(color: Colors.black),
  //   );
  // }

  Widget _bodyWidget() {
    return Column(
      children: [
        CustomListTile(
          icon: Icons.account_circle,
          title: 'Edit Account',
          onPressed: () {
            Get.toNamed(
              AppRoutes.editAccountScreen,
              arguments: {
                'image': con.userApiImageFile.value,
                'firstName': con.firstName.value,
                'lastName': con.lastName.value,
                'email': con.email.value,
                'mobileNo': con.phoneNoName.value
              },
            );
          },
        ),
        SizedBox(height: 15.h),
        CustomListTile(
          icon: Icons.location_on,
          title: 'Manage Address',
          onPressed: () {
            Get.toNamed(AppRoutes.manageAddressScreen);
          },
        ),
        SizedBox(height: 15.h),
        CustomListTile(
          icon: Icons.favorite,
          title: 'Favorite',
          onPressed: () {
            Get.toNamed(AppRoutes.wishListScreen);
          },
        ),
        SizedBox(height: 15.h),
        CustomListTile(
          icon: Icons.password,
          title: 'Change password',
          onPressed: () {
            Get.toNamed(AppRoutes.updatePasswordScreen);
          },
        ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        // const CustomListTile(
        //   icon: Icons.percent,
        //   title: 'Offer',
        // ),
        SizedBox(height: 15.h),
        CustomListTile(
          icon: Icons.contact_support_sharp,
          title: 'Contact Us',
          onPressed: () {
            Get.toNamed(AppRoutes.contactUsScreen);
          },
        ),
        SizedBox(height: 15.h),
        CustomListTile(
          icon: Icons.info,
          title: 'About Us',
          onPressed: () {
            // print("---------------");
            // const MyWebView(webURL: "https://www.youtube.com/", title: "Terms and Conditions");
            Get.toNamed(AppRoutes.aboutUsScreen);
          },
        ),
        SizedBox(height: 15.h),
        CustomListTile(
          icon: Icons.help_outline_sharp,
          title: 'Terms & Condition',
          onPressed: () {
            Get.toNamed(AppRoutes.termsConditionsScreen);
          },
        ),
        SizedBox(height: 15.h),
        CustomListTile(
          icon: Icons.privacy_tip,
          title: 'Privacy Policy',
          onPressed: () {
            Get.toNamed(AppRoutes.privacyPolicyScreen);
          },
        ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        // const CustomListTile(
        //   icon: Icons.settings,
        //   title: 'Setting',
        // ),
        SizedBox(height: 15.h),
        CustomListTile(
          icon: Icons.location_city,
          title: 'Change city',
          onPressed: () => Get.toNamed(AppRoutes.getCityScreen),
        ),
        SizedBox(height: 15.h),
        CustomListTile(
          icon: Icons.logout,
          title: 'LOGOUT',
          onPressed: _logoutWidget,
          // onPressed: () => showDialog(
          //   barrierDismissible: false,
          //   context: Get.context!,
          //   builder: (context) {
          //     return CustomLogoutAlertDialog(
          //       text: "Logout",
          //       content: "Are you sure you want logout ?",
          //       yesButtonText: "Yes",
          //       onYesPressed: () {
          //         con.isLoader.value = true;
          //         LocalStorage.clearLocalStorage().then(
          //           (value) {
          //             con.isLoader.value = false;
          //             Get.offAllNamed(AppRoutes.loginScreen);
          //           },
          //         );
          //       },
          //       //  () async => await DesktopRepository()
          //       //     .logOutApiCall(isLoader: profileController.isLoader),
          //       noButtonText: "No",
          //       onNoPressed: () => Get.back(),
          //       bgColor: Theme.of(context).primaryColor,
          //     );
          // },
          // ),
        ),
      ],
    ).paddingSymmetric(horizontal: 15.h);
  }

  _logoutWidget() {
    return Get.dialog(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).colorScheme.background,
                  border: Border.all(width: 3, color: Theme.of(Get.context!).primaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(
                    color: Theme.of(Get.context!).colorScheme.background,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const SizedBox(height: 10),
                      Text(
                        "Logout",
                        style: TextStyle(
                          // fontFamily: FontFamilyText.sFProDisplayRegular,
                          color: Theme.of(Get.context!).primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Are you sure you want logout ?",
                        style: TextStyle(
                          // fontFamily: FontFamilyText.sFProDisplayRegular,
                          color: Theme.of(Get.context!).primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              height: 30.h,
                              borderRadius: BorderRadius.circular(10),
                              onPressed: () {
                                con.isLoader.value = true;
                                LocalStorage.clearLocalStorage().then(
                                  (value) {
                                    con.isLoader.value = false;
                                    Get.offAllNamed(AppRoutes.loginScreen);
                                  },
                                );
                              },
                              title: "YES",
                              // child: Text(
                              //   "Yes",
                              //   style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                              // ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: AppButton(
                              height: 30.h,
                              buttonType: ButtonType.outline,
                              borderRadius: BorderRadius.circular(10),
                              onPressed: () {
                                Get.back();
                              },
                              title: "NO",
                              // child: Text(
                              //   "No",
                              //   style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
        barrierDismissible: false);
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? child;
  final bool? isChildShow;
  final void Function()? onPressed;

  const CustomListTile({super.key, required this.icon, required this.title, this.onPressed, this.child, this.isChildShow});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 2.h),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2), borderRadius: BorderRadius.circular(12.r), color: AppColors.white),
        child: Column(
          children: [
            Row(children: [
              // Icon(
              //   icon,
              //   size: 24,
              // ),
              // const SizedBox(
              //   width: 8,
              // ),
              Expanded(
                  child: Text(
                title,
                style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 14),
              )),
              Icon(
                isChildShow == true ? Icons.arrow_drop_up_sharp : Icons.arrow_right,
                size: 30.h,
                color: Theme.of(context).primaryColor,
              ),
            ]).paddingSymmetric(horizontal: defaultPadding, vertical: 4),
            isChildShow == true ? child ?? const SizedBox() : const SizedBox()
          ],
        ),
      ),
    );
  }
}
