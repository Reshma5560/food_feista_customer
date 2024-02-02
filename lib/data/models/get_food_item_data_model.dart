// To parse this JSON data, do
//
//     final getFoodItemDataModel = getFoodItemDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

GetFoodItemDataModel getFoodItemDataModelFromJson(String str) => GetFoodItemDataModel.fromJson(json.decode(str));

String getFoodItemDataModelToJson(GetFoodItemDataModel data) => json.encode(data.toJson());

class GetFoodItemDataModel {
  final bool? status;
  final FoodItemData? data;

  GetFoodItemDataModel({
    this.status,
    this.data,
  });

  factory GetFoodItemDataModel.fromJson(Map<String, dynamic> json) => GetFoodItemDataModel(
        status: json["status"],
        data: json["data"] == null ? null : FoodItemData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class FoodItemData {
  final String? id;
  final String? foodName;
  final String? description;
  final String? image;
  final String? categoryId;
  final String? categoryIds;
  final List<dynamic>? variations;
  final String? addOns;
  final dynamic attributes;
  final dynamic choiceOptions;
  final int? price;
  final int? tax;
  final String? taxType;
  final int? discount;
  final String? discountType;
  final String? availableTimeStarts;
  final String? availableTimeEnds;
  final int? veg;
  final int? status;
  final String? restaurantId;
  final int? avgRating;
  final String? ratingCount;
  final dynamic rating;
  final String? slug;
  final int? recommended;
  final int? orderCount;
  final int? minimumCartQuantity;
  final int? maximumCartQuantity;
  final int? isActive;
  final dynamic createdBy;
  final String? updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ItemAddon>? addons;
  final int? commentsCount;
  final List<FoodVariant>? foodVariant;
  final List<dynamic>? translations;

  FoodItemData({
    this.id,
    this.foodName,
    this.description,
    this.image,
    this.categoryId,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.price,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.status,
    this.restaurantId,
    this.avgRating,
    this.ratingCount,
    this.rating,
    this.slug,
    this.recommended,
    this.orderCount,
    this.minimumCartQuantity,
    this.maximumCartQuantity,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.addons,
    this.commentsCount,
    this.foodVariant,
    this.translations,
  });

  factory FoodItemData.fromJson(Map<String, dynamic> json) => FoodItemData(
        id: json["id"],
        foodName: json["food_name"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryIds: json["category_ids"],
        variations: json["variations"] == null ? [] : List<dynamic>.from(json["variations"]!.map((x) => x)),
        addOns: json["add_ons"],
        attributes: json["attributes"],
        choiceOptions: json["choice_options"],
        price: json["price"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: json["discount"],
        discountType: json["discount_type"],
        availableTimeStarts: json["available_time_starts"],
        availableTimeEnds: json["available_time_ends"],
        veg: json["veg"],
        status: json["status"],
        restaurantId: json["restaurant_id"],
        avgRating: json["avg_rating"],
        ratingCount: json["rating_count"],
        rating: json["rating"],
        slug: json["slug"],
        recommended: json["recommended"],
        orderCount: json["order_count"],
        minimumCartQuantity: json["minimum_cart_quantity"],
        maximumCartQuantity: json["maximum_cart_quantity"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        addons: json["addons"] == null ? [] : List<ItemAddon>.from(json["addons"]!.map((x) => ItemAddon.fromJson(x))),
        commentsCount: json["comments_count"],
        foodVariant: json["food_variant"] == null ? [] : List<FoodVariant>.from(json["food_variant"]!.map((x) => FoodVariant.fromJson(x))),
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_name": foodName,
        "description": description,
        "image": image,
        "category_id": categoryId,
        "category_ids": categoryIds,
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x)),
        "add_ons": addOns,
        "attributes": attributes,
        "choice_options": choiceOptions,
        "price": price,
        "tax": tax,
        "tax_type": taxType,
        "discount": discount,
        "discount_type": discountType,
        "available_time_starts": availableTimeStarts,
        "available_time_ends": availableTimeEnds,
        "veg": veg,
        "status": status,
        "restaurant_id": restaurantId,
        "avg_rating": avgRating,
        "rating_count": ratingCount,
        "rating": rating,
        "slug": slug,
        "recommended": recommended,
        "order_count": orderCount,
        "minimum_cart_quantity": minimumCartQuantity,
        "maximum_cart_quantity": maximumCartQuantity,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "addons": addons == null ? [] : List<dynamic>.from(addons!.map((x) => x.toJson())),
        "comments_count": commentsCount,
        "food_variant": foodVariant == null ? [] : List<dynamic>.from(foodVariant!.map((x) => x.toJson())),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
      };
}

class ItemAddon {
  final String? id;
  final String? addonName;
  final int? price;
  final String? restaurantId;
  final RxInt? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ItemAddon({
    this.id,
    this.addonName,
    this.price,
    this.restaurantId,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory ItemAddon.fromJson(Map<String, dynamic> json) => ItemAddon(
        id: json["id"],
        addonName: json["addon_name"],
        price: json["price"],
        restaurantId: json["restaurant_id"],
        isActive: RxInt(json["is_active"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "addon_name": addonName,
        "price": price,
        "restaurant_id": restaurantId,
        "is_active": isActive.obs,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class FoodVariant {
  final String? id;
  final String? foodId;
  final String? variationName;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<FoodVariantOption>? foodVariantOption;

  FoodVariant({
    this.id,
    this.foodId,
    this.variationName,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.foodVariantOption,
  });

  factory FoodVariant.fromJson(Map<String, dynamic> json) => FoodVariant(
        id: json["id"],
        foodId: json["food_id"],
        variationName: json["variation_name"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        foodVariantOption: json["food_variant_option"] == null
            ? []
            : List<FoodVariantOption>.from(json["food_variant_option"]!.map((x) => FoodVariantOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_id": foodId,
        "variation_name": variationName,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "food_variant_option": foodVariantOption == null ? [] : List<dynamic>.from(foodVariantOption!.map((x) => x.toJson())),
      };
}

class FoodVariantOption {
  final String? id;
  final String? foodId;
  final String? foodVariationId;
  final String? variationOptionName;
  final RxBool? isSelected;
  final String? price;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FoodVariantOption({
    this.id,
    this.foodId,
    this.foodVariationId,
    this.variationOptionName,
    this.isSelected,
    this.price,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory FoodVariantOption.fromJson(Map<String, dynamic> json) => FoodVariantOption(
        id: json["id"],
        foodId: json["food_id"],
        foodVariationId: json["food_variation_id"],
        variationOptionName: json["variation_option_name"],
        isSelected: false.obs,
        price: json["price"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_id": foodId,
        "food_variation_id": foodVariationId,
        "variation_option_name": variationOptionName,
        "price": price,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
