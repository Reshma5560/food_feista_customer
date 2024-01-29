class FoodListModel {
  int? id;
  String? imagePath;
  String? title;
  int? quantity;
  String? descripton;
  double? price;
  String? type;
  String? qty;

  FoodListModel(
      {this.id,
      this.imagePath,
      this.title,
      this.descripton,
      this.price,
      this.type,
      this.qty,
      this.quantity});
}
