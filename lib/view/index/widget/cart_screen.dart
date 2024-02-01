import 'package:flutter/material.dart';
import 'package:foodapplication/controller/cart_controller.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/widgets/app_bar.dart';
import 'package:foodapplication/res/widgets/empty_element.dart';
import 'package:get/get.dart';

import '../../../packages/cached_network_image/cached_network_image.dart';
import '../../../res/app_strings.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartController con = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        tween: Tween(begin: 20.0, end: 1.0),
        builder: (context, value, child) {
          return AnimatedOpacity(
            opacity: value == 20 ? 0 : 1,
            duration: const Duration(milliseconds: 700),
            child: Column(
              // padding: EdgeInsets.zero,
              children: [
                _appHeader(context),
                Expanded(
                  child: Obx(
                    () => con.isLoading.isFalse
                        ? con.cartItemData.isNotEmpty
                            ? ListView.builder(
                                padding: const EdgeInsets.only(top: 0, bottom: 10),
                                itemCount: con.cartItemData.length,
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  var item = con.cartItemData[index];
                                  RxInt itemCount = 1.obs;
                                  Rx<double?> total = double.parse(item.price ?? "0").obs;

                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: defaultPadding - 6),
                                    decoration: BoxDecoration(color: AppColors.greyShad1, borderRadius: BorderRadius.circular(15)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: MFNetworkImage(
                                            backgroundColor: Colors.grey,
                                            imageUrl: item.food?.image ?? "",
                                            fit: BoxFit.cover,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(defaultRadius),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.food?.foodName ?? "",
                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Theme.of(context).primaryColor),
                                              ),
                                              Obx(
                                                () => Text(
                                                  total.value == double.parse(item.price ?? "0") ? "\$${item.price?.toString()}" : "\$${total.value}",
                                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (itemCount.value < item.quantity!.toInt()) {
                                                } else {
                                                  itemCount--;
                                                  total.value = (total.value!.toDouble() - double.parse(item.price ?? "0"));

                                                  con.totalAmount.value = con.totalAmount.value - double.parse(item.price ?? "0");
                                                }
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.all(7),
                                                decoration:
                                                    BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(25)),
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

                                                total.value = (total.value!.toDouble() + double.parse(item.price ?? "0"));

                                                con.totalAmount.value = con.totalAmount.value + double.parse(item.price ?? "0");
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.all(7),
                                                decoration:
                                                    BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(25)),
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
                              )
                            : EmptyElement(
                                height: Get.height / 1.8,
                                imageHeight: Get.width / 2.4,
                                imageWidth: Get.width / 2,
                                spacing: 0,
                                title: AppStrings.wishListNotFoundTitle,
                                subtitle: AppStrings.wishListNotFoundSubtitle,
                              )
                        : const AppLoader(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Obx(
        () => con.cartItemData.isNotEmpty
            ? BottomAppBar(
                surfaceTintColor: AppColors.white,
                height: 60,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(child: Text("${con.totalAmount.value}")),
                      AppButton(
                        width: 100,
                        height: 30,
                        onPressed: () {},
                        title: "Continue",
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
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
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
        title: "Cart",
        centerTitle: true,
        titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: Colors.black),
      ),
    );
  }
}
