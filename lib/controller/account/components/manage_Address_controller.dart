import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:get/get.dart';

import '../../../data/models/get_address_model.dart';

class ManageAddressController extends GetxController {
  GetAddressModel? getAddressData;
  RxBool isLoader = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    AuthRepository().getAddressApiCall(isLoader: isLoader);
    super.onReady();
  }
}
