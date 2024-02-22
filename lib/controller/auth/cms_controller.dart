import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:get/get.dart';

import '../../data/models/cms_page_model.dart';

class CmsController extends GetxController {
  RxBool isLoading = true.obs;

  Rx<CmsDatum> aboutUsData = CmsDatum().obs;
  Rx<CmsDatum> termsAndConditionsData = CmsDatum().obs;
  Rx<CmsDatum> privacyPolicyData = CmsDatum().obs;

  @override
  Future<void> onReady() async {
    await AuthRepository().getCmsApiCall();
    super.onReady();
  }
}
