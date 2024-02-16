import 'package:foodapplication/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../res/color_print.dart';

class Prefs {
  static const String token = "TOKEN";
  static const String userId = "USER_ID";
  static const String roleSlags = "ROLE_SLAGS";
  static const String firstName = "FIRST_NAME";
  static const String lastName = "LAST_NAME";
  static const String mobileNumber = "MOBILE_NUMBER";
  static const String role = "ROLE";
  static const String userImage = "USER_IMAGE";
  static const String isUserActive = "USER_ACTIVE";
  static const String isUserVerify = "USER_VERIFY";
  static const String isUserCity = "USER_CITY";

  static const String userEmail = "USER_EMAIL";
  static const String userPassword = "USER_PASSWORD";
  static const String rememberMe = "REMEMBER_ME";

  static const String deviceId = "DEVICE_ID";
  static const String deviceType = "DEVICE_TYPE";
  static const String deviceFCMToken = "DEVICE_FCM_TOKEN";
}

class LocalStorage {
  static GetStorage prefs = GetStorage();

  static RxString token = "".obs;
  static RxString email = "".obs;
  static RxString password = "".obs;
  static RxBool isRemember = false.obs;
  static RxString userId = "".obs;
  static RxString roleSlags = "".obs;
  static RxString firstName = "".obs;
  static RxString lastName = "".obs;
  static RxString userImage = "".obs;
  static RxString userCity = "".obs;
  static RxInt mobileNumber = 0.obs;
  static RxBool isUserActive = false.obs;
  static RxBool isUserVerify = false.obs;

  static RxString deviceId = "".obs;
  static RxString deviceToken = "".obs;
  static RxString deviceType = "".obs;

  static Future storeDataInfo({required Map<String, dynamic> data}) async {
    prefs.write(Prefs.userId, data['id'] ?? "");
    prefs.write(Prefs.firstName, data['first_name'] ?? "");
    prefs.write(Prefs.lastName, data['last_name'] ?? "");
    prefs.write(Prefs.userImage, data['image'] ?? "");
    prefs.write(Prefs.mobileNumber, data['phone'] ?? "");
    prefs.write(Prefs.mobileNumber, data['phone'] ?? "");
    prefs.write(Prefs.isUserActive, data['is_active'] == 0 ? false : true);
    prefs.write(Prefs.isUserVerify, data['is_verified'] == 0 ? false : true);

    userId.value = prefs.read(Prefs.userId) ?? "";
    roleSlags.value = prefs.read(Prefs.roleSlags) ?? "";
    firstName.value = prefs.read(Prefs.firstName) ?? "";
    lastName.value = prefs.read(Prefs.lastName) ?? "";
    userImage.value = prefs.read(Prefs.userImage) ?? "";
    mobileNumber.value = int.parse("${prefs.read(Prefs.mobileNumber) ?? 0}");
    isUserActive.value = prefs.read(Prefs.isUserActive) ?? false;
    isUserVerify.value = prefs.read(Prefs.isUserVerify) ?? false;
  }

  // static Future updateOrStoreLikes({required Map<String, dynamic> linkObject}) async {
  //   //! Don't clear any links in local storage
  //   await prefs.write(Prefs.privacyPolicyLink, linkObject["privacy_policy"] ?? "");
  //   await prefs.write(Prefs.termsAndConditionsLink, linkObject["terms_and_conditions"] ?? "");
  //   await prefs.write(Prefs.faqLink, linkObject["faq"] ?? "");
  //   await prefs.write(Prefs.aboutUsLink, linkObject["about_us"] ?? "");
  //   await prefs.write(Prefs.playStoreLink, linkObject["play_store"] ?? "");
  //   await prefs.write(Prefs.appStoreLink, linkObject["app_store"] ?? "");
  //
  //   privacyPolicyLink.value = prefs.read(Prefs.privacyPolicyLink) ?? "";
  //   termsAndConditionsLink.value = prefs.read(Prefs.termsAndConditionsLink) ?? "";
  //   faqLink.value = prefs.read(Prefs.faqLink) ?? "";
  //   aboutUsLink.value = prefs.read(Prefs.aboutUsLink) ?? "";
  //   playStoreLink.value = prefs.read(Prefs.playStoreLink) ?? "";
  //   appStoreLink.value = prefs.read(Prefs.appStoreLink) ?? "";
  // }

  static Future<void> setLoginInfo({required String userEmail, required String userPassword, required bool remember}) async {
    await prefs.write(Prefs.userEmail, userEmail.isNotEmpty ? userEmail : email);
    await prefs.write(Prefs.userPassword, userPassword.isNotEmpty ? userPassword : password);
    await prefs.write(Prefs.rememberMe, remember);
    email.value = prefs.read(Prefs.userEmail) ?? "";
    password.value = prefs.read(Prefs.userPassword) ?? "";
    isRemember.value = prefs.read(Prefs.rememberMe) ?? false;

    printData(key: "User EMAIL", value: LocalStorage.email.value);
    printData(key: "User PASSWORD", value: LocalStorage.password.value);
  }

  static Future<void> setLoginToken({required String userToken}) async {
    await prefs.write(Prefs.token, userToken.isNotEmpty ? userToken : token);
    token.value = prefs.read(Prefs.token) ?? "";
  }

  static Future<void> setCity({required String city}) async {
    await prefs.write(Prefs.isUserCity, city.isNotEmpty ? city : userCity);
    userCity.value = prefs.read(Prefs.isUserCity) ?? "";
  }

  /// Store device info
  static Future<void> storeDeviceInfo({
    String? deviceID,
    String? deviceTOKEN,
    String? deviceTYPE,
  }) async {
    if (!isValEmpty(deviceID)) {
      await prefs.write(Prefs.deviceId, deviceID);
      deviceId.value = prefs.read(Prefs.deviceId) ?? "";
    }

    if (!isValEmpty(deviceTOKEN)) {
      await prefs.write(Prefs.deviceFCMToken, deviceTOKEN);
      deviceToken.value = prefs.read(Prefs.deviceFCMToken) ?? "";
    }

    if (!isValEmpty(deviceTYPE)) {
      await prefs.write(Prefs.deviceType, deviceTYPE);
      deviceType.value = prefs.read(Prefs.deviceType) ?? "";
    }
  }

  static Future<void> clearLocalStorage({bool clearDeviceData = false}) async {
    await prefs.erase();
    token = "".obs;
    userId = "".obs;
    roleSlags = "".obs;
    firstName = "".obs;
    lastName = "".obs;
    userImage = "".obs;
    userCity = "".obs;
    mobileNumber = 0.obs;
    isUserActive = false.obs;
    isUserVerify = false.obs;

    if (isRemember.isFalse) {
      email.value = "";
      password.value = "";
      isRemember.value = false;
    }

    // isGuestUser = true.obs;
    // showPreview = true.obs;
    // likeConcept = true.obs;
    //
    // if (clearDeviceData == true) {
    //   deviceId = "".obs;
    //   deviceToken = "".obs;
    //   deviceType = "".obs;
    // }
  }

  static Future<void> readDataInfo() async {
    token.value = prefs.read(Prefs.token) ?? "";
    userId.value = prefs.read(Prefs.userId) ?? "";
    roleSlags.value = prefs.read(Prefs.roleSlags) ?? "";
    firstName.value = prefs.read(Prefs.firstName) ?? "";
    lastName.value = prefs.read(Prefs.lastName) ?? "";
    userImage.value = prefs.read(Prefs.userImage) ?? "";
    mobileNumber.value = int.parse("${prefs.read(Prefs.mobileNumber) ?? 0}");
    isUserActive.value = prefs.read(Prefs.isUserActive) ?? false;
    isUserVerify.value = prefs.read(Prefs.isUserVerify) ?? false;
    userCity.value = prefs.read(Prefs.isUserCity) ?? "";
    email.value = prefs.read(Prefs.userEmail) ?? "";
    password.value = prefs.read(Prefs.userPassword) ?? "";
    isRemember.value = prefs.read(Prefs.rememberMe) ?? false;
    // isGuestUser.value = prefs.read(Prefs.isGuestUser) ?? true;
    // showPreview.value = prefs.read(Prefs.showPreview) ?? true;
    // likeConcept.value = prefs.read(Prefs.likeConcept) ?? true;

    deviceId.value = prefs.read(Prefs.deviceId) ?? "";
    deviceToken.value = prefs.read(Prefs.deviceFCMToken) ?? "";
    deviceType.value = prefs.read(Prefs.deviceType) ?? "";

    // privacyPolicyLink.value = prefs.read(Prefs.privacyPolicyLink) ?? "";
    // termsAndConditionsLink.value = prefs.read(Prefs.termsAndConditionsLink) ?? "";
    // faqLink.value = prefs.read(Prefs.faqLink) ?? "";
    // aboutUsLink.value = prefs.read(Prefs.aboutUsLink) ?? "";
    // playStoreLink.value = prefs.read(Prefs.playStoreLink) ?? "";
    // appStoreLink.value = prefs.read(Prefs.appStoreLink) ?? "";
    printLocalStorageData();
  }

  static Future<void> printLocalStorageData() async {
    printData(key: "Device Id", value: LocalStorage.deviceId.value);
    printData(key: "Device Token", value: LocalStorage.deviceToken.value);
    printData(key: "User access token", value: LocalStorage.token.value);
    printData(key: "User userId", value: LocalStorage.userId.value);
    printData(key: "User roleSlags", value: LocalStorage.roleSlags);
    printData(key: "User firstName", value: LocalStorage.firstName.value);
    printData(key: "User lastName", value: LocalStorage.lastName.value);
    printData(key: "User userImage", value: LocalStorage.userImage.value);
    printData(key: "User mobileNumber", value: LocalStorage.mobileNumber.value);
    printData(key: "User isUserActive", value: LocalStorage.isUserActive.value);
    printData(key: "User isUserVerify", value: LocalStorage.isUserVerify.value);
    printData(key: "User CITY", value: LocalStorage.userCity.value);
    printData(key: "User EMAIL", value: LocalStorage.email.value);
    printData(key: "User PASSWORD", value: LocalStorage.password.value);
  }
}
