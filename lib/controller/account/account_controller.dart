import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:get/get.dart';

import '../../data/models/get_profile_model.dart';
import '../../utils/local_storage.dart';

class ProfileController extends GetxController {
  RxBool isLoader = false.obs;

  RxString userApiImageFile = "".obs;
  GetProfileModel? getDataMap;

  RxString userName = "".obs;
  RxString phoneNoName = "".obs;
  RxString email = "".obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;

  @override
  void onReady() {
    if (LocalStorage.token.value.isNotEmpty) {
      DesktopRepository().getProfileApiCall(isLoader: isLoader);
    }
    super.onReady();
  }
}
