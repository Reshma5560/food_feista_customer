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

import '../../packages/cached_network_image/cached_network_image.dart';
import '../../res/widgets/app_bar.dart';
import '../../res/widgets/empty_element.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final ProfileController con = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _appHeader(context),
          const SizedBox(
            height: defaultPadding,
          ),
          if (LocalStorage.token.value.isNotEmpty) _profileImageWidget(),
          const SizedBox(
            height: defaultPadding,
          ),
          LocalStorage.token.value.isNotEmpty
              ? _bodyWidget()
              : Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: AppButton(
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.loginScreen);
                        },
                        title: "Login",
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _profileImageWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          Center(
            child: Obx(
              () => con.userApiImageFile.value.isNotEmpty
                  ? MFNetworkImage(
                      height: 100,
                      width: 100,
                      imageUrl: con.userApiImageFile.value,
                      fit: BoxFit.cover,
                      shape: BoxShape.circle,
                    )
                  : Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppAssets.profileIcon),
                          onError: (exception, stackTrace) => Image.asset(
                            AppAssets.profileIcon,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    "${con.userName}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    "+91 ${con.phoneNoName.value}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.greyFontColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _appHeader(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(defaultRadius * 3),
        bottomRight: Radius.circular(defaultRadius * 3),
      ),
      child: MyAppBar(
        bgColor: Theme.of(context).colorScheme.background,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_outlined,
        //     color: Theme.of(context).primaryColor,
        //   ),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        title: "My Account",
        centerTitle: true,
        titleStyle:
            AppStyle.customAppBarTitleStyle().copyWith(color: Colors.black),
      ),
    );
  }

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
        Divider(
          color: AppColors.grey,
        ),
        CustomListTile(
          icon: Icons.location_on,
          title: 'Manage Address',
          onPressed: () {
            Get.toNamed(AppRoutes.manageAddressScreen);
          },
        ),
        Divider(
          color: AppColors.grey,
        ),
        CustomListTile(
          icon: Icons.favorite,
          title: 'Favorite',
          onPressed: () {
            Get.toNamed(AppRoutes.wishListScreen);
          },
        ),
        Divider(
          color: AppColors.grey,
        ),
        CustomListTile(
          icon: Icons.password,
          title: 'Change password',
          onPressed: () {
            Get.toNamed(AppRoutes.updatePasswordScreen);
          },
        ),
        Divider(
          color: AppColors.grey,
        ),
        const CustomListTile(
          icon: Icons.percent,
          title: 'Offer',
        ),
        Divider(
          color: AppColors.grey,
        ),
        CustomListTile(
          icon: Icons.contact_support_sharp,
          title: 'Contact Us',
          onPressed: () {
            Get.toNamed(AppRoutes.contactUsScreen);
          },
        ),
        Divider(
          color: AppColors.grey,
        ),
        CustomListTile(
          icon: Icons.info,
          title: 'About Us',
          onPressed: () {
            // print("---------------");
            // const MyWebView(webURL: "https://www.youtube.com/", title: "Terms and Conditions");
            Get.toNamed(AppRoutes.aboutUsScreen);
          },
        ),
        Divider(
          color: AppColors.grey,
        ),
        CustomListTile(
          icon: Icons.help_outline_sharp,
          title: 'Faqs',
          onPressed: () {
            Get.toNamed(AppRoutes.termsConditionsScreen);
          },
        ),
        Divider(
          color: AppColors.grey,
        ),
        const CustomListTile(
          icon: Icons.settings,
          title: 'Setting',
        ),
        Divider(
          color: AppColors.grey,
        ),
        CustomListTile(
          icon: Icons.location_city,
          title: 'Change city',
          onPressed: () => Get.toNamed(AppRoutes.getCityScreen),
        ),
        Divider(
          color: AppColors.grey,
        ),
        CustomListTile(
          icon: Icons.logout,
          title: 'LOGOUT',
          onPressed: () {},
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
          //   },
          // ),
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;

  const CustomListTile(
      {super.key, required this.icon, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(children: [
        Icon(
          icon,
          size: 24,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14))),
        Icon(
          Icons.arrow_forward_ios,
          size: defaultPadding,
          color: AppColors.greyFontColor,
        ),
      ]).paddingSymmetric(horizontal: defaultPadding, vertical: 4),
    );
  }
}
