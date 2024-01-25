import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/local_storage.dart';
import 'app_colors.dart';
import 'app_style.dart';

class AppDialogs {
  static deleteAccountDialog(BuildContext context,
      {required VoidCallback deleteOnTap}) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: defaultPadding.w, bottom: defaultPadding / 2),
                child: Text(
                  'Delete Account!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkRed,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(defaultPadding.w)
                        .copyWith(top: 15, bottom: 5),
                    child: RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontFamily: AppStyle.fontFamilyName,
                            height: 1.5),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Hey 👋 ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                          TextSpan(
                            text:
                                "${LocalStorage.firstName} ${LocalStorage.lastName}, ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                          TextSpan(
                            text: 'Are you sure you want to',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 12.sp),
                          ),
                          TextSpan(
                            text: ' delete ',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.sp,
                                color: AppColors.darkRed),
                          ),
                          TextSpan(
                            text: 'your account ?',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.darkRed.withOpacity(.1),
                    margin: const EdgeInsets.all(defaultPadding),
                    padding: const EdgeInsets.all(defaultPadding / 1.5),
                    child: Text(
                      "Deleting your account will remove all of your information from our system.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 11.sp),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: defaultPadding.w - 5),
                            color: const Color(0xffF2F2F2),
                            child: Center(
                              child: Text(
                                'Close',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: deleteOnTap,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: defaultPadding.w - 5),
                            color: AppColors.darkRed,
                            child: Center(
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

/* static deleteGroupDialog(BuildContext context, {required VoidCallback deleteOnTap, required String groupName}) {
    // Rx<TextEditingController> deleteCon = TextEditingController().obs;
    RxString deleteCon = "".obs;
    RxBool isShake = false.obs;

    AppTextField appTextField = AppTextField(
      cursorColor: AppColors.darkRed,
      hintText: groupName,
      // controller: deleteCon.value,
      autofocus: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkRed),
      ),
      onChanged: (value) {
        deleteCon.value = value.trimLeft();
      },
    );
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: defaultPadding.w, bottom: defaultPadding / 2),
                child: Text(
                  "Are you absolutely sure?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkRed,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding).copyWith(top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: defaultPadding / 2),
                          child: RichText(
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 15.sp, fontFamily: AppStyle.fontFamilyName, height: 1.5),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Enter the following to confirm: ',
                                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp),
                                ),
                                TextSpan(
                                  text: groupName,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(() => isShake.isTrue ? ShakeWidget(child: appTextField) : appTextField)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: const Color(0xffF2F2F2),
                            child: Center(
                              child: Text(
                                'Close',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => InkWell(
                            onTap: groupName == deleteCon.value
                                ? deleteOnTap
                                : () {
                                    isShake.value = true;
                                    if (isShake.isTrue) {
                                      HapticFeedback.heavyImpact();
                                    }
                                    Future.delayed(const Duration(milliseconds: 500)).then(
                                      (value) => isShake.value = false,
                                    );
                                  },
                            splashColor: Colors.transparent,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                              color: AppColors.darkRed.withOpacity(groupName == deleteCon.value ? 1 : .3),
                              child: Center(
                                child: Text(
                                  'Delete',
                                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static logoutDialog(BuildContext context, {required VoidCallback logoutOnTap}) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: defaultPadding.w, bottom: defaultPadding / 1.5),
                child: Text(
                  'Logout App!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding.w, horizontal: defaultPadding.w).copyWith(top: 15),
                    child: RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15.sp, fontFamily: AppStyle.fontFamilyName, height: 1.5),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Hey 👋 ',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                          TextSpan(
                            text: "${LocalStorage.firstName} ${LocalStorage.lastName}, ",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                          TextSpan(
                            text: 'Are you sure you want to logout from the application ?',
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: const Color(0xffF2F2F2),
                            child: Center(
                              child: Text(
                                'Close',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: logoutOnTap,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: Theme.of(context).primaryColor,
                            child: Center(
                              child: Text(
                                'Logout',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static backOperation(BuildContext context) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: defaultPadding.w, bottom: defaultPadding / 1.5),
                child: Text(
                  'Quit Application',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                endIndent: defaultPadding.w,
                indent: defaultPadding.w,
                height: 0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding.w, horizontal: defaultPadding.w * 2.5).copyWith(top: 15),
                    child: RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15.sp, fontFamily: AppStyle.fontFamilyName, height: 1.5),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Are you sure you want to ',
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp),
                          ),
                          TextSpan(
                            text: 'Quit ',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp, color: AppColors.blue),
                          ),
                          TextSpan(
                            text: 'the application?',
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: const Color(0xffF2F2F2),
                            child: Center(
                              child: Text(
                                'No',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final cacheDir = await getTemporaryDirectory();
                            if (cacheDir.existsSync()) {
                              cacheDir.deleteSync(recursive: true);
                            }
                            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: Theme.of(context).primaryColor,
                            child: Center(
                              child: Text(
                                'Yes',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static leaveGroup(BuildContext context, {required VoidCallback onLeave, required String groupName}) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: defaultPadding.w, bottom: defaultPadding / 1.5),
                child: Text(
                  'Leave!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding.w, horizontal: defaultPadding.w).copyWith(top: 15),
                    child: RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15.sp, fontFamily: AppStyle.fontFamilyName, height: 1.5),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Are you sure you want to leave',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          TextSpan(
                            text: " $groupName?",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: const Color(0xffF2F2F2),
                            child: Center(
                              child: Text(
                                'Close',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: onLeave,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: Theme.of(context).primaryColor,
                            child: Center(
                              child: Text(
                                'Leave',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static removeMemberInGroup(BuildContext context, {required VoidCallback onRemove, required String groupName, required String userName}) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: defaultPadding.w, bottom: defaultPadding / 1.5),
                child: Text(
                  'Remove user!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding.w, horizontal: defaultPadding.w).copyWith(top: 15),
                    child: RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15.sp, fontFamily: AppStyle.fontFamilyName, height: 1.5),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Remove ",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          TextSpan(
                            text: "$userName ",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                          TextSpan(
                            text: "from ",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          TextSpan(
                            text: '"$groupName" group?',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: const Color(0xffF2F2F2),
                            child: Center(
                              child: Text(
                                'Close',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: onRemove,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: AppColors.darkRed,
                            child: Center(
                              child: Text(
                                'Remove',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static deleteAllNotifications(BuildContext context, {required VoidCallback onDelete}) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: defaultPadding.w, bottom: defaultPadding / 1.5),
                child: Text(
                  'Delete!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding.w, horizontal: defaultPadding.w).copyWith(top: 15),
                    child: Text(
                      AppStrings.deleteNotificationConfirmation,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: const Color(0xffF2F2F2),
                            child: Center(
                              child: Text(
                                'Close',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: onDelete,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: Theme.of(context).primaryColor,
                            child: Center(
                              child: Text(
                                'Delete',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static groupInfoOrJoin(
    BuildContext context, {
    required RxString groupTitle,
    required RxString groupDesc,
    required RxString groupImage,
    required RxString adminName,
    required RxInt totalMembers,
    bool confirmation = false,
    required bool isGuestUser,
    VoidCallback? joinOnTap,
    VoidCallback? guestOnTap,
  }) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10.h),
              Center(
                child: Container(
                  height: 57.w,
                  width: 57.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.selectedTab,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.selectedTab,
                    ),
                    child: isValEmpty(groupImage)
                        ? Center(
                            child: Image.asset(
                              AppAssets.groupLogo,
                              fit: BoxFit.cover,
                              height: 30.w,
                            ),
                          )
                        : (groupImage.contains(AppStrings.groupDefaultImage)
                            ? Center(
                                child: MFNetworkImage(
                                  imageUrl: groupImage.value,
                                  fit: BoxFit.cover,
                                  height: 30.w,
                                ),
                              )
                            : (MFNetworkImage(
                                imageUrl: groupImage.value,
                                fit: BoxFit.cover,
                                shape: BoxShape.circle,
                              ))),
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Center(
                child: Text(
                  groupTitle.value,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp),
                ),
              ),
              SizedBox(height: 6.w),
              Center(
                child: Text(
                  adminName.value.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11.sp, color: AppColors.blue),
                ),
              ),
              SizedBox(height: 10.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 15),
                child: Text(
                  groupDesc.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.sp, color: AppColors.groupSubText, height: 1.5),
                ),
              ),
              if (int.parse("$totalMembers") > 0)
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: defaultPadding),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
                    decoration: BoxDecoration(gradient: LinearGradient(colors: AppColors.bannerGradientColorList)),
                    child: Text(
                      totalMembers <= 200 ? "$totalMembers ${AppStrings.joinedMembers}" : "200+ ${AppStrings.joinedMembers}",
                      style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700, color: AppColors.black, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              if (isGuestUser == true)
                Container(
                  color: AppColors.lightYellow,
                  padding: EdgeInsets.symmetric(horizontal: 11.sp, vertical: 8.sp),
                  margin: const EdgeInsets.all(defaultPadding).copyWith(top: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 30, child: Align(alignment: Alignment.topCenter, child: Image.asset(AppAssets.infoProfileIcon, height: 27))),
                      SizedBox(width: 11.sp),
                      Expanded(
                        child: Text(
                          "If you want to join in group you have to login or register into app.",
                          style: AppStyle.regularBlack().copyWith(fontWeight: FontWeight.w300, fontSize: 10.5.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              if (confirmation == true || isGuestUser == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                          color: const Color(0xffF2F2F2),
                          child: Center(
                            child: Text(
                              'Close',
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: isGuestUser == true ? guestOnTap : joinOnTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                          color: Theme.of(context).primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isGuestUser == false) ...[
                                SvgPicture.asset(AppAssets.joinUserIcon),
                                const SizedBox(width: 10),
                              ],
                              Text(
                                isGuestUser == true ? " Sign Up" : 'Join',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                    color: const Color(0xffF2F2F2),
                    child: Center(
                      child: Text(
                        'Close',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  static imagePickerDialog({required BuildContext context, VoidCallback? cameraOnTap, VoidCallback? albumOnTap}) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: AppColors.kPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: defaultPadding * .7),
                child: Center(
                  child: Text(
                    "UPLOAD IMAGE",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.5.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imagePickerOption(
                      "CAMERA",
                      svgIconPath: AppAssets.cameraIcon,
                      onTap: cameraOnTap,
                    ),
                    SizedBox(width: defaultPadding.w / 1.5),
                    imagePickerOption(
                      "ALBUM",
                      svgIconPath: AppAssets.albumIcon,
                      onTap: albumOnTap,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static imagePickerOption(String title, {required String svgIconPath, VoidCallback? onTap}) {
    var defaultBorderSide = BorderSide(color: AppColors.pickImageBorder, width: 1);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 90.sp,
        width: Get.width * 0.238,
        child: Column(children: [
          Container(
            height: 78,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(left: defaultBorderSide, right: defaultBorderSide, top: defaultBorderSide),
            ),
            child: Center(
                child: SizedBox(
              child: SvgPicture.asset(
                svgIconPath,
                width: 22.5.sp,
                height: 22.5.sp,
              ),
            )),
          ),
          Container(
            // height: 24,
            width: Get.width * 0.238,
            color: AppColors.kPrimaryColor,
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Center(
              child: Text(
                title,
                style: AppStyle.regularWhite().copyWith(fontSize: 10.5.sp, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ]),
      ),
    );
  }

  static selectTipTypeDialog(BuildContext context, {required VoidCallback onTap, required String groupTitle, required Widget dialogBody}) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.symmetric(horizontal: defaultPadding.w * 1.5),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: defaultPadding.w, bottom: defaultPadding / 2),
                child: Text(
                  groupTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  dialogBody,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: const Color(0xffF2F2F2),
                            child: Center(
                              child: Text(
                                'Close',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: onTap,
                          splashColor: Colors.transparent,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                            color: Theme.of(context).primaryColor,
                            child: Center(
                              child: Text(
                                'Continue',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static readNotification(BuildContext context, {required String groupTitle, required String groupDec}) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(defaultPadding.w),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(defaultPadding).copyWith(bottom: defaultPadding / 1.5),
                child: Text(
                  groupTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding).copyWith(top: 0),
                      child: Text(
                        groupDec,
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp),
                      )),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: defaultPadding.w - 5),
                      color: const Color(0xffF2F2F2),
                      child: Center(
                        child: Text(
                          'Close',
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget msgArea(title, description, context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: defaultPadding),
                Text(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  description,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(width: defaultPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget footer(context, color, onTap) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        color: Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius / 2),
                border: Border.all(color: color),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: const Text(
                'ના',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: defaultPadding / 2.5),
          InkWell(
            onTap: () => onTap(),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: color),
                borderRadius: BorderRadius.circular(defaultRadius / 2),
                color: color,
              ),
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: const Text(
                'હા',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: defaultPadding / 3),
        ],
      ),
    );
  }*/
}
