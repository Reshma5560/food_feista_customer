import 'package:flutter/material.dart';
import 'package:foodapplication/model/food_list_model.dart';
import 'package:foodapplication/model/image_title_model.dart';
import 'package:get/get.dart';

import '../model/home_data_model.dart';
import '../repositories/desktop_repositories.dart';

class HomeController extends GetxController {
  TextEditingController searchCon = TextEditingController();
  RxInt selectSellType = 0.obs;
  RxBool isLoading = true.obs;
  RxInt activeSliderIndex = 0.obs;

  RxList<BannerData> bannerList = <BannerData>[].obs;
  RxList<Category> categoryList = <Category>[].obs;
  RxList<Restaurant> restaurantList = <Restaurant>[].obs;
  RxList<Blog> blogList = <Blog>[].obs;
  RxList<TrendingFood> trendingFoodList = <TrendingFood>[].obs;


  List<FoodListModel> foodList = [
    FoodListModel(
        id: 1,
        imagePath: "assets/images/category6.png",
        title: "Hot Dog",
        descripton: "This is hot dog description",
        price: 15.00,
        type: "Regular",
        qty: "150gms"),
    FoodListModel(
        id: 2,
        imagePath: "assets/images/category2.png",
        title: "Tacos",
        descripton: "This is tacos description",
        price: 120.00,
        type: "Regular",
        qty: "150gms")
  ];

  List<String> sellingTypeList = [
    "Recent Selling",
    "Top Selling",
    "Whats New",
    "Deal Products"
  ];

  @override
  void onReady() {
    DesktopRepository().getHomeData();
    super.onReady();
  }
}
