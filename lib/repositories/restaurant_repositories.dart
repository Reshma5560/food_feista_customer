import 'package:dio/dio.dart' as dio;
import 'package:foodapplication/controller/restaurant/restaurant_details_controller.dart';
import 'package:get/get.dart';

import '../data/api/api_function.dart';
import '../data/handler/api_url.dart';
import '../data/models/restaurant_details_model.dart';
import '../res/color_print.dart';
import '../utils/utils.dart';

class RestaurantRepository {
  Future<dynamic> getRestaurantDetailsApiCall({RxBool? isLoader}) async {
    final con = Get.find<RestaurantDetailsScreenController>();
    try {
      await APIFunction()
          .getApiCall(
              apiName: "${ApiUrls.restaurantDetailsUrl}/${con.restaurantId}")
          .then(
        (response) async {
          printData(key: "get Restaurant response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            RestaurantDetailModel data =
                RestaurantDetailModel.fromJson(response);
            con.restaurantDetails = data.data;
            con.cuisineRestaurantList.value = data.data!.cuisineRestaurant!;
            con.restaurantAmenityList.value = data.data!.restaurantAmenities!;
            con.foodList.value = data.data!.foods!;
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
}
