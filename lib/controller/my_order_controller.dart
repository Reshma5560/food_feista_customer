import 'package:foodapplication/data/models/get_order_model.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  GetOrderModel getOrderModel = GetOrderModel();

  RxList<OrderList> orderList = <OrderList>[].obs;RxBool isLoading=false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await DesktopRepository().getOrderApiCall(isLoader: isLoading);
    super.onReady();
  }
}
