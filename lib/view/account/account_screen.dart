import 'package:flutter/material.dart';
import 'package:foodapplication/common_widgets/custom_alert_dislog.dart';
import 'package:foodapplication/controller/account/account_controller.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:foodapplication/utils/local_storage.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultPadding,
          ),
          _logoutWidget(),
          const SizedBox(
            height: defaultPadding,
          ),
          _profileImageWidget(),
          const SizedBox(
            height: defaultPadding,
          ),
          Text("My Account", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Theme.of(context).primaryColor))
              .paddingSymmetric(horizontal: defaultPadding),
          const SizedBox(
            height: defaultPadding,
          ),
          _bodyWidget(),
        ],
      ),
    );
  }

  Widget _logoutWidget() {
    return TextButton(
      onPressed: () => showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (context) {
          return CustomLogoutAlertDialog(
            text: "Logout",
            content: "Are you sure you want logout ?",
            yesButtonText: "Yes",
            onYesPressed: () {
              profileController.isLoader.value = true;
              LocalStorage.clearLocalStorage().then((value) {
                profileController.isLoader.value = false;
                Get.offAllNamed(AppRoutes.loginScreen);
              });
            },
            //  () async => await DesktopRepository()
            //     .logOutApiCall(isLoader: profileController.isLoader),
            noButtonText: "No",
            onNoPressed: () => Get.back(),
            bgColor: Theme.of(context).primaryColor,
          );
        },
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Logout"),
          SizedBox(
            width: 7,
          ),
          Icon(Icons.logout)
        ],
      ),
    );
  }

  Widget _profileImageWidget() {
    return Column(children: [
      Stack(
        children: [
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
                child: profileController.getDataMap?.data.image != null
                    ? Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              profileController.getDataMap?.data.image ?? "",
                            ),
                            onError: (exception, stackTrace) =>
                                // Image.asset(AppImages.appLogoImage),
                                Image.network("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: const NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'), //userProfileImage),
                              fit: BoxFit.cover,
                              onError: (exception, stackTrace) =>
                                  // Image.asset(AppImages.appLogoImage),
                                  Image.network("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")),
                        ),
                      ),
              ),
            ),
          ),
          // Positioned(
          //     bottom: 20,
          //     right: 20,
          //     child: GestureDetector(
          //       onTap: () {
          //         // Get.to(
          //         //   () => EditProfileScreen(),
          //         // );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           color: Theme.of(Get.context!).primaryColor,
          //           borderRadius: const BorderRadius.all(
          //             Radius.circular(7),
          //           ),
          //         ),
          //         child: Icon(Icons.edit,
          //             color: Theme.of(Get.context!).primaryColor),
          //         // Image.asset(
          //         //   AppIcons.cameraIcon,
          //         //   color: finalPrimaryColor,
          //         //   height: 25,
          //         //   width: 25,
          //         // )
          //       ),
          //     ))
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Text("${profileController.getDataMap?.data.firstName} ${profileController.getDataMap?.data.lastName}",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      Text("+91 ${profileController.getDataMap?.data.phone}",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.greyFontColor))
    ]);
  }

  Widget _bodyWidget() {
    return Container(
      // color: AppColors.greyShad1,
      child: Column(
        children: [
          CustomListTile(
            icon: Icons.account_circle,
            title: 'Edit Account',
            onPressed: () {
              Get.toNamed(AppRoutes.editAccountScreen);
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
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;

  const CustomListTile({super.key, required this.icon, required this.title, this.onPressed});

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
        Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
        Icon(
          Icons.arrow_forward_ios,
          size: defaultPadding,
          color: AppColors.greyFontColor,
        ),
      ]).paddingSymmetric(horizontal: defaultPadding, vertical: 4),
    );
  }
}
