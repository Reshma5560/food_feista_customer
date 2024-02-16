import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/cart_controller.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:foodapplication/res/widgets/app_bar.dart';
import 'package:foodapplication/res/widgets/empty_element.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../../../data/models/get_cart_data_model.dart';
import '../../../packages/cached_network_image/cached_network_image.dart';
import '../../../repositories/desktop_repositories.dart';
import '../../../res/app_dialog.dart';
import '../../../res/app_strings.dart';
import '../../../res/color_print.dart';

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
                  child: RefreshIndicator(
                    onRefresh: () async {
                      con.totalAmount.value = 0.0;
                      con.couponDiscount.value = 0;
                      con.selectedIndex.value = (-1);
                      await DesktopRepository().getCartAPI();
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Obx(
                            () => con.isLoading.isFalse
                                ? con.cartItemData.isNotEmpty
                                    ? ListView.separated(
                                        physics: const NeverScrollableScrollPhysics(),
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
                                                                if (item.variantIds!.isNotEmpty || item.addonIds!.isNotEmpty)
                                                                  Align(
                                                                    alignment: Alignment.topRight,
                                                                    child: InkWell(
                                                                      onTap: () async {
                                                                        if (con.isOpen.isFalse) {
                                                                          con.isOpen.value = true;

                                                                          // _addItem(context, item: item);

                                                                          if (item.variantIds!.isNotEmpty || item.addonIds!.isNotEmpty) {
                                                                            await DesktopRepository().getFoodItemDataAPI(id: item.foodId ?? "").then(
                                                                              (value) {
                                                                                _addItem(context, item: item);
                                                                              },
                                                                            );
                                                                          }
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
                                                                      if (con.cartItemData.length == 1) {
                                                                        AppDialogs.deleteCartDialog(
                                                                          context,
                                                                          deleteOnTap: () async {
                                                                            await DesktopRepository()
                                                                                .deleteCartAPI(id: con.cartData.value.data?.id ?? "");
                                                                          },
                                                                        );
                                                                      } else {
                                                                        AppDialogs.deleteCartItemDialog(
                                                                          context,
                                                                          deleteOnTap: () async {
                                                                            Get.back();
                                                                            await DesktopRepository()
                                                                                .deleteCartItemAPI(id: item.id ?? "", index: index);
                                                                          },
                                                                        );
                                                                      }
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
                                                                    if (item.itemCount!.value == 1) {
                                                                    } else {
                                                                      item.itemCount?.value--;
                                                                      item.totalPrice?.value =
                                                                          (item.totalPrice!.value - double.parse(item.price ?? "0"));

                                                                      con.totalAmount.value = con.totalAmount.value - double.parse(item.price ?? "0");
                                                                    }
                                                                  },
                                                                  child: Container(
                                                                    padding: const EdgeInsets.all(8),
                                                                    decoration: BoxDecoration(
                                                                        color: Theme.of(context).primaryColor,
                                                                        borderRadius: BorderRadius.circular(25)),
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
                                                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
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
                                                                      item.totalPrice?.value =
                                                                          (item.totalPrice!.value + double.parse(item.price ?? "0"));

                                                                      con.totalAmount.value = con.totalAmount.value + double.parse(item.price ?? "0");
                                                                    }
                                                                  },
                                                                  child: Container(
                                                                    padding: const EdgeInsets.all(8),
                                                                    decoration: BoxDecoration(
                                                                        color: Theme.of(context).primaryColor,
                                                                        borderRadius: BorderRadius.circular(25)),
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
                                      )
                                    : EmptyElement(
                                        height: Get.height / 1.8,
                                        imageHeight: Get.width / 2.4,
                                        imageWidth: Get.width / 2,
                                        spacing: 0,
                                        title: AppStrings.cartNotFoundTitle,
                                        subtitle: AppStrings.cartListNotFoundSubtitle,
                                      )
                                : const AppLoader(),
                          ),
                          Obx(
                            () => SizedBox(
                              height: con.cartItemData.length <= 2 ? Get.height / 5 : defaultPadding - 6,
                            ),
                          ),
                          // Obx(
                          //   () => con.cartItemData.isNotEmpty
                          //       ? Padding(
                          //           padding: const EdgeInsets.symmetric(horizontal: defaultPadding - 6).copyWith(top: defaultPadding),
                          //           child: AppTextField(
                          //             hintText: "Enter Coupon Code",
                          //             hintStyle: TextStyle(
                          //               color: Theme.of(context).primaryColor.withOpacity(0.5),
                          //             ),
                          //             readOnly: true,
                          //             enabled: false,
                          //             controller: con.couponController.value,
                          //             fillColor: Theme.of(context).colorScheme.background,
                          //             suffixIcon: Padding(
                          //               padding: const EdgeInsets.all(8),
                          //               child: AppButton(
                          //                 width: 100,
                          //                 height: 40,
                          //                 title: "APPLY",
                          //                 onPressed: () {},
                          //               ),
                          //             ),
                          //           ),
                          //         )
                          //       : const SizedBox.shrink(),
                          // ),

                          Obx(
                            () => con.couponItemData.isNotEmpty
                                ? ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          if (con.totalAmount.value <= con.couponItemData[index].minPurchase!) {
                                            toast("Your order must be more then ₹${con.couponItemData[index].minPurchase}");
                                          } else {
                                            con.totalAmount.value = con.totalAmount.value + con.couponItemData[index].maxDiscount!;
                                            con.couponDiscount.value = con.couponItemData[index].maxDiscount!;
                                            con.selectedIndex.value = index;
                                            con.couponId.value = con.couponItemData[index].id ?? "";
                                            con.totalAmount.value = con.totalAmount.value - con.couponItemData[index].maxDiscount!;
                                            log("-------- ${con.totalAmount.value}");
                                          }
                                        },
                                        child: Obx(
                                          () => Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).colorScheme.background,
                                              borderRadius: BorderRadius.circular(defaultRadius),
                                              border: con.selectedIndex.value == index ? Border.all(color: Theme.of(context).primaryColor) : null,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      con.couponItemData[index].code ?? "",
                                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.black),
                                                    ),
                                                    Text(
                                                      "Discount : ${con.couponItemData[index].maxDiscount ?? ""}",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: AppColors.black.withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                con.selectedIndex.value == index
                                                    ? Container(
                                                        height: 15,
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                          color: Theme.of(context).primaryColor,
                                                          shape: BoxShape.circle,
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: defaultPadding - 6,
                                      );
                                    },
                                    itemCount: con.couponItemData.length,
                                  )
                                : const SizedBox.shrink(),
                          ),

                          Obx(
                            () => con.cartItemData.isNotEmpty
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding - 6,
                                      vertical: defaultPadding - 6,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding,
                                      vertical: defaultPadding,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.background,
                                      borderRadius: BorderRadius.circular(defaultRadius),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Order Total".toUpperCase(),
                                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                                            ),
                                            Obx(
                                              () => Text(
                                                "₹${con.totalAmount.value}",
                                                style: AppStyle.authTitleStyle().copyWith(fontSize: 14.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: defaultPadding - 10,
                                        ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       "Delivery Fee".toUpperCase(),
                                        //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                                        //     ),
                                        //     Text(
                                        //       "₹ 00",
                                        //       style: AppStyle.authTitleStyle().copyWith(fontSize: 14.sp),
                                        //     ),
                                        //   ],
                                        // ),
                                        // const SizedBox(
                                        //   height: defaultPadding - 10,
                                        // ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Coupon Discount".toUpperCase(),
                                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                                            ),
                                            Obx(
                                              () => Text(
                                                "₹ ${con.couponDiscount.value}",
                                                style: AppStyle.authTitleStyle().copyWith(fontSize: 14.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: defaultPadding - 10,
                                        ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       "Tax & charges".toUpperCase(),
                                        //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                                        //     ),
                                        //     Text(
                                        //       "₹ 00",
                                        //       style: AppStyle.authTitleStyle().copyWith(fontSize: 14.sp),
                                        //     ),
                                        //   ],
                                        // ),
                                        // const SizedBox(
                                        //   height: defaultPadding - 10,
                                        // ),
                                        Divider(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        const SizedBox(
                                          height: defaultPadding - 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Payable amount".toUpperCase(),
                                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "₹ ${con.totalAmount.value}",
                                              style: AppStyle.authTitleStyle().copyWith(fontSize: 15.sp),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                          Obx(
                            () => con.cartItemData.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(defaultPadding - 6).copyWith(bottom: 20),
                                    child: AppButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          AppRoutes.placeOrderScreen,
                                          arguments: {
                                            "cart_id": con.cartData.value.data?.id,
                                            "coupon_id": con.couponId.value,
                                          },
                                        );
                                      },
                                      title: "Process To Checkout".toUpperCase(),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
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

  _addItem(BuildContext context, {required CartDetail item}) {
    // final CartDataController cartDataController = Get.find<CartDataController>();

    // item.totalPrice?.value = double.parse(item.price.toString()) * item.itemCount!.value;

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
                      item.food?.foodName ?? "",
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
                      if (con.foodItemVariantData.isNotEmpty)
                        Padding(
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

                                          if (item.variantIds != null) {
                                            for (int i = 0; i < item.variantIds!.length; i++) {
                                              if (item.variantIds![i] == data?.id.toString()) {
                                                con.foodItemVariantData[index].isSelected?.value = index1;
                                                if (index1 == con.foodItemVariantData[index].isSelected?.value) {
                                                  con.variantData.add(
                                                    {"id": con.foodItemVariantData[index].id, "food_variation_id": data?.id, "price": data?.price},
                                                  );
                                                  // item.totalPrice?.value = (item.totalPrice!.value + double.parse(data?.price ?? "0"));
                                                  con.variantDataForAPI.add(data?.id);
                                                  con.variantData.take(2);
                                                  printWhite("------------------$i   ${con.variantData}");
                                                  printWhite("------------------   ${con.variantDataForAPI}");
                                                }
                                              }
                                            }

                                            // item.variantIds?.forEach((element) {
                                            //   // printWhite("------------------1   $element");
                                            //   // printWhite("------------------2   ${data?.id}");
                                            //   if (element == data?.id.toString()) {
                                            //     con.variantData.add(
                                            //       {"id": con.foodItemVariantData[index].id, "food_variation_id": data?.id, "price": data?.price},
                                            //     );
                                            //     con.variantDataForAPI.add(data?.id);
                                            //     con.variantData.take(2);
                                            //   }
                                            // });
                                          }

                                          return Padding(
                                            padding: const EdgeInsets.only(right: defaultPadding - 6),
                                            child: Obx(
                                              () => InkWell(
                                                onTap: () {
                                                  con.foodItemVariantData[index].isSelected?.value = index1;

                                                  if (index1 == con.foodItemVariantData[index].isSelected?.value) {
                                                    if (con.variantData.isNotEmpty) {
                                                      bool idExists = con.variantData.any((element) => element['id'] == data?.foodVariationId);
                                                      int selIndex = con.variantData.indexWhere((element) => element["id"] == data?.foodVariationId);

                                                      printWhite("--------0----------   $idExists");
                                                      printWhite("--------1----------   $selIndex");

                                                      if (idExists == false) {
                                                        con.variantData.add(
                                                          {
                                                            "id": con.foodItemVariantData[index].id,
                                                            "food_variation_id": data?.id,
                                                            "price": data?.price
                                                          },
                                                        );
                                                        item.totalPrice?.value = (item.totalPrice!.value + double.parse(data?.price ?? "0"));
                                                        con.variantDataForAPI.add(data?.id);
                                                        printWhite("------------------   ${con.variantData}");
                                                        printWhite("--------2----------   ${con.variantDataForAPI}");
                                                      } else {
                                                        item.totalPrice?.value =
                                                            (item.totalPrice!.value - double.parse(con.variantData[selIndex]["price"] ?? "0"));
                                                        con.variantData.removeAt(selIndex);

                                                        con.variantDataForAPI.removeAt(selIndex);
                                                        item.totalPrice?.value = (item.totalPrice!.value + double.parse(data?.price ?? "0"));
                                                        con.variantData.insert(
                                                          selIndex,
                                                          {
                                                            "id": con.foodItemVariantData[index].id,
                                                            "food_variation_id": data?.id,
                                                            "price": data?.price
                                                          },
                                                        );
                                                        con.variantDataForAPI.add(data?.id);
                                                        printWhite("------------------   ${con.variantData}");
                                                        printWhite("--------3----------   ${con.variantDataForAPI}");
                                                      }
                                                    } /*else {
                                                      con.variantData.add(
                                                        {"id": item.foodVariant?[index].id, "food_variation_id": data?.id, "price": data?.price},
                                                      );
                                                      item.totalPrice?.value = (item.totalPrice!.value + double.parse(data?.price ?? "0"));
                                                      con.variantDataForAPI.add(data?.id);
                                                      con.variantData.take(2);
                                                      printWhite("------------------   ${con.variantData}");
                                                      printWhite("------------------   ${con.variantDataForAPI}");
                                                    }*/
                                                  }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom: defaultPadding),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${data?.variationOptionName ?? " "} (${data?.price ?? "0"})",
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
                                                          border: Border.all(
                                                            color: (index1 == con.foodItemVariantData[index].isSelected?.value)
                                                                ? Theme.of(context).primaryColor
                                                                : AppColors.black,
                                                            width: 2,
                                                          ),
                                                          // color: Theme.of(context).primaryColor,
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(1.5),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: (index1 == con.foodItemVariantData[index].isSelected?.value)
                                                                  ? Theme.of(context).primaryColor
                                                                  : AppColors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                      else
                        const SizedBox.shrink(),
                      // (item.addons != null && item.addons!.isNotEmpty)
                      //     ? Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "AddOns",
                      //         style: AppStyle.authTitleStyle().copyWith(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //       Column(
                      //         children: List.generate(
                      //           item.addons!.length,
                      //               (index) {
                      //             var data = item.addons![index];
                      //             return Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text(
                      //                   "${data.addonName ?? " "}(${data.price ?? "0"})",
                      //                   style: AppStyle.authTitleStyle().copyWith(
                      //                     fontSize: 15,
                      //                     color: AppColors.black,
                      //                     fontWeight: FontWeight.w500,
                      //                   ),
                      //                 ),
                      //                 Obx(
                      //                       () => Transform.scale(
                      //                     scale: 0.7,
                      //                     child: Checkbox(
                      //                       value: data.isSelected?.value,
                      //                       onChanged: (value) {
                      //                         data.isSelected?.value = !data.isSelected!.value;
                      //
                      //                         if (data.isSelected?.value == true) {
                      //                           con.addonsData.add(data.id);
                      //                           item.totalPrice?.value = (item.totalPrice!.value + double.parse(data.price.toString()));
                      //                           printWhite(con.addonsData);
                      //                         } else {
                      //                           if (con.addonsData.contains(data.id)) {
                      //                             con.addonsData.remove(data.id);
                      //                             item.totalPrice?.value = (item.totalPrice!.value - double.parse(data.price.toString()));
                      //                             printWhite(con.addonsData);
                      //                           }
                      //                         }
                      //                       },
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // )
                      //     : const SizedBox.shrink(),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: AppStyle.boxShadow(
                    offset: const Offset(0, -4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding - 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                        if (item.itemCount!.value == 1) {
                                        } else {
                                          item.itemCount?.value--;
                                          item.totalPrice?.value = (item.totalPrice!.value - double.parse(item.price ?? "0"));

                                          con.totalAmount.value = con.totalAmount.value - double.parse(item.price ?? "0");
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(25)),
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
                                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
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
                                        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(25)),
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
                            Expanded(
                              child: Obx(
                                () => Text(
                                  "₹${item.totalPrice.toString()}",
                                  style: AppStyle.authTitleStyle().copyWith(fontSize: 24, color: AppColors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // AppButton(
                      //   width: 100,
                      //   height: 30,
                      //   onPressed: () async {
                      //     await RestaurantRepository().addToCartItemAPI(
                      //       params: {
                      //         "restaurant_id": con.restaurantDetails?.id ?? "",
                      //         "food_id": item.id ?? "",
                      //         "total_price": item.totalPrice?.value.toString() ?? "",
                      //         "total_qty": item.itemCount?.value.toString() ?? "",
                      //         "variant_options": con.variantDataForAPI,
                      //         "addons": con.addonsData,
                      //       },
                      //     );
                      //     Get.back();
                      //   },
                      //   title: "Add to cart",
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).whenComplete(() {
      con.variantData.clear();
      con.variantDataForAPI.clear();
    });
  }

// _editItem(BuildContext context, {required CartDetail data}) {
//   return Get.bottomSheet(
//     isDismissible: false,
//     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(defaultRadius * 3),
//     ),
//     Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(defaultRadius * 3),
//           topRight: Radius.circular(defaultRadius * 3),
//         ),
//       ),
//       width: Get.width,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: defaultPadding).copyWith(bottom: 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     data.food?.foodName ?? "",
//                     style: AppStyle.authTitleStyle().copyWith(fontSize: 24, color: AppColors.black),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       con.isOpen.value = false;
//                       Get.back();
//                     },
//                     child: Icon(
//                       Icons.close,
//                       color: AppColors.black,
//                       size: 24,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: defaultPadding - 6,
//             ),
//             Container(
//               height: 1,
//               width: Get.width,
//               color: AppColors.black,
//             ),
//             const SizedBox(
//               height: defaultPadding - 6,
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     con.foodItemVariantData.isNotEmpty
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//                             child: Column(
//                               children: List.generate(
//                                 con.foodItemVariantData.length,
//                                 (index) {
//                                   return Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         con.foodItemVariantData[index].variationName ?? "",
//                                         style: AppStyle.authTitleStyle().copyWith(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: defaultPadding - 6,
//                                       ),
//                                       Column(
//                                         children: List.generate(
//                                           con.foodItemVariantData[index].foodVariantOption?.length ?? 0,
//                                           (index1) {
//                                             var variantData = con.foodItemVariantData[index].foodVariantOption?[index1];
//                                             return Padding(
//                                               padding: const EdgeInsets.only(right: defaultPadding - 6),
//                                               child: InkWell(
//                                                 onTap: () {},
//                                                 child: Padding(
//                                                   padding: const EdgeInsets.only(bottom: defaultPadding),
//                                                   child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     children: [
//                                                       Text(
//                                                         variantData?.variationOptionName ?? "",
//                                                         style: AppStyle.authTitleStyle().copyWith(
//                                                           fontSize: 15,
//                                                           color: AppColors.black,
//                                                           fontWeight: FontWeight.w500,
//                                                         ),
//                                                       ),
//                                                       Container(
//                                                         height: 15,
//                                                         width: 15,
//                                                         decoration: BoxDecoration(
//                                                           shape: BoxShape.circle,
//                                                           border: Border.all(color: Theme.of(context).primaryColor, width: 2),
//                                                           // color: Theme.of(context).primaryColor,
//                                                         ),
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.all(1.5),
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                               shape: BoxShape.circle,
//                                                               color: Theme.of(context).primaryColor,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: defaultPadding - 6,
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
//                           )
//                         : const SizedBox.shrink(),
//                     con.foodItemAddonData.isNotEmpty
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "AddOns",
//                                   style: AppStyle.authTitleStyle().copyWith(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Column(
//                                   children: List.generate(
//                                     con.foodItemAddonData.length,
//                                     (index) {
//                                       var addonsData = con.foodItemAddonData[index];
//                                       return Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "${addonsData.addonName ?? " "}(${addonsData.price ?? "0"})",
//                                             style: AppStyle.authTitleStyle().copyWith(
//                                               fontSize: 15,
//                                               color: AppColors.black,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           Obx(
//                                             () => Transform.scale(
//                                               scale: 0.7,
//                                               child: Checkbox(
//                                                 value: addonsData.isSelected?.value,
//                                                 onChanged: (value) {
//                                                   addonsData.isSelected?.value = !addonsData.isSelected!.value;
//                                                   if (addonsData.isSelected?.value == true) {
//                                                     // data.totalPrice?.value = (data.totalPrice!.value + double.parse(data.price ?? "0"));
//
//                                                     con.totalAmount.value = con.totalAmount.value + double.parse(addonsData.price.toString());
//                                                     data.totalPrice?.value = (data.totalPrice!.value + double.parse(addonsData.price.toString()));
//                                                     // printWhite(con.addonsData);
//                                                   } else {
//                                                     data.totalPrice?.value = (data.totalPrice!.value - double.parse(addonsData.price.toString()));
//                                                   }
//                                                   // if (data.isActive?.value == 1) {
//                                                   //   data.isActive?.value = 0;
//                                                   //   printWhite(data.isActive?.value);
//                                                   // } else {
//                                                   //   data.isActive?.value = 1;
//                                                   //   printWhite(data.isActive?.value);
//                                                   // }
//                                                 },
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : const SizedBox.shrink(),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: 60,
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 boxShadow: AppStyle.boxShadow(
//                   offset: const Offset(0, -4),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "₹${data.price.toString()}",
//                         style: AppStyle.authTitleStyle().copyWith(fontSize: 24, color: AppColors.black),
//                       ),
//                     ),
//                     AppButton(
//                       width: 100,
//                       height: 30,
//                       onPressed: () {},
//                       title: "Continue",
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
}
