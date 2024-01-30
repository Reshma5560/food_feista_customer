import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EditAccountController extends GetxController {
  TextEditingController mobileNumberCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController firstNameCon = TextEditingController();

  TextEditingController lastNameCon = TextEditingController();

  RxBool firstNameValidation = false.obs;
  RxBool lastNameValidation = false.obs;
  RxBool emailValidation = false.obs;
  RxString mobileError = "".obs;
  RxString firstNameError = ''.obs;
  RxString lastNameError = ''.obs;
  RxString emailError = ''.obs;
  RxBool isMobileValid = false.obs;

  RxBool isLoader = false.obs;
  RxBool isLoading = false.obs;
  File? selectedProfileImage;

  showImagePickerBottomSheet() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: Get.context!,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
                  child: Text(
                    "Albums",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: Icon(
                Icons.camera_alt_rounded,
                color: AppColors.grey,
                size: 25,
              ),
              title: const Text("Camera"),
              onTap: () {
                Get.back();
                getImageFromCamera();
              },
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: Icon(
                Icons.perm_media_rounded,
                color: AppColors.grey,
                size: 25,
              ),
              title: const Text("Library"),
              onTap: () {
                Get.back();
                getImageFromGallery();
              },
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: Icon(
                Icons.close,
                color: AppColors.grey,
                size: 25,
              ),
              title: const Text("Cancel"),
              onTap: () {
                Get.back();
              },
            ),
          ]);
        });
  }
String name='';
  // Get from gallery
  getImageFromGallery() async {
    isLoading(true);
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      selectedProfileImage = File(pickedFile.path);
       name= basename(pickedFile.path);
    }
    isLoading(false);
  }

  //Get from Camera
  getImageFromCamera() async {
    isLoading(true);
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      selectedProfileImage = File(pickedFile.path);

      log("Image pathg ${selectedProfileImage?.path}");
    }
    isLoading(false);
  }

  @override
  void onInit() {
    emailCon.text = "customer@gmail.com";
    super.onInit();
  }
}
