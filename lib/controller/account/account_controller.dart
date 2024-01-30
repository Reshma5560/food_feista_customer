import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:get/get.dart';

import '../../data/model/get_profile_model.dart';

class ProfileController extends GetxController {
  RxBool isLoader = false.obs;

  File? selectedProfileImage;
  GetProfileModel? getDataMap;


  @override
  void onReady() {
    DesktopRepository().getProfileApiCall(isLoader: isLoader);
    super.onReady();
  }
}
