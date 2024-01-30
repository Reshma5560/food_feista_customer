import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:foodapplication/model/get_profile_model.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isLoader = false.obs;

  File? selectedProfileImage;
  GetProfileModel? getDataMap;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    DesktopRepository().getProfileApiCall(isLoader: isLoader);
    super.onReady();
  }
}
