import 'package:foodapplication/data/models/get_order_model.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:get/get.dart';

import '../utils/local_storage.dart';

class MyOrderController extends GetxController {
  GetOrderModel getOrderModel = GetOrderModel();

  RxList<OrderList> orderList = <OrderList>[].obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onReady() async {
    if (LocalStorage.token.value.isNotEmpty) {
      await DesktopRepository().getOrderApiCall();
    }
    super.onReady();
  }
}
