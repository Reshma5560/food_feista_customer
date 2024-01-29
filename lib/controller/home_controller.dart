import 'package:flutter/material.dart';
import 'package:foodapplication/model/food_list_model.dart';
import 'package:foodapplication/model/image_title_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchCon = TextEditingController();
  RxInt selectSellType = 0.obs;

  List<ImageTitleModel> categoryList = [
    ImageTitleModel(
        id: 1, imagePath: "assets/images/category1.png", title: "Pizza"),
    ImageTitleModel(
        id: 2, imagePath: "assets/images/category2.png", title: "Tacos"),
    ImageTitleModel(
        id: 3, imagePath: "assets/images/category3.png", title: "Burger"),
    ImageTitleModel(
        id: 4, imagePath: "assets/images/category4.png", title: "Sandwich"),
    ImageTitleModel(
        id: 5, imagePath: "assets/images/category5.png", title: "French Fries"),
    ImageTitleModel(
        id: 6, imagePath: "assets/images/category6.png", title: "Hot Dog")
  ];

  List<ImageTitleModel> popularProductList = [
    ImageTitleModel(
        id: 1, imagePath: "assets/images/product_1.png", title: '''10%
OFF'''),
    ImageTitleModel(
        id: 2, imagePath: "assets/images/product_2.png", title: '''10%
OFF'''),
    ImageTitleModel(
        id: 3, imagePath: "assets/images/product_3.png", title: '''10%
OFF'''),
  ];
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
}
