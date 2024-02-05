import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:get/get.dart';

class ApplyCouponController extends GetxController {
  RxBool isLoading = true.obs;

  @override
  Future<void> onReady() async {
    await DesktopRepository().getCouponItemAPI(id: "");
    super.onReady();
  }
}
