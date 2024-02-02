import 'package:foodapplication/repositories/desktop_repositories.dart';
import 'package:get/get.dart';

import '../data/models/get_cart_data_model.dart';
import '../data/models/get_food_item_data_model.dart';

class CartController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isOpen = false.obs;
  RxList<CartDetail> cartItemData = <CartDetail>[].obs;
  RxList<ItemAddon> foodItemAddonData = <ItemAddon>[].obs;
  RxList<FoodVariant> foodItemVariantData = <FoodVariant>[].obs;
  Rx<GetCartDataModel> cartData = GetCartDataModel().obs;

  Rx<double> totalAmount = 0.00.obs;

  @override
  Future<void> onReady() async {
    await DesktopRepository().getCartAPI();
    super.onReady();
  }

/*List<FoodListModel> cartList = [
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
  ];*/
}
