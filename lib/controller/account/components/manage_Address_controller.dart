// ignore_for_file: file_names

import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:get/get.dart';

import '../../../data/models/get_address_model.dart';

class ManageAddressController extends GetxController {
  GetAddressModel? getAddressData;

  RxList<AddressList> addressList = <AddressList>[].obs;
  RxBool isLoader = true.obs;

  @override
  Future<void> onReady() async {
    await AuthRepository().getAddressApiCall();
    super.onReady();
  }
}
