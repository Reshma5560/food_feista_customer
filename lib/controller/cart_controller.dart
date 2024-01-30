import 'package:get/get.dart';

import '../data/model/food_list_model.dart';

class CartController extends GetxController {
  Rx<double> totalAmount = 0.00.obs;

  List<FoodListModel> cartList = [
    FoodListModel(
        id: 1,
        imagePath: "assets/images/category6.png",
        title: "Hot Dog",
        descripton: "This is hot dog description",
        price: 15.00,
        type: "Regular",
        qty: "150gms",
        quantity: 1),
    FoodListModel(
        id: 2,
        imagePath: "assets/images/category2.png",
        title: "Tacos",
        descripton: "This is tacos description",
        price: 120.00,
        type: "Regular",
        qty: "150gms",
        quantity: 1),
    FoodListModel(
        id: 3,
        imagePath: "assets/images/category6.png",
        title: "Hot Dog",
        descripton: "This is hot dog description",
        price: 15.00,
        type: "Regular",
        qty: "150gms",
        quantity: 1),
    FoodListModel(
        id: 1,
        imagePath: "assets/images/category6.png",
        title: "Hot Dog",
        descripton: "This is hot dog description",
        price: 15.00,
        type: "Regular",
        qty: "150gms",
        quantity: 1),
    FoodListModel(
        id: 2,
        imagePath: "assets/images/category2.png",
        title: "Tacos",
        descripton: "This is tacos description",
        price: 120.00,
        type: "Regular",
        qty: "150gms",
        quantity: 1),
    FoodListModel(
        id: 3,
        imagePath: "assets/images/category6.png",
        title: "Hot Dog",
        descripton: "This is hot dog description",
        price: 15.00,
        type: "Regular",
        qty: "150gms",
        quantity: 1),
    FoodListModel(
        id: 1,
        imagePath: "assets/images/category6.png",
        title: "Hot Dog",
        descripton: "This is hot dog description",
        price: 15.00,
        type: "Regular",
        qty: "150gms",
        quantity: 1),
    FoodListModel(
        id: 2,
        imagePath: "assets/images/category2.png",
        title: "Tacos",
        descripton: "This is tacos description",
        price: 120.00,
        type: "Regular",
        qty: "150gms",
        quantity: 1),
    FoodListModel(
        id: 3,
        imagePath: "assets/images/category6.png",
        title: "Hot Dog",
        descripton: "This is hot dog description",
        price: 15.00,
        type: "Regular",
        qty: "150gms",
        quantity: 1),
  ];

  @override
  void onInit() {
    for (var i = 0; i < cartList.length; i++) {
      totalAmount.value = totalAmount.value + cartList[i].price!.toDouble();
    }
    // TODO: implement onInit
    super.onInit();
  }
}
