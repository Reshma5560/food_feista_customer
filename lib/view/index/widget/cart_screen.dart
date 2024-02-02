import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/cart_controller.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:foodapplication/res/widgets/app_bar.dart';
import 'package:foodapplication/res/widgets/empty_element.dart';
import 'package:get/get.dart';

import '../../../data/models/get_cart_data_model.dart';
import '../../../packages/cached_network_image/cached_network_image.dart';
import '../../../repositories/desktop_repositories.dart';
import '../../../res/app_dialog.dart';
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
              // physics: const NeverScrollableScrollPhysics(),
              // padding: EdgeInsets.zero,
              children: [
                _appHeader(context),
                Expanded(
                  child: Obx(
                    () => con.isLoading.isFalse
                        ? con.cartItemData.isNotEmpty
                            ? RefreshIndicator(
                                onRefresh: () async {
                                  con.totalAmount.value = 0.0;
                                  await DesktopRepository().getCartAPI();
                                },
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: defaultPadding - 6,
                                    );
                                  },
                                  padding: const EdgeInsets.only(top: 10, bottom: 0),
                                  itemCount: con.cartItemData.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    var item = con.cartItemData[index];

                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: defaultPadding - 6),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        boxShadow: AppStyle.boxShadow(),
                                        borderRadius: BorderRadius.circular(defaultRadius),
                                      ),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: MFNetworkImage(
                                              height: 100,
                                              // backgroundColor: Colors.grey,
                                              imageUrl: item.food?.image ?? "",
                                              fit: BoxFit.cover,
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(defaultRadius),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.all(defaultPadding - 6),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        item.food?.foodName ?? "",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w600, fontSize: 20, color: Theme.of(context).primaryColor),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment.topRight,
                                                            child: InkWell(
                                                              onTap: () async {
                                                                if (con.isOpen.isFalse) {
                                                                  con.isOpen.value = true;

                                                                  await DesktopRepository().getFoodItemDataAPI(id: item.foodId ?? "").then((value) {
                                                                    _editItem(context, data: item);
                                                                  });
                                                                }
                                                              },
                                                              child: Icon(
                                                                Icons.edit,
                                                                color: Theme.of(context).primaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Align(
                                                            alignment: Alignment.topRight,
                                                            child: InkWell(
                                                              onTap: () async {
                                                                AppDialogs.deleteCartItemDialog(
                                                                  context,
                                                                  deleteOnTap: () async {
                                                                    Get.back();
                                                                    await DesktopRepository().deleteCartItemAPI(id: item.id ?? "", index: index);
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(
                                                                Icons.delete_outlined,
                                                                color: Theme.of(context).primaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: defaultPadding - 6,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Obx(
                                                        () => Text(
                                                          item.totalPrice?.value == double.parse(item.price ?? "0")
                                                              ? "₹${item.price?.toString()}"
                                                              : "₹${item.totalPrice?.value}",
                                                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.black),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              if (item.itemCount!.value < item.quantity!.toInt()) {
                                                              } else {
                                                                item.itemCount?.value--;
                                                                item.totalPrice?.value = (item.totalPrice!.value - double.parse(item.price ?? "0"));

                                                                con.totalAmount.value = con.totalAmount.value - double.parse(item.price ?? "0");
                                                              }
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                  color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(25)),
                                                              child: Icon(
                                                                Icons.remove,
                                                                size: 15,
                                                                color: AppColors.white,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Obx(
                                                            () => Text(
                                                              item.itemCount?.value.toString() ?? "",
                                                              style: const TextStyle(fontWeight: FontWeight.w700),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              if (item.itemCount!.value >= item.food!.maximumCartQuantity!.toInt()) {
                                                              } else {
                                                                // itemCount++;
                                                                item.itemCount?.value++;
                                                                item.totalPrice?.value = (item.totalPrice!.value + double.parse(item.price ?? "0"));

                                                                con.totalAmount.value = con.totalAmount.value + double.parse(item.price ?? "0");
                                                              }
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                  color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(25)),
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 15,
                                                                color: AppColors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : RefreshIndicator(
                                onRefresh: () async {
                                  con.totalAmount.value = 0.0;
                                  await DesktopRepository().getCartAPI();
                                },
                                child: ListView(
                                  children: [
                                    EmptyElement(
                                      height: Get.height / 1.8,
                                      imageHeight: Get.width / 2.4,
                                      imageWidth: Get.width / 2,
                                      spacing: 0,
                                      title: AppStrings.wishListNotFoundTitle,
                                      subtitle: AppStrings.wishListNotFoundSubtitle,
                                    ),
                                  ],
                                ),
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
            ? Container(
                height: 60,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: AppStyle.boxShadow(
                    offset: const Offset(0, -2),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "₹${con.totalAmount.value}",
                        style: AppStyle.authTitleStyle().copyWith(fontSize: 24, color: AppColors.black),
                      ),
                    ),
                    AppButton(
                      width: 100,
                      height: 30,
                      onPressed: () {},
                      title: "Continue",
                    )
                  ],
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
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_outlined,
        //     color: Colors.transparent,
        //   ),
        //   onPressed: () {},
        // ),
        title: "Cart",
        centerTitle: true,
        titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: Colors.black),
        actions: [
          Obx(
            () => con.cartItemData.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      AppDialogs.deleteCartDialog(
                        context,
                        deleteOnTap: () async {
                          await DesktopRepository().deleteCartAPI(id: con.cartData.value.data?.id ?? "");
                        },
                      );
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  _editItem(BuildContext context, {required CartDetail data}) {
    return Get.bottomSheet(
      isDismissible: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius * 3),
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultRadius * 3),
            topRight: Radius.circular(defaultRadius * 3),
          ),
        ),
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding).copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.food?.foodName ?? "",
                      style: AppStyle.authTitleStyle().copyWith(fontSize: 24, color: AppColors.black),
                    ),
                    InkWell(
                      onTap: () {
                        con.isOpen.value = false;
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        color: AppColors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPadding - 6,
              ),
              Container(
                height: 1,
                width: Get.width,
                color: AppColors.black,
              ),
              const SizedBox(
                height: defaultPadding - 6,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      con.foodItemVariantData.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                              child: Column(
                                children: List.generate(
                                  con.foodItemVariantData.length,
                                  (index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          con.foodItemVariantData[index].variationName ?? "",
                                          style: AppStyle.authTitleStyle().copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: defaultPadding - 6,
                                        ),
                                        Column(
                                          children: List.generate(
                                            con.foodItemVariantData[index].foodVariantOption?.length ?? 0,
                                            (index1) {
                                              var data = con.foodItemVariantData[index].foodVariantOption?[index1];
                                              return Padding(
                                                padding: const EdgeInsets.only(right: defaultPadding - 6),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(bottom: defaultPadding),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          data?.variationOptionName ?? "",
                                                          style: AppStyle.authTitleStyle().copyWith(
                                                            fontSize: 15,
                                                            color: AppColors.black,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 15,
                                                          width: 15,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                                            // color: Theme.of(context).primaryColor,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(1.5),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: Theme.of(context).primaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: defaultPadding - 6,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      con.foodItemAddonData.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "AddOns",
                                    style: AppStyle.authTitleStyle().copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Column(
                                    children: List.generate(
                                      con.foodItemAddonData.length,
                                      (index) {
                                        var data = con.foodItemAddonData[index];
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data.addonName ?? "",
                                              style: AppStyle.authTitleStyle().copyWith(
                                                fontSize: 15,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Obx(
                                              () => Transform.scale(
                                                scale: 0.7,
                                                child: Checkbox(
                                                  value: data.isActive?.value == 1 ? true : false,
                                                  onChanged: (value) {
                                                    if (data.isActive?.value == 1) {
                                                      data.isActive?.value = 0;
                                                      printWhite(data.isActive?.value);
                                                    } else {
                                                      data.isActive?.value = 1;
                                                      printWhite(data.isActive?.value);
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: AppStyle.boxShadow(
                            offset: const Offset(0, -4),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "₹${data.price.toString()}",
                                  style: AppStyle.authTitleStyle().copyWith(fontSize: 24, color: AppColors.black),
                                ),
                              ),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
