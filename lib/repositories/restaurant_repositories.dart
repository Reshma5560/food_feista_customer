import 'package:dio/dio.dart' as dio;
import 'package:foodapplication/controller/restaurant/restaurant_details_controller.dart';
import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:foodapplication/utils/local_storage.dart';
import 'package:get/get.dart';

import '../data/api/api_function.dart';
import '../data/handler/api_url.dart';
import '../data/models/get_review_model.dart';
import '../data/models/restaurant_details_model.dart';
import '../res/color_print.dart';
import '../res/ui_utils.dart';
import '../utils/utils.dart';

class RestaurantRepository {
  Future<dynamic> getRestaurantDetailsApiCall({RxBool? isLoader}) async {
    final con = Get.find<RestaurantDetailsScreenController>();
    try {
      await APIFunction().getApiCall(
        apiName: "${ApiUrls.restaurantDetailsUrl}/${con.restaurantId}",
        queryParameters: {"latitudeTo": LocalStorage.userLat.value, "longitudeTo": LocalStorage.userLong.value},
      ).then(
        (response) async {
          printData(key: "get Restaurant response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            RestaurantDetailModel data = RestaurantDetailModel.fromJson(response);
            con.userOrderCount.value = data.userOrderCount ?? 0;
            con.restaurantDetails = data.data;
            con.cuisineRestaurantList.value = data.data!.cuisineRestaurant!;
            con.restaurantAmenityList.value = data.data!.restaurantAmenities!;
            con.restaurantAmenityList.value = data.data!.restaurantAmenities!;
            con.categoryList.value = data.data?.category ?? [];
            con.restaurantGalleryList.value = data.data!.restaurantGallery!;
          }
          return response;
        },
      );
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
      }
      rethrow;
    } finally {
      con.isLoading.value = false;
    }
  }

  Future<dynamic> getRestaurantReviewApiCall({RxBool? isLoader}) async {
    final con = Get.find<RestaurantDetailsScreenController>();
    try {
      await APIFunction().getApiCall(apiName: "${ApiUrls.restaurantReviewUrl}/${con.restaurantId}").then(
        (response) async {
          printData(key: "get Restaurant response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetReviewModel data = GetReviewModel.fromJson(response);
            con.reviewData = data.data;
            con.restaurantReviewList.value = data.data?.comments ?? [];
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
      con.isLoading.value = false;
    }
  }

  ///ADD CART ITEM API
  Future<dynamic> addRestaurantReviewAPI({dynamic params}) async {
    final RestaurantDetailsScreenController con = Get.find<RestaurantDetailsScreenController>();
    // final CartController con = Get.find<CartController>();
    // final IndexController indexCon = Get.find<IndexController>();
    try {
      con.isLoadingReview.value = true;
      await APIFunction().postApiCall(apiName: ApiUrls.addRestaurantReviewUrl, params: params).then(
        (response) async {
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              Get.back();
              con.commentCon.value.clear();
              await getRestaurantReviewApiCall();
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
      printWhite("REVIEW ADD INTO CART SUCCESS");
    }
  }

  ///ADD CART ITEM API
  Future<dynamic> addToCartItemAPI({dynamic params}) async {
    // final CartController con = Get.find<CartController>();
    // final IndexController indexCon = Get.find<IndexController>();
    try {
      await APIFunction().postApiCall(apiName: ApiUrls.addToCartUrl, params: params).then(
        (response) async {
          printData(key: "add to cart item, response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              await DesktopRepository().getCartAPI();
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
      printError(type: this, errText: "$e");
    } finally {
      printWhite("ITEM ADD INTO CART SUCCESS");
    }
  }

  Future<dynamic> updateCartItemAPI({dynamic params}) async {
    // // final CartController con = Get.find<CartController>();
    // final IndexController indexCon = Get.find<IndexController>();
    try {
      await APIFunction().postApiCall(apiName: ApiUrls.updateCartUrl, params: params).then(
        (response) async {
          printData(key: "update cart item, response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              await DesktopRepository().getCartAPI();
              // indexCon.selectedIndex.value = 3;
              //
              // Get.offNamedUntil(AppRoutes.indexScreen, (route) => route.isFirst);
              // Get.back();
            }
          }
          return response;
        },
      );
    } catch (e) {
      printError(type: this, errText: "$e");
    } finally {
      printWhite("ITEM UPDATE INTO CART SUCCESS");
    }
  }
}
