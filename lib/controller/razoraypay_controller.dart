import 'package:foodapplication/controller/place_order_controller.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_web/razorpay_web.dart';

import '../repositories/desktop_repositories.dart';

class RazorpayController extends GetxController {
  final PlaceOrderController con = Get.find<PlaceOrderController>();
  RxString paymentId = "".obs;

  // RxBool isLoader = false.obs;
  Razorpay razorpay = Razorpay();

  @override
  void onInit() {
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, errorHandler);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, successHandler);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletHandler);
    super.onInit();
  }

  void errorHandler(PaymentFailureResponse response) {
    // Display a red-colored SnackBar with the error message
    toast(response.message!);

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(response.message!),
    //   backgroundColor: Colors.red,
    // ));
  }

  Future<void> successHandler(PaymentSuccessResponse response) async {
    // Display a green-colored SnackBar with the payment ID
    toast(response.paymentId!);
    paymentId.value = response.paymentId ?? "";

    printYellow(
        "--------- addressId:${con.addressId.value}  cart_id:${con.cartId.value}  coupon_id:${con.couponId.value}  payment_type_name:${con.paymentType.value}   payment_id:${paymentId.value}");

    await DesktopRepository().createOrderApiCall(
      isLoader: con.isLoader,
      params: {
        "address_id": con.addressId.value,
        "cart_id": con.cartId.value,
        "coupon_id": con.couponId.value,
        "payment_type_name": con.paymentType.value,
        "payment_id": paymentId.value,
        "order_note": con.noteCon.value.text.trim(),
      },
    );

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(response.paymentId!),
    //   backgroundColor: Colors.green,
    // ));
  }

  void externalWalletHandler(ExternalWalletResponse response) {
    // Display a green-colored SnackBar with the name of the external wallet used
    toast(response.walletName!);
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(response.walletName!),
    //   backgroundColor: Colors.green,
    // ));
  }

  void openCheckout({required String amount}) {
    var options = {
      "key": "rzp_test_SKiFT7q0YGHaUv",
      "amount": num.parse(amount) * 100,
      "name": "test",
      "description": " this is the test payment",
      "timeout": "180",
      "currency": "INR",
      "prefill": {
        "contact": "11111111111",
        "email": "test@abc.com",
      }
    };
    razorpay.open(options);
  }
}
