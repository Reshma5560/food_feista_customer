import 'package:get/get.dart';

import '../utils/local_storage.dart';
import '../utils/utils.dart';

class BaseController extends GetxController {
  RxInt notificationCount = 0.obs;

  @override
  void onInit() {
    initPlatformState().then(
      (value) async {
        await LocalStorage.storeDeviceInfo(
          deviceID: value["device_id"],
          deviceTYPE: value["device_type"],
        );
      },
    );
    super.onInit();
  }
}
