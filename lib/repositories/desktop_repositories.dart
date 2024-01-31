import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:foodapplication/controller/account/account_controller.dart';
import 'package:foodapplication/controller/account/components/edit_account_controller.dart';
import 'package:foodapplication/controller/account/components/wish_list_controller.dart';
import 'package:foodapplication/controller/my_order_controller.dart';
import 'package:foodapplication/data/api/api_function.dart';
import 'package:foodapplication/data/handler/api_url.dart';
import 'package:foodapplication/data/models/get_order_model.dart';
import 'package:foodapplication/res/color_print.dart';
import 'package:foodapplication/res/ui_utils.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:foodapplication/utils/utils.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../data/models/get_profile_model.dart';
import '../data/models/home_data_model.dart';
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
          printData(key: "get profile  response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetProfileModel data = GetProfileModel.fromJson(response);

            con.getDataMap = data;
            log("${con.getDataMap}");
          }
          return response;
        },
      );
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
      rethrow;
    } finally {
      isLoader?.value = false;
    }
  }

  Future<dynamic> editProfileApiCall({RxBool? isLoader}) async {
    final editAccountController = Get.find<EditAccountController>();
    try {
      isLoader?.value = true;
      dio.FormData formData = dio.FormData.fromMap({
        "first_name": editAccountController.firstNameCon.text.trim(),
        "last_name": editAccountController.lastNameCon.text.trim(),
        "email": editAccountController.emailCon.text.trim(),
        "phone": editAccountController.mobileNumberCon.text.trim(),
        "image": await dio.MultipartFile.fromFile(editAccountController.imagePath.value, filename: editAccountController.name),
      });
      await APIFunction()
          .postApiCall(apiName: ApiUrls.updateUserProfileUrl, params: formData)
          .then(
        (response) async {
          printData(key: "update profile response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
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
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  Future<dynamic> getHomeData() async {
    final HomeController con = Get.find<HomeController>();

    try {
      await APIFunction().getApiCall(apiName: ApiUrls.homeDataUrl).then(
        (response) async {
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
      printError(type: this, errText: "$e");
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
          await APIFunction()
              .getApiCall(
                  apiName: "${ApiUrls.getWishListUrl}?page=${con.page.value}")
              .then(
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
              printData(
                  key: "WISH LIST length", value: con.wishListData.length);
              if (con.wishListData.length == homeTipModel.data?.total) {
                con.nextPageStop.value = false;
              }
              return response;
            },
          );
        }
      }
    } catch (e) {
      printError(type: this, errText: "$e");
    } finally {
      con.isLoading.value = false;
      con.paginationLoading.value = false;
    }
  }

  ///post wish list api
  Future<dynamic> postWishListAPI({required String id, required int index, required bool isWishList}) async {
    try {
      final HomeController homeCom = Get.find<HomeController>();
      await APIFunction().postApiCall(apiName: "${ApiUrls.postWishListUrl}/$id").then(
        (response) async {
          if (!isValEmpty(response["message"])) {
            if (isWishList == true) {
              final WishListController con = Get.find<WishListController>();
              con.wishListData.removeAt(index);

              toast(response["message"].toString());
              await getHomeData();
            } else {
              if (homeCom.restaurantList[index].favorite?.value == 1) {
                homeCom.restaurantList[index].favorite?.value = 0;
              } else {
                homeCom.restaurantList[index].favorite?.value = 1;
              }
            }
          }
          return response;
        },
      );
    } catch (e) {
      printError(type: this, errText: "$e");
    } finally {
      printWhite("WISH LIST SUCCESS");
    }
  }



  //get order details by idlist
  Future<dynamic> getOrderDetailsByIdApiCall({RxBool? isLoader}) async {
    final con = Get.find<MyOrderController>();

    try {
      isLoader?.value = true;
      await APIFunction().getApiCall(apiName: ApiUrls.getOrderListUrl).then(
        (response) async {
          printData(key: "get order detail response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetOrderModel data = GetOrderModel.fromJson(response);

            con.getOrderModel = data;
            log("${con.getOrderModel}");

            con.orderList.addAll(con.getOrderModel.data!);
            log("ORDER LENGTH ${con.orderList.length}");
          }
          return response;
        },
      );
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
      rethrow;
    } finally {
      isLoader?.value = false;
    }
  }
}
