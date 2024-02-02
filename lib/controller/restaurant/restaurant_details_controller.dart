import 'package:get/get.dart';

import '../../data/models/restaurant_details_model.dart';
import '../../repositories/restaurant_repositories.dart';

class RestaurantDetailsScreenController extends GetxController {
  String restaurantId = Get.arguments[0];
  String restaurantName = Get.arguments[1];
  RxBool isLoading = true.obs;
  RxInt selectMenu = 0.obs;
  RxBool overviewListVisible = false.obs;
  RxBool photosListVisible = false.obs;

  List<String> menuList = ["ORDER ONLINE", "OVERVIEW", "REVIEW", "PHOTOS"];

  RestaurantDetails? restaurantDetails;
  RxList<CuisineRestaurant> cuisineRestaurantList = <CuisineRestaurant>[].obs;
  RxList<RestaurantAmenity> restaurantAmenityList = <RestaurantAmenity>[].obs;
  RxList<Food> foodList = <Food>[].obs;

  @override
  void onReady() {
    RestaurantRepository().getRestaurantDetailsApiCall();
    super.onReady();
  }
}
