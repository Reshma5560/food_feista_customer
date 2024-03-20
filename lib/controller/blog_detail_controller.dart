import 'package:get/get.dart';

import '../data/models/home_data_model.dart';

class BlogDetailController extends GetxController {
  Rx<Blog> blogData = Blog().obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments["blogData"].runtimeType == Blog) {
        blogData.value = Get.arguments["blogData"];
      }
    }
    super.onInit();
  }
}
