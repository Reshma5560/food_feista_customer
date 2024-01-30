class FoodListModel {
  int? id;
  String? imagePath;
  String? title;
  double? price;
  String? orderId;
  DateTime? orderDateTime;
  int? totalItem;
  String? orderStatuss;
  String? paymentMethod;

  FoodListModel(
      {this.id,
      this.imagePath,
      this.title,
      this.price,
      this.orderDateTime,
      this.orderId,
      this.orderStatuss,
      this.paymentMethod,
      this.totalItem});
}
