import 'package:foodapplication/data/models/order_track_model.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:get/get.dart';

class OrderTrackController extends GetxController {
  Rx<OrderTrackModel> orderTrackModel = OrderTrackModel().obs;
  RxBool isLoading = true.obs;
  var orderId = Get.arguments['orderId'];

  @override
  Future<void> onReady() async {
    await DesktopRepository().orderTrackApiCall(orderId: orderId); // "9b3acdb9-facd-48f7-b42b-808a47ee202a");
    super.onReady();
  }
}
