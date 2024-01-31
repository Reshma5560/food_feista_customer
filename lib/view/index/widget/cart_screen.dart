import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/cart_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/widgets/app_bar.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: AppColors.white,
        height: 60,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Obx(() => Expanded(
                  child: Text("\$${cartController.totalAmount.value}"))),
              AppButton(
                width: 100,
                height: 30,
                onPressed: () {},
                title: "Continue",
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        tween: Tween(begin: 20.0, end: 1.0),
        builder: (context, value, child) {
          return AnimatedOpacity(
              opacity: value == 20 ? 0 : 1,
              duration: const Duration(milliseconds: 700),
              child: ListView(children: [
                _appHeader(context),
                const SizedBox(
                  height: 10,
                ),
                _bodyModule(),
                const SizedBox(
                  height: 5,
                ),
              ]));
        },
      ),
    );
  }

  Widget _appHeader(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(defaultRadius * 3),
        bottomRight: Radius.circular(defaultRadius * 3),
      ),
      child: MyAppBar(
        bgColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
        title: "Your Basket",
        centerTitle: true,
        titleStyle: AppStyle.customAppBarTitleStyle()
            .copyWith(color: AppColors.black, fontSize: 14),
        actions: [
          Image.asset(
            AppAssets.scanningIcon,
            height: 20.h,
            width: 20.w,
          ).paddingOnly(right: 15)
        ],
      ),
    );
  }

  Widget _bodyModule() {
    return cartController.cartList.isEmpty
        ? const Center(
            child: Text(
              "Cart is empty",
            ),
          )
        : Column(
            // physics: const AlwaysScrollableScrollPhysics(),
            // shrinkWrap: true,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                    color: AppColors.greyShad1,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.piggyBank,
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                        child:
                            Text("You are Saving Rs 10.0 with this purchase"))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _cartListModule(),
            ],
          ).paddingSymmetric(horizontal: 10);
  }

  Widget _cartListModule() {
    return SizedBox(
      // height: Get.height,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0, bottom: 10),
        itemCount: cartController.cartList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          var item = cartController.cartList[index];
          RxInt itemCount = 1.obs;
          Rx<double?> total = item.price.obs;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: AppColors.greyShad1,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  item.imagePath ?? "",
                  height: 70,
                  width: 70,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor),
                    ),
                    Obx(() => Text(
                          total.value == item.price
                              ? "\$${item.price?.toString()}"
                              : "\$${total.value}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.black),
                        )),
                  ],
                )),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (itemCount.value <= item.quantity!.toInt()) {
                        } else {
                          itemCount--;
                          total.value = (total.value!.toDouble() -
                              item.price!.toDouble());

                          cartController.totalAmount.value =
                              cartController.totalAmount.value -
                                  item.price!.toDouble();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(
                          Icons.remove,
                          size: 13,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Obx(
                      () => Text(
                        itemCount.value.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        itemCount++;

                        total.value =
                            (total.value!.toDouble() + item.price!.toDouble());

                        cartController.totalAmount.value =
                            cartController.totalAmount.value +
                                item.price!.toDouble();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(
                          Icons.add,
                          size: 13,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
