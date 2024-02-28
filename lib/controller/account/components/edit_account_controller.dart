import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  RxString image = "".obs;
  RxBool isLoader = false.obs;
  RxBool isLoading = false.obs;
  RxString imagePath = "".obs;
  File? apiImage;

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
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: Icon(
                Icons.camera_alt_rounded,
                color: AppColors.grey,
                size: 25,
              ),
              title: const Text("Camera"),
              onTap: () {
                Get.back();
                selectImage(pickFromCamera: true);
              },
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: Icon(
                Icons.perm_media_rounded,
                color: AppColors.grey,
                size: 25,
              ),
              title: const Text("Library"),
              onTap: () {
                Get.back();
                selectImage(pickFromCamera: false);
              },
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
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

  String name = '';

  selectImage({bool pickFromCamera = false}) async {
    XFile? pickedImage = await ImagePicker().pickImage(
      source: pickFromCamera == true ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedImage != null) {
      apiImage = File(pickedImage.path);
      printYellow("---------------------  $apiImage");
      imagePath.value = pickedImage.path;
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      image.value = Get.arguments['image'];
      firstNameCon.text = Get.arguments['firstName'];
      lastNameCon.text = Get.arguments['lastName'];
      emailCon.text = Get.arguments['email'] ?? "customer@gmail.com";
      mobileNumberCon.text = Get.arguments['mobileNo'];
    }

    super.onInit();
  }
}
