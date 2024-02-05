import 'package:get/get.dart';

import '../../data/models/get_review_model.dart';
import '../../data/models/restaurant_details_model.dart';
import '../../repositories/restaurant_repositories.dart';

class RestaurantDetailsScreenController extends GetxController {
  String restaurantId = Get.arguments[0];
  String restaurantName = Get.arguments[1];
  RxBool isLoading = true.obs;
  RxInt selectMenu = 0.obs;
  RxBool overviewListVisible = false.obs;
  RxBool photosListVisible = false.obs;
  RxBool isOpen = false.obs;
  RxList addonsData = [].obs;
  List variantData = [];
  List variantDataForAPI = [];

  List<String> menuList = ["ORDER ONLINE", "OVERVIEW", "REVIEW", "PHOTOS"];

  ///details
  RestaurantDetails? restaurantDetails;
  RxList<CuisineRestaurant> cuisineRestaurantList = <CuisineRestaurant>[].obs;
  RxList<RestaurantAmenity> restaurantAmenityList = <RestaurantAmenity>[].obs;
  RxList<Gallery> restaurantGalleryList = <Gallery>[].obs;
  RxList<CategoryFood> categoryList = <CategoryFood>[].obs;

  ///review
  ReviewData? reviewData;
  RxList<ReviewComment> restaurantReviewList = <ReviewComment>[].obs;

  @override
  void onReady() async {
    await RestaurantRepository().getRestaurantDetailsApiCall();
    await RestaurantRepository().getRestaurantReviewApiCall();
    super.onReady();
  }
}
