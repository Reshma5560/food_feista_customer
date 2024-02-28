import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:foodapplication/controller/account/account_controller.dart';
import 'package:foodapplication/controller/account/components/wish_list_controller.dart';
import 'package:foodapplication/controller/cart_controller.dart';
import 'package:foodapplication/controller/my_order_controller.dart';
import 'package:foodapplication/controller/order_tracker_controller.dart';
import 'package:foodapplication/controller/search_screen_controller.dart';
import 'package:foodapplication/data/api/api_function.dart';
import 'package:foodapplication/data/handler/api_url.dart';
import 'package:foodapplication/data/models/get_order_model.dart';
import 'package:foodapplication/data/models/order_track_model.dart';
import 'package:foodapplication/res/app_dialog.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:foodapplication/utils/local_storage.dart';
import 'package:foodapplication/utils/utils.dart';
import 'package:get/get.dart';

import '../controller/category_list_controller.dart';
import '../controller/home_controller.dart';
import '../controller/restaurant_list_controller.dart';
import '../data/models/category__list_model.dart';
import '../data/models/get_cart_data_model.dart';
import '../data/models/get_cuisine_model.dart';
import '../data/models/get_cupon_model.dart';
import '../data/models/get_food_item_data_model.dart';
import '../data/models/get_profile_model.dart';
import '../data/models/home_data_model.dart';
import '../data/models/restaurant_list_model.dart';
import '../data/models/search_item_data_model.dart';
import '../data/models/wish_list_data_model.dart';

class DesktopRepository {
  // Future<dynamic> logOutApiCall({RxBool? isLoader}) async {
  //   try {
  //     isLoader?.value = true;
  //     await APIFunction().postApiCall(apiName: ApiUrls.logoutUrl).then(
  //       (response) async {
  //         printData(key: "logout response", value: response);
  //         if (!isValEmpty(response) && response["success"] == true) {
  //           if (!isValEmpty(response["message"])) {
  //             toast(response["message"].toString());
  //             Get.back();
  //             Get.offAllNamed(AppRoutes.loginScreen);
  //           }
  //         }
  //         return response;
  //       },
  //     );
  //   } on DioException catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       printWarning(e.response?.statusCode);
  //       printError(type: this, errText: "$e");
  //     }
  //   } finally {
  //     isLoader?.value = false;
  //   }
  // }

  Future<dynamic> getProfileApiCall({RxBool? isLoader}) async {
    final con = Get.find<ProfileController>();

    try {
      isLoader?.value = true;
      await APIFunction().getApiCall(apiName: ApiUrls.getProfileUrl).then(
        (response) async {
          // printData(key: "get profile  response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetProfileModel data = GetProfileModel.fromJson(response);

            con.getDataMap = data;
            con.userApiImageFile.value = con.getDataMap?.data?.image ?? "";

            printYellow("-------------  ${con.getDataMap?.data?.image}");

            con.userName.value = "${con.getDataMap?.data?.firstName} ${con.getDataMap?.data?.lastName}";
            con.phoneNoName.value = con.getDataMap?.data?.phone ?? "";
            con.firstName.value = con.getDataMap?.data?.firstName ?? "";
            con.lastName.value = con.getDataMap?.data?.lastName ?? "";
            con.email.value = con.getDataMap?.data?.email ?? "";
          }
          return response;
        },
      );
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: "getProfileApiCall", errText: "$e");
      }
      rethrow;
    } finally {
      isLoader?.value = false;
    }
  }

  Future<dynamic> editProfileApiCall({RxBool? isLoader, dynamic data}) async {
    // final EditAccountController con = Get.find<EditAccountController>();
    try {
      isLoader?.value = true;
      printYellow(data);
      dio.FormData formData = dio.FormData.fromMap(data);
      await APIFunction().postApiCall(apiName: ApiUrls.updateUserProfileUrl, params: formData).then(
        (response) async {
          printData(key: "update profile response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              await getProfileApiCall();
              Get.back();
              Get.offNamed(AppRoutes.indexScreen);
            }
          }
          return response;
        },
      );
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: "editProfileApiCall", errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  Future<dynamic> getHomeData() async {
    final HomeController con = Get.find<HomeController>();

    try {
      await APIFunction().getApiCall(
        apiName: "${ApiUrls.homeDataUrl}/${LocalStorage.userCity.value}",
        queryParameters: {"latitudeTo": LocalStorage.userLat, "longitudeTo": LocalStorage.userLong},
      ).then(
        (response) async {
          printData(key: "HOME DATA RESPONSE ", value: response);
          HomeDataModel homeDataModel = HomeDataModel.fromJson(response);
          if (homeDataModel.status == true) {
            ///banner list
            con.bannerList.clear();
            con.bannerList.value = homeDataModel.banner ?? [];

            ///category List
            con.categoryList.clear();
            con.categoryList.value = homeDataModel.categories ?? [];

            ///Restaurant List
            con.restaurantList.clear();
            con.restaurantList.value = homeDataModel.restaurant ?? [];

            ///Blog List
            con.blogList.clear();
            con.blogList.value = homeDataModel.blogs ?? [];

            ///trendingFood List
            con.trendingFoodList.clear();
            con.trendingFoodList.value = homeDataModel.trendingFoods ?? [];
          }
        },
      );
    } catch (e) {
      printError(type: "getHomeData", errText: "$e");
    } finally {
      con.isLoading.value = false;
    }
  }

  ///get wish list api
  Future<dynamic> getWishListAPI({required bool isInitial}) async {
    final WishListController con = Get.find<WishListController>();
    try {
      if (await getConnectivityResult()) {
        if (isInitial) {
          con.wishListData.clear();
          con.page.value = 1;
          con.isLoading.value = true;
          con.nextPageStop.value = true;
        }

        if (con.nextPageStop.isTrue) {
          await APIFunction().getApiCall(apiName: "${ApiUrls.getWishListUrl}?page=${con.page.value}").then(
            (response) async {
              GetWishListDataModel homeTipModel = GetWishListDataModel.fromJson(response);

              homeTipModel.data?.data?.forEach((element) {
                log("-------------${element.restaurant}");
                log("-------------${element.restaurant != null}");
                if (element.restaurant != null) {
                  con.wishListData.add(element.restaurant!);
                }
              });

              con.page.value++;
              printData(key: "WISH LIST length", value: con.wishListData.length);
              if (con.wishListData.length == homeTipModel.data?.total) {
                con.nextPageStop.value = false;
              }
              return response;
            },
          );
        }
      }
    } catch (e) {
      printError(type: "getWishListAPI", errText: "$e");
    } finally {
      con.isLoading.value = false;
      con.paginationLoading.value = false;
    }
  }

  ///post wish list api
  Future<dynamic> postWishListAPI({required String id, required int index, required bool isWishList}) async {
    try {
      final HomeController homeCon = Get.find<HomeController>();
      await APIFunction().postApiCall(apiName: "${ApiUrls.postWishListUrl}/$id").then(
        (response) async {
          if (!isValEmpty(response["message"])) {
            if (isWishList == true) {
              final WishListController con = Get.find<WishListController>();
              con.wishListData.removeAt(index);

              toast(response["message"].toString());
              await getHomeData();
            } else {
              if (homeCon.restaurantList[index].favorite?.value == 1) {
                homeCon.restaurantList[index].favorite?.value = 0;
              } else {
                homeCon.restaurantList[index].favorite?.value = 1;
              }
            }
          }
          return response;
        },
      );
    } catch (e) {
      printError(type: "postWishListAPI", errText: "$e");
    } finally {
      printWhite("WISH LIST SUCCESS");
    }
  }

  ///post wish list api
  Future<dynamic> postWishListAPIForRestaurant({required String id, required int index, required bool isWishList}) async {
    try {
      final RestaurantListController restCon = Get.find<RestaurantListController>();
      await APIFunction().postApiCall(apiName: "${ApiUrls.postWishListUrl}/$id").then(
        (response) async {
          if (!isValEmpty(response["message"])) {
            if (isWishList == true) {
              final WishListController con = Get.find<WishListController>();
              con.wishListData.removeAt(index);

              toast(response["message"].toString());
              await getHomeData();
            } else {
              if (restCon.restaurantList[index].favorite?.value == 1) {
                restCon.restaurantList[index].favorite?.value = 0;
              } else {
                restCon.restaurantList[index].favorite?.value = 1;
              }
            }
          }
          return response;
        },
      );
    } catch (e) {
      printError(type: "postWishListAPI", errText: "$e");
    } finally {
      printWhite("WISH LIST SUCCESS");
    }
  }

  //order track api call
  Future<dynamic> orderTrackApiCall({required String orderId}) async {
    final OrderTrackController con = Get.find<OrderTrackController>();

    try {
      await APIFunction().getApiCall(apiName: "${ApiUrls.orderTrackUrl}/$orderId").then(
        (response) async {
          printData(key: "order track response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            OrderTrackModel data = OrderTrackModel.fromJson(response);

            con.orderTrackModel.value = data;

            Timer.periodic(
              const Duration(milliseconds: 50),
              (timer) {
                DateTime now = DateTime.parse(DateTime.now().toIso8601String());
                Duration difference = now.difference(con.orderTrackModel.value.data?.createdAt ?? DateTime.now().toLocal());
                if (difference.inMinutes < 1) {
                  con.isCanceled.value = true;
                } else {
                  con.isCanceled.value = false;
                  timer.cancel();
                }
              },
            );
          }
          return response;
        },
      );
    } catch (e) {
      printError(type: "orderTrackApiCall", errText: "$e");
    } finally {
      con.isLoading.value = false;
      // con.paginationLoading.value = false;
    }
  }

  ///ADD CART ITEM API
  Future<dynamic> addOrderReviewAPI({dynamic params}) async {
    final OrderTrackController con = Get.find<OrderTrackController>();
    // final CartController con = Get.find<CartController>();
    // final IndexController indexCon = Get.find<IndexController>();
    try {
      con.isLoadingReview.value = true;
      await APIFunction().postApiCall(apiName: ApiUrls.addOrderReviewUrl, params: params).then(
        (response) async {
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              Get.back();
              con.commentCon.value.clear();
              await orderTrackApiCall(orderId: con.orderId);
              // indexCon.selectedIndex.value = 3;
              //
              // Get.offNamedUntil(AppRoutes.indexScreen, (route) => route.isFirst);
              // Get.back();
            }
          }
          if (!isValEmpty(response) && response["status"] == false) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
            }
          }

          return response;
        },
      );
    } catch (e) {
      con.isLoadingReview.value = false;
      printError(type: this, errText: "$e");
    } finally {
      con.isLoadingReview.value = false;
      printWhite("REVIEW ADD INTO ORDER SUCCESS");
    }
  }

  ///get order list
  Future<dynamic> getOrderApiCall() async {
    final MyOrderController con = Get.find<MyOrderController>();
    con.isLoading.value = true;
    try {
      await APIFunction().getApiCall(apiName: ApiUrls.getOrderListUrl).then(
        (response) async {
          printData(key: "get order  response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetOrderModel data = GetOrderModel.fromJson(response);

            con.getOrderModel = data;

            con.orderList.addAll(con.getOrderModel.data!);
          }
          return response;
        },
      );
    } catch (e) {
      printError(type: "getOrderApiCall", errText: "$e");
    } finally {
      con.isLoading.value = false;
      // con.paginationLoading.value = false;
    }
  }

  ///get wish list api
  Future<dynamic> getCartAPI() async {
    final CartController con = Get.find<CartController>();
    try {
      con.isLoading.value = true;
      await APIFunction().getApiCall(apiName: ApiUrls.getCartUrl).then(
        (response) async {
          printData(key: "RESPONSE ", value: response);
          GetCartDataModel cartDataModel = GetCartDataModel.fromJson(response);
          con.cartData.value = cartDataModel;
          con.cartItemData.value = cartDataModel.data?.cartDetails ?? [];

          if (con.cartData.value.data?.restaurantId != null) {
            await DesktopRepository().getCouponItemAPI(id: con.cartData.value.data?.restaurantId ?? "");
          }

          if (con.cartItemData.isNotEmpty) {
            con.totalAmount.value = 0;
            for (var i = 0; i < con.cartItemData.length; i++) {
              con.cartItemData[i].totalPrice?.value = double.parse(con.cartItemData[i].subtotal ?? "0");
              con.totalAmount.value = con.totalAmount.value + double.parse(con.cartItemData[i].subtotal ?? "0");

              printData(key: "TOTAL ", value: con.totalAmount.value);
            }
          }
          printData(key: "CART LIST length", value: con.cartItemData.length);

          return response;
        },
      );
    } catch (e) {
      printError(type: "getCartAPI", errText: "$e");
    } finally {
      con.isLoading.value = false;
      // con.paginationLoading.value = false;
    }
  }

  ///get wish list api
  Future<dynamic> getSearchItemAPI() async {
    final SearchScreenController con = Get.find<SearchScreenController>();
    try {
      await APIFunction().getApiCall(apiName: "${ApiUrls.searchUrl}?value=${con.searchCon.value.text.trim()}").then(
        (response) async {
          GetSearchDataModel searchModel = GetSearchDataModel.fromJson(response);
          con.searchItemData.value = searchModel.data ?? [];

          printData(key: "SEARCH LIST length", value: con.searchItemData.length);

          return response;
        },
      );
    } catch (e) {
      printError(type: "getSearchItemAPI", errText: "$e");
    } finally {
      con.isLoading.value = false;
    }
  }

  ///get wish list api
  Future<dynamic> getFoodItemDataAPI({required String id}) async {
    final CartController con = Get.find<CartController>();
    try {
      await APIFunction().getApiCall(apiName: "${ApiUrls.getFoodDataUrl}/$id").then(
        (response) async {
          GetFoodItemDataModel searchModel = GetFoodItemDataModel.fromJson(response);
          con.foodItemAddonData.value = searchModel.data?.addons ?? [];
          printData(key: "foodItemAddonData length", value: con.foodItemAddonData.length);
          con.foodItemVariantData.value = searchModel.data?.foodVariant ?? [];

          printData(key: "foodItemVariantData length", value: con.foodItemVariantData.length);

          return response;
        },
      );
    } catch (e) {
      printError(type: "getFoodItemDataAPI", errText: "$e");
    } finally {
      con.isLoading.value = false;
    }
  }

  ///DELETE CART ITEM API
  Future<dynamic> deleteCartItemAPI({required String id, required int index}) async {
    final CartController con = Get.find<CartController>();
    try {
      await APIFunction().deleteApiCall(apiName: "${ApiUrls.deleteFoodItemUrl}/$id").then(
        (response) async {
          printData(key: "remove cart item, response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              con.totalAmount.value - double.parse(con.cartItemData[index].totalPrice?.value.toString() ?? "0.0");
              await getCartAPI();
              toast(response["message"].toString());
            }
          }
          return response;
        },
      );
    } catch (e) {
      printError(type: "deleteCartItemAPI", errText: "$e");
    } finally {
      con.isLoading.value = false;
    }
  }

  ///DELETE CART ITEM API
  Future<dynamic> deleteCartAPI({required String id}) async {
    final CartController con = Get.find<CartController>();
    try {
      await APIFunction().deleteApiCall(apiName: "${ApiUrls.deleteCartUrl}/$id").then(
        (response) async {
          printData(key: "delete cart response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              Get.back();
              con.cartItemData.clear();
              con.couponItemData.clear();
              toast(response["message"].toString());
            }
          }
          return response;
        },
      );
    } catch (e) {
      printError(type: "deleteCartAPI", errText: "$e");
    } finally {
      con.isLoading.value = false;
    }
  }

  ///get wish list api
  Future<dynamic> getCouponItemAPI({required String id}) async {
    final CartController con = Get.find<CartController>();
    try {
      await APIFunction().getApiCall(apiName: "${ApiUrls.applyCouponUrl}/$id").then(
        (response) async {
          GetCouponModel data = GetCouponModel.fromJson(response);
          con.couponItemData.value = data.data ?? [];

          printData(key: "COUPON LIST length", value: con.couponItemData.length);

          return response;
        },
      );
    } catch (e) {
      printError(type: "getCouponItemAPI", errText: "$e");
    } finally {
      con.isLoading.value = false;
    }
  }

  ///create order
  Future<dynamic> createOrderApiCall({RxBool? isLoader, required dynamic params}) async {
    try {
      isLoader?.value = true;
      // dio.FormData formData = dio.FormData.fromMap({
      //   "first_name": editAccountController.firstNameCon.text.trim(),
      //   "last_name": editAccountController.lastNameCon.text.trim(),
      //   "email": editAccountController.emailCon.text.trim(),
      //   "phone": editAccountController.mobileNumberCon.text.trim(),
      //   "image": await dio.MultipartFile.fromFile(editAccountController.imagePath.value, filename: editAccountController.imagePath.value),
      // });
      printYellow(json.encode(params));

      await APIFunction().postApiCall(apiName: ApiUrls.placeOrderUrl, params: params).then(
        (response) async {
          printData(key: "place order response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              printYellow("-----------------  ${response["data"]["invoice_number"]}");
              // toast(response["message"].toString());
              AppDialogs.successItemDialog(
                Get.context!,
                deleteOnTap: () {
                  Get.offAllNamed(AppRoutes.indexScreen);
                },
                orderID: response["data"]["invoice_number"].toString(),
              );

              // await getProfileApiCall();
              // Get.back();
            }
          } else {
            if (!isValEmpty(response) && response["status"] == false) {
              if (!isValEmpty(response["error"])) {
                toast(response["error"].toString());
              }
            }
          }
          return response;
        },
      );
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: "createOrderApiCall", errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  ///get category list api
  Future<dynamic> getCategoryListAPI({required bool isInitial}) async {
    final CategoryListController con = Get.find<CategoryListController>();
    try {
      if (await getConnectivityResult()) {
        if (isInitial) {
          con.categoryList.clear();
          con.page.value = 1;
          con.isLoading.value = true;
          con.nextPageStop.value = true;
        }

        if (con.nextPageStop.isTrue) {
          await APIFunction().getApiCall(apiName: "${ApiUrls.categoryListUrl}?page=${con.page.value}?per_page=40").then(
            (response) async {
              CategoryListModel homeTipModel = CategoryListModel.fromJson(response);
              con.categoryList.value += homeTipModel.data?.data ?? [];
              con.page.value++;
              printData(key: "WISH LIST length", value: con.categoryList.length);
              if (con.categoryList.length == homeTipModel.data?.total) {
                con.nextPageStop.value = false;
              }
              return response;
            },
          );
        }
      }
    } catch (e) {
      printError(type: "getCategoryListAPI", errText: "$e");
    } finally {
      con.isLoading.value = false;
      con.paginationLoading.value = false;
    }
  }

  ///get restaurant list api
  Future<dynamic> getRestaurantListAPI({required bool isInitial, String? categoryID}) async {
    final RestaurantListController con = Get.find<RestaurantListController>();
    try {
      if (await getConnectivityResult()) {
        if (isInitial) {
          con.restaurantList.clear();
          con.page.value = 1;
          con.isLoading.value = true;
          con.nextPageStop.value = true;
        }
        if (con.nextPageStop.isTrue) {
          await APIFunction().postApiCall(
            apiName: "${ApiUrls.restaurantListUrl}/${LocalStorage.userCity.value}",
            params: {
              "cuisine_id": con.selectedChoice,
              "veg": con.selectVeg.value,
              "non_veg": con.selectNonVeg.value,
              "pure_veg": con.selectPureVeg.value,
              "latitudeTo": LocalStorage.userLat.value,
              "longitudeTo": LocalStorage.userLong.value,
              "distance": con.isNearByMe.value,
            },
            queryParameters: {
              "page": con.page.value,
              "per_page": 20,
              "category_id": categoryID,
            },
          ).then(
            (response) async {
              RestaurantListModel restaurantListDataModel = RestaurantListModel.fromJson(response);
              con.restaurantList.value += restaurantListDataModel.data?.data ?? [];
              con.page.value++;
              printData(key: "RESTAURANT LIST length", value: con.restaurantList.length);
              if (con.restaurantList.length == restaurantListDataModel.data?.total) {
                con.nextPageStop.value = false;
              }
              return response;
            },
          );
        }
      }
    } catch (e) {
      printError(type: "getRestaurantListAPI", errText: "$e");
    } finally {
      con.isLoading.value = false;
      con.paginationLoading.value = false;
    }
  }

  //get cuisine list api call
  Future<dynamic> getCuisineApiCall({RxBool? isLoader}) async {
    final RestaurantListController con = Get.find<RestaurantListController>();

    try {
      isLoader?.value = true;
      await APIFunction().getApiCall(apiName: ApiUrls.getCuisineUrl).then(
        (response) async {
          printData(key: "get cuisine response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetCuisineModel getCuisineData = GetCuisineModel.fromJson(response);

            if (getCuisineData.data != null) {
              // con.getCuisineListData.value = data;
              for (var element in getCuisineData.data!) {
                con.getCuisineListData.add(element);
              }
            }
          }

          return response;
        },
      );
    } catch (e) {
      printError(type: "getRestaurantListAPI", errText: "$e");
    } finally {
      isLoader?.value = false;
    }
  }
}
