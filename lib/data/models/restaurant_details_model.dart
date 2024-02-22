import 'dart:convert';

import 'package:get/get.dart';

/*
RestaurantDetailModel restaurantDetailModelFromJson(String str) => RestaurantDetailModel.fromJson(json.decode(str));

String restaurantDetailModelToJson(RestaurantDetailModel data) => json.encode(data.toJson());

class RestaurantDetailModel {
  final bool? status;
  final RestaurantDetails? data;

  RestaurantDetailModel({
    this.status,
    this.data,
  });

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) => RestaurantDetailModel(
        status: json["status"],
        data: json["data"] == null ? null : RestaurantDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class RestaurantDetails {
  final String? id;
  final String? restaurantName;
  final String? phone;
  final String? email;
  final String? logo;
  final String? minimumDeliveryTime;
  final String? maximumDeliveryTime;
  final String? tinNumber;
  final DateTime? date;
  final dynamic tags;
  final String? licenseDocument;
  final String? latitude;
  final String? longitude;
  final String? address;
  final dynamic footerText;
  final String? minimumOrderAmount;
  final int? minimumShippingCharge;
  final dynamic perKmShippingCharge;
  final bool? freeDelivery;
  final String? userId;
  final List<int>? rating;
  final int? homeDelivery;
  final bool? takeAway;
  final bool? cutlery;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final dynamic metaImage;
  final int? tax;
  final dynamic commission;
  final String? coverPhoto;
  final String? slug;
  final dynamic qrCode;
  final String? offDay;
  final DateTime? openingTime;
  final String? closingTime;
  final String? zoneId;
  final int? announcement;
  final dynamic announcementMessage;
  final int? veg;
  final int? nonVeg;
  final int? selfDeliverySystem;
  final bool? posSystem;
  final dynamic deliveryTime;
  final int? scheduleDelivery;
  final bool? foodSection;
  final bool? reviewsSection;
  final String? restaurantModel;
  final int? orderCount;
  final int? totalOrder;
  final dynamic maximumShippingCharge;
  final dynamic additionalData;
  final dynamic additionalDocuments;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final int? isActive;
  final int? isVerify;
  final int? closeTemporarily;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? orderSubscriptionActive;
  final List<Coupon>? coupon;
  final List<Gallery>? foodGallery;
  final List<Gallery>? ambienceGallery;
  final List<Gallery>? menuGallery;
  final List<Category>? category;
  final bool? freeDeliveryDistanceStatus;
  final String? freeDeliveryDistanceValue;
  final List<CuisineRestaurant>? cuisineRestaurant;
  final List<RestaurantAmenity>? restaurantAmenities;
  final List<Gallery>? restaurantGallery;
  final List<dynamic>? translations;

  RestaurantDetails({
    this.id,
    this.restaurantName,
    this.phone,
    this.email,
    this.logo,
    this.minimumDeliveryTime,
    this.maximumDeliveryTime,
    this.tinNumber,
    this.date,
    this.tags,
    this.licenseDocument,
    this.latitude,
    this.longitude,
    this.address,
    this.footerText,
    this.minimumOrderAmount,
    this.minimumShippingCharge,
    this.perKmShippingCharge,
    this.freeDelivery,
    this.userId,
    this.rating,
    this.homeDelivery,
    this.takeAway,
    this.cutlery,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.tax,
    this.commission,
    this.coverPhoto,
    this.slug,
    this.qrCode,
    this.offDay,
    this.openingTime,
    this.closingTime,
    this.zoneId,
    this.announcement,
    this.announcementMessage,
    this.veg,
    this.nonVeg,
    this.selfDeliverySystem,
    this.posSystem,
    this.deliveryTime,
    this.scheduleDelivery,
    this.foodSection,
    this.reviewsSection,
    this.restaurantModel,
    this.orderCount,
    this.totalOrder,
    this.maximumShippingCharge,
    this.additionalData,
    this.additionalDocuments,
    this.countryId,
    this.stateId,
    this.cityId,
    this.isActive,
    this.isVerify,
    this.closeTemporarily,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.orderSubscriptionActive,
    this.coupon,
    this.foodGallery,
    this.ambienceGallery,
    this.menuGallery,
    this.category,
    this.freeDeliveryDistanceStatus,
    this.freeDeliveryDistanceValue,
    this.cuisineRestaurant,
    this.restaurantAmenities,
    this.restaurantGallery,
    this.translations,
  });

  factory RestaurantDetails.fromJson(Map<String, dynamic> json) => RestaurantDetails(
        id: json["id"],
        restaurantName: json["restaurant_name"],
        phone: json["phone"],
        email: json["email"],
        logo: json["logo"],
        minimumDeliveryTime: json["minimum_delivery_time"],
        maximumDeliveryTime: json["maximum_delivery_time"],
        tinNumber: json["tin_number"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        tags: json["tags"],
        licenseDocument: json["license_document"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        footerText: json["footer_text"],
        minimumOrderAmount: json["minimum_order_amount"],
        minimumShippingCharge: json["minimum_shipping_charge"],
        perKmShippingCharge: json["per_km_shipping_charge"],
        freeDelivery: json["free_delivery"],
        userId: json["user_id"],
        rating: json["rating"] == null ? [] : List<int>.from(json["rating"]!.map((x) => x)),
        homeDelivery: json["home_delivery"],
        takeAway: json["take_away"],
        cutlery: json["cutlery"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImage: json["meta_image"],
        tax: json["tax"],
        commission: json["commission"],
        coverPhoto: json["cover_photo"],
        slug: json["slug"],
        qrCode: json["qr_code"],
        offDay: json["off_day"],
        openingTime: json["opening_time"] == null ? null : DateTime.parse(json["opening_time"]),
        closingTime: json["closing_time"],
        zoneId: json["zone_id"],
        announcement: json["announcement"],
        announcementMessage: json["announcement_message"],
        veg: json["veg"],
        nonVeg: json["non_veg"],
        selfDeliverySystem: json["self_delivery_system"],
        posSystem: json["pos_system"],
        deliveryTime: json["delivery_time"],
        scheduleDelivery: json["schedule_delivery"],
        foodSection: json["food_section"],
        reviewsSection: json["reviews_section"],
        restaurantModel: json["restaurant_model"],
        orderCount: json["order_count"],
        totalOrder: json["total_order"],
        maximumShippingCharge: json["maximum_shipping_charge"],
        additionalData: json["additional_data"],
        additionalDocuments: json["additional_documents"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        isActive: json["is_active"],
        isVerify: json["is_verify"],
        closeTemporarily: json["close_temporarily"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        orderSubscriptionActive: json["order_subscription_active"],
        coupon: json["coupon"] == null ? [] : List<Coupon>.from(json["coupon"]!.map((x) => Coupon.fromJson(x))),
        foodGallery: json["food_gallery"] == null ? [] : List<Gallery>.from(json["food_gallery"]!.map((x) => Gallery.fromJson(x))),
        ambienceGallery: json["ambienceGallery"] == null ? [] : List<Gallery>.from(json["ambienceGallery"]!.map((x) => Gallery.fromJson(x))),
        menuGallery: json["menuGallery"] == null ? [] : List<Gallery>.from(json["menuGallery"]!.map((x) => Gallery.fromJson(x))),
        category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        cuisineRestaurant: json["cuisine_restaurant"] == null
            ? []
            : List<CuisineRestaurant>.from(json["cuisine_restaurant"]!.map((x) => CuisineRestaurant.fromJson(x))),
        restaurantAmenities: json["restaurant_amenities"] == null
            ? []
            : List<RestaurantAmenity>.from(json["restaurant_amenities"]!.map((x) => RestaurantAmenity.fromJson(x))),
        restaurantGallery: json["restaurant_gallery"] == null ? [] : List<Gallery>.from(json["restaurant_gallery"]!.map((x) => Gallery.fromJson(x))),
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_name": restaurantName,
        "phone": phone,
        "email": email,
        "logo": logo,
        "minimum_delivery_time": minimumDeliveryTime,
        "maximum_delivery_time": maximumDeliveryTime,
        "tin_number": tinNumber,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "tags": tags,
        "license_document": licenseDocument,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "footer_text": footerText,
        "minimum_order_amount": minimumOrderAmount,
        "minimum_shipping_charge": minimumShippingCharge,
        "per_km_shipping_charge": perKmShippingCharge,
        "free_delivery": freeDelivery,
        "user_id": userId,
        "rating": rating == null ? [] : List<dynamic>.from(rating!.map((x) => x)),
        "home_delivery": homeDelivery,
        "take_away": takeAway,
        "cutlery": cutlery,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "tax": tax,
        "commission": commission,
        "cover_photo": coverPhoto,
        "slug": slug,
        "qr_code": qrCode,
        "off_day": offDay,
        "opening_time": openingTime?.toIso8601String(),
        "closing_time": closingTime,
        "zone_id": zoneId,
        "announcement": announcement,
        "announcement_message": announcementMessage,
        "veg": veg,
        "non_veg": nonVeg,
        "self_delivery_system": selfDeliverySystem,
        "pos_system": posSystem,
        "delivery_time": deliveryTime,
        "schedule_delivery": scheduleDelivery,
        "food_section": foodSection,
        "reviews_section": reviewsSection,
        "restaurant_model": restaurantModel,
        "order_count": orderCount,
        "total_order": totalOrder,
        "maximum_shipping_charge": maximumShippingCharge,
        "additional_data": additionalData,
        "additional_documents": additionalDocuments,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "is_active": isActive,
        "is_verify": isVerify,
        "close_temporarily": closeTemporarily,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "order_subscription_active": orderSubscriptionActive,
        "coupon": coupon == null ? [] : List<dynamic>.from(coupon!.map((x) => x.toJson())),
        "food_gallery": foodGallery == null ? [] : List<dynamic>.from(foodGallery!.map((x) => x.toJson())),
        "ambienceGallery": ambienceGallery == null ? [] : List<dynamic>.from(ambienceGallery!.map((x) => x.toJson())),
        "menuGallery": menuGallery == null ? [] : List<dynamic>.from(menuGallery!.map((x) => x.toJson())),
        "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
        "free_delivery_distance_status": freeDeliveryDistanceStatus,
        "free_delivery_distance_value": freeDeliveryDistanceValue,
        "cuisine_restaurant": cuisineRestaurant == null ? [] : List<dynamic>.from(cuisineRestaurant!.map((x) => x.toJson())),
        "restaurant_amenities": restaurantAmenities == null ? [] : List<dynamic>.from(restaurantAmenities!.map((x) => x.toJson())),
        "restaurant_gallery": restaurantGallery == null ? [] : List<dynamic>.from(restaurantGallery!.map((x) => x.toJson())),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
      };
}

class Gallery {
  final String? id;
  final String? restaurantId;
  final String? type;
  final String? image;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Gallery({
    this.id,
    this.restaurantId,
    this.type,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        type: json["type"],
        image: json["image"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_id": restaurantId,
        "type": type,
        "image": image,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Category {
  final String? id;
  final String? categoryName;
  final String? image;
  final String? slug;
  final dynamic parentId;
  final int? position;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? priority;
  final int? foodCount;
  final String? parentname;
  final List<Food>? food;
  final List<dynamic>? translations;
  final dynamic parent;

  Category({
    this.id,
    this.categoryName,
    this.image,
    this.slug,
    this.parentId,
    this.position,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.foodCount,
    this.parentname,
    this.food,
    this.translations,
    this.parent,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["category_name"],
        image: json["image"],
        slug: json["slug"],
        parentId: json["parent_id"],
        position: json["position"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        priority: json["priority"],
        foodCount: json["food_count"],
        parentname: json["parentname"],
        food: json["food"] == null ? [] : List<Food>.from(json["food"]!.map((x) => Food.fromJson(x))),
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "image": image,
        "slug": slug,
        "parent_id": parentId,
        "position": position,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "priority": priority,
        "food_count": foodCount,
        "parentname": parentname,
        "food": food == null ? [] : List<dynamic>.from(food!.map((x) => x.toJson())),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
        "parent": parent,
      };
}

class Food {
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
  final String? basePrice;
  final RxInt? price;
  final RxInt? itemCount;
  final RxDouble? totalPrice;
  final int? tax;
  final String? taxType;
  final double? discount;
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
  final int? commentsCount;
  final List<FoodVariant>? foodVariant;
  final List<Addon>? addons;
  final List<dynamic>? translations;

  Food({
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
    this.basePrice,
    this.price,
    this.totalPrice,
    this.itemCount,
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
    this.commentsCount,
    this.foodVariant,
    this.addons,
    this.translations,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
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
        basePrice: json["base_price"],
        price: RxInt(json["price"]),
        itemCount: RxInt(1),
        totalPrice: RxDouble(0.0),
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: double.parse(json["discount"].toString()),
        // price: json["price"],
        // tax: json["tax"],
        // taxType: json["tax_type"],
        // discount: json["discount"]?.toDouble(),
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
        commentsCount: json["comments_count"],
        foodVariant: json["food_variant"] == null ? [] : List<FoodVariant>.from(json["food_variant"]!.map((x) => FoodVariant.fromJson(x))),
        addons: json["addons"] == null ? [] : List<Addon>.from(json["addons"]!.map((x) => Addon.fromJson(x))),
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
        "base_price": basePrice,
        "price": price.obs,
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
        "comments_count": commentsCount,
        "food_variant": foodVariant == null ? [] : List<dynamic>.from(foodVariant!.map((x) => x.toJson())),
        "addons": addons == null ? [] : List<dynamic>.from(addons!.map((x) => x.toJson())),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
      };
}

class Addon {
  final String? id;
  final String? addonName;
  final int? price;
  final String? restaurantId;
  final int? isActive;
  final RxBool? isSelected;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  Addon({
    this.id,
    this.addonName,
    this.price,
    this.restaurantId,
    this.isActive,
    this.isSelected,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        id: json["id"],
        addonName: json["addon_name"],
        price: json["price"],
        restaurantId: json["restaurant_id"],
        isActive: json["is_active"],
        isSelected: RxBool(false),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "addon_name": addonName,
        "price": price,
        "restaurant_id": restaurantId,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
      };
}

class Pivot {
  final String? foodId;
  final String? addOnId;

  Pivot({
    this.foodId,
    this.addOnId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        foodId: json["food_id"],
        addOnId: json["add_on_id"],
      );

  Map<String, dynamic> toJson() => {
        "food_id": foodId,
        "add_on_id": addOnId,
      };
}

class FoodVariant {
  final String? id;
  final String? foodId;
  final String? variationName;
  final RxInt? isSelected;
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
    this.isSelected,
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
        isSelected: RxInt(-1),
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

class Coupon {
  final String? id;
  final String? couponName;
  final String? code;
  final DateTime? startDate;
  final DateTime? expireDate;
  final int? minPurchase;
  final int? maxDiscount;
  final int? discount;
  final String? discountType;
  final String? couponType;
  final int? limit;
  final int? isActive;
  final String? restaurantId;
  final dynamic zoneId;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? totalUses;
  final String? createdBy;
  final String? updatedBy;
  final String? customerId;
  final dynamic slug;
  final List<dynamic>? translations;

  Coupon({
    this.id,
    this.couponName,
    this.code,
    this.startDate,
    this.expireDate,
    this.minPurchase,
    this.maxDiscount,
    this.discount,
    this.discountType,
    this.couponType,
    this.limit,
    this.isActive,
    this.restaurantId,
    this.zoneId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.totalUses,
    this.createdBy,
    this.updatedBy,
    this.customerId,
    this.slug,
    this.translations,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        couponName: json["coupon_name"],
        code: json["code"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        expireDate: json["expire_date"] == null ? null : DateTime.parse(json["expire_date"]),
        minPurchase: json["min_purchase"],
        maxDiscount: json["max_discount"],
        discount: json["discount"],
        discountType: json["discount_type"],
        couponType: json["coupon_type"],
        limit: json["limit"],
        isActive: json["is_active"],
        restaurantId: json["restaurant_id"],
        zoneId: json["zone_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        totalUses: json["total_uses"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        customerId: json["customer_id"],
        slug: json["slug"],
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coupon_name": couponName,
        "code": code,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "expire_date":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "min_purchase": minPurchase,
        "max_discount": maxDiscount,
        "discount": discount,
        "discount_type": discountType,
        "coupon_type": couponType,
        "limit": limit,
        "is_active": isActive,
        "restaurant_id": restaurantId,
        "zone_id": zoneId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "total_uses": totalUses,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "customer_id": customerId,
        "slug": slug,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
      };
}

class CuisineRestaurant {
  final String? id;
  final String? restaurantId;
  final String? cuisineId;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Cuisine? cuisine;

  CuisineRestaurant({
    this.id,
    this.restaurantId,
    this.cuisineId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.cuisine,
  });

  factory CuisineRestaurant.fromJson(Map<String, dynamic> json) => CuisineRestaurant(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        cuisineId: json["cuisine_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        cuisine: json["cuisine"] == null ? null : Cuisine.fromJson(json["cuisine"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_id": restaurantId,
        "cuisine_id": cuisineId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "cuisine": cuisine?.toJson(),
      };
}

class Cuisine {
  final String? id;
  final String? cuisineName;
  final String? image;
  final dynamic slug;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Cuisine({
    this.id,
    this.cuisineName,
    this.image,
    this.slug,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        id: json["id"],
        cuisineName: json["cuisine_name"],
        image: json["image"],
        slug: json["slug"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cuisine_name": cuisineName,
        "image": image,
        "slug": slug,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class RestaurantAmenity {
  final String? id;
  final String? restaurantId;
  final String? amenitiesId;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Amenities? amenities;

  RestaurantAmenity({
    this.id,
    this.restaurantId,
    this.amenitiesId,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.amenities,
  });

  factory RestaurantAmenity.fromJson(Map<String, dynamic> json) => RestaurantAmenity(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        amenitiesId: json["amenities_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        amenities: json["amenities"] == null ? null : Amenities.fromJson(json["amenities"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_id": restaurantId,
        "amenities_id": amenitiesId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "amenities": amenities?.toJson(),
      };
}

class Amenities {
  final String? id;
  final String? name;
  final String? icon;
  final int? isActive;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Amenities({
    this.id,
    this.name,
    this.icon,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Amenities.fromJson(Map<String, dynamic> json) => Amenities(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        isActive: json["is_active"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "is_active": isActive,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
*/

RestaurantDetailModel restaurantDetailModelFromJson(String str) => RestaurantDetailModel.fromJson(json.decode(str));

class RestaurantDetailModel {
  final bool? status;
  final int? userOrderCount;
  final RestaurantDetails? data;

  RestaurantDetailModel({
    this.status,
    this.data,
    this.userOrderCount,
  });

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) => RestaurantDetailModel(
        status: json["status"],
        userOrderCount: json["user_order_count"],
        data: json["data"] == null ? null : RestaurantDetails.fromJson(json["data"]),
      );
}

class RestaurantDetails {
  final String? id;
  final String? restaurantName;
  final String? phone;
  final String? email;
  final String? logo;
  final String? minimumDeliveryTime;
  final String? maximumDeliveryTime;
  final String? tinNumber;
  final DateTime? date;
  final dynamic tags;
  final String? licenseDocument;
  final String? latitude;
  final String? longitude;
  final String? address;
  final dynamic footerText;
  final String? minimumOrderAmount;
  final int? minimumShippingCharge;
  final dynamic perKmShippingCharge;
  final bool? freeDelivery;
  final String? userId;
  final List<int>? rating;
  final int? homeDelivery;
  final bool? takeAway;
  final bool? cutlery;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final dynamic metaImage;
  final int? tax;
  final String? ratingCount;
  final String? distance;
  final dynamic commission;
  final String? coverPhoto;
  final String? slug;
  final dynamic qrCode;
  final String? offDay;
  final DateTime? openingTime;
  final String? closingTime;
  final String? zoneId;
  final int? announcement;
  final dynamic announcementMessage;
  final int? veg;
  final int? nonVeg;
  final int? selfDeliverySystem;
  final bool? posSystem;
  final dynamic deliveryTime;
  final int? scheduleDelivery;
  final bool? foodSection;
  final bool? reviewsSection;
  final String? restaurantModel;
  final int? orderCount;
  final int? totalOrder;
  final dynamic maximumShippingCharge;
  final dynamic additionalData;
  final dynamic additionalDocuments;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final int? isActive;
  final int? isVerify;
  final int? closeTemporarily;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? orderSubscriptionActive;
  final List<Coupon>? coupon;
  final List<Gallery>? foodGallery;
  final List<Gallery>? ambienceGallery;
  final List<Gallery>? menuGallery;
  final List<CategoryFood>? category;
  final bool? gstStatus;
  final String? gstCode;
  final bool? freeDeliveryDistanceStatus;
  final String? freeDeliveryDistanceValue;
  final List<CuisineRestaurant>? cuisineRestaurant;
  final List<RestaurantAmenity>? restaurantAmenities;
  final List<Gallery>? restaurantGallery;
  final List<dynamic>? translations;

  RestaurantDetails({
    this.id,
    this.restaurantName,
    this.phone,
    this.email,
    this.logo,
    this.minimumDeliveryTime,
    this.maximumDeliveryTime,
    this.tinNumber,
    this.date,
    this.tags,
    this.ratingCount,
    this.distance,
    this.licenseDocument,
    this.latitude,
    this.longitude,
    this.address,
    this.footerText,
    this.minimumOrderAmount,
    this.minimumShippingCharge,
    this.perKmShippingCharge,
    this.freeDelivery,
    this.userId,
    this.rating,
    this.homeDelivery,
    this.takeAway,
    this.cutlery,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.tax,
    this.commission,
    this.coverPhoto,
    this.slug,
    this.qrCode,
    this.offDay,
    this.openingTime,
    this.closingTime,
    this.zoneId,
    this.announcement,
    this.announcementMessage,
    this.veg,
    this.nonVeg,
    this.selfDeliverySystem,
    this.posSystem,
    this.deliveryTime,
    this.scheduleDelivery,
    this.foodSection,
    this.reviewsSection,
    this.restaurantModel,
    this.orderCount,
    this.totalOrder,
    this.maximumShippingCharge,
    this.additionalData,
    this.additionalDocuments,
    this.countryId,
    this.stateId,
    this.cityId,
    this.isActive,
    this.isVerify,
    this.closeTemporarily,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.orderSubscriptionActive,
    this.coupon,
    this.foodGallery,
    this.ambienceGallery,
    this.menuGallery,
    this.category,
    this.gstStatus,
    this.gstCode,
    this.freeDeliveryDistanceStatus,
    this.freeDeliveryDistanceValue,
    this.cuisineRestaurant,
    this.restaurantAmenities,
    this.restaurantGallery,
    this.translations,
  });

  factory RestaurantDetails.fromJson(Map<String, dynamic> json) => RestaurantDetails(
        id: json["id"],
        restaurantName: json["restaurant_name"],
        phone: json["phone"],
        email: json["email"],
        logo: json["logo"],
        minimumDeliveryTime: json["minimum_delivery_time"],
        maximumDeliveryTime: json["maximum_delivery_time"],
        tinNumber: json["tin_number"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        tags: json["tags"],
        ratingCount: json["rating_count"],
        distance: json["distance_km"],
        licenseDocument: json["license_document"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        footerText: json["footer_text"],
        minimumOrderAmount: json["minimum_order_amount"],
        minimumShippingCharge: json["minimum_shipping_charge"],
        perKmShippingCharge: json["per_km_shipping_charge"],
        freeDelivery: json["free_delivery"],
        userId: json["user_id"],
        rating: json["rating"] == null ? [] : List<int>.from(json["rating"]!.map((x) => x)),
        homeDelivery: json["home_delivery"],
        takeAway: json["take_away"],
        cutlery: json["cutlery"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImage: json["meta_image"],
        tax: json["tax"],
        commission: json["commission"],
        coverPhoto: json["cover_photo"],
        slug: json["slug"],
        qrCode: json["qr_code"],
        offDay: json["off_day"],
        openingTime: json["opening_time"] == null ? null : DateTime.parse(json["opening_time"]),
        closingTime: json["closing_time"],
        zoneId: json["zone_id"],
        announcement: json["announcement"],
        announcementMessage: json["announcement_message"],
        veg: json["veg"],
        nonVeg: json["non_veg"],
        selfDeliverySystem: json["self_delivery_system"],
        posSystem: json["pos_system"],
        deliveryTime: json["delivery_time"],
        scheduleDelivery: json["schedule_delivery"],
        foodSection: json["food_section"],
        reviewsSection: json["reviews_section"],
        restaurantModel: json["restaurant_model"],
        orderCount: json["order_count"],
        totalOrder: json["total_order"],
        maximumShippingCharge: json["maximum_shipping_charge"],
        additionalData: json["additional_data"],
        additionalDocuments: json["additional_documents"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        isActive: json["is_active"],
        isVerify: json["is_verify"],
        closeTemporarily: json["close_temporarily"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        orderSubscriptionActive: json["order_subscription_active"],
        coupon: json["coupon"] == null ? [] : List<Coupon>.from(json["coupon"]!.map((x) => Coupon.fromJson(x))),
        foodGallery: json["food_gallery"] == null ? [] : List<Gallery>.from(json["food_gallery"]!.map((x) => Gallery.fromJson(x))),
        ambienceGallery: json["ambienceGallery"] == null ? [] : List<Gallery>.from(json["ambienceGallery"]!.map((x) => Gallery.fromJson(x))),
        menuGallery: json["menuGallery"] == null ? [] : List<Gallery>.from(json["menuGallery"]!.map((x) => Gallery.fromJson(x))),
        category: json["category"] == null ? [] : List<CategoryFood>.from(json["category"]!.map((x) => CategoryFood.fromJson(x))),
        // foods: json["foods"] == null ? [] : List<Food>.from(json["foods"]!.map((x) => Food.fromJson(x))),
        // gstStatus: json["gst_status"],
        // gstCode: json["gst_code"],
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        cuisineRestaurant: json["cuisine_restaurant"] == null
            ? []
            : List<CuisineRestaurant>.from(json["cuisine_restaurant"]!.map((x) => CuisineRestaurant.fromJson(x))),
        restaurantAmenities: json["restaurant_amenities"] == null
            ? []
            : List<RestaurantAmenity>.from(json["restaurant_amenities"]!.map((x) => RestaurantAmenity.fromJson(x))),
        restaurantGallery: json["restaurant_gallery"] == null ? [] : List<Gallery>.from(json["restaurant_gallery"]!.map((x) => Gallery.fromJson(x))),
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );
}

class Gallery {
  final String? id;
  final String? restaurantId;
  final String? type;
  final String? image;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Gallery({
    this.id,
    this.restaurantId,
    this.type,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        type: json["type"],
        image: json["image"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}

class Coupon {
  final String? id;
  final String? couponName;
  final String? code;
  final DateTime? startDate;
  final DateTime? expireDate;
  final int? minPurchase;
  final int? maxDiscount;
  final int? discount;
  final String? discountType;
  final String? couponType;
  final int? limit;
  final int? isActive;
  final String? restaurantId;
  final dynamic zoneId;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? totalUses;
  final String? createdBy;
  final String? updatedBy;
  final String? customerId;
  final dynamic slug;
  final List<dynamic>? translations;

  Coupon({
    this.id,
    this.couponName,
    this.code,
    this.startDate,
    this.expireDate,
    this.minPurchase,
    this.maxDiscount,
    this.discount,
    this.discountType,
    this.couponType,
    this.limit,
    this.isActive,
    this.restaurantId,
    this.zoneId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.totalUses,
    this.createdBy,
    this.updatedBy,
    this.customerId,
    this.slug,
    this.translations,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        couponName: json["coupon_name"],
        code: json["code"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        expireDate: json["expire_date"] == null ? null : DateTime.parse(json["expire_date"]),
        minPurchase: json["min_purchase"],
        maxDiscount: json["max_discount"],
        discount: json["discount"],
        discountType: json["discount_type"],
        couponType: json["coupon_type"],
        limit: json["limit"],
        isActive: json["is_active"],
        restaurantId: json["restaurant_id"],
        zoneId: json["zone_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        totalUses: json["total_uses"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        customerId: json["customer_id"],
        slug: json["slug"],
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );
}

class CuisineRestaurant {
  final String? id;
  final String? restaurantId;
  final String? cuisineId;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Cuisine? cuisine;

  CuisineRestaurant({
    this.id,
    this.restaurantId,
    this.cuisineId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.cuisine,
  });

  factory CuisineRestaurant.fromJson(Map<String, dynamic> json) => CuisineRestaurant(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        cuisineId: json["cuisine_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        cuisine: json["cuisine"] == null ? null : Cuisine.fromJson(json["cuisine"]),
      );
}

class Cuisine {
  final String? id;
  final String? cuisineName;
  final String? image;
  final dynamic slug;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Cuisine({
    this.id,
    this.cuisineName,
    this.image,
    this.slug,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        id: json["id"],
        cuisineName: json["cuisine_name"],
        image: json["image"],
        slug: json["slug"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}

class CategoryFood {
  final String? id;
  final String? categoryName;
  final String? image;
  final String? slug;
  final dynamic parentId;
  final int? position;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? priority;
  final int? foodCount;
  final String? parentname;
  final List<Food>? food;
  final List<dynamic>? translations;
  final dynamic parent;

  CategoryFood({
    this.id,
    this.categoryName,
    this.image,
    this.slug,
    this.parentId,
    this.position,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.foodCount,
    this.parentname,
    this.food,
    this.translations,
    this.parent,
  });

  factory CategoryFood.fromJson(Map<String, dynamic> json) => CategoryFood(
        id: json["id"],
        categoryName: json["category_name"],
        image: json["image"],
        slug: json["slug"],
        parentId: json["parent_id"],
        position: json["position"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        priority: json["priority"],
        foodCount: json["food_count"],
        parentname: json["parentname"],
        food: json["foods"] == null ? [] : List<Food>.from(json["foods"]!.map((x) => Food.fromJson(x))),
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
        parent: json["parent"],
      );

// Map<String, dynamic> toJson() => {
//       "id": id,
//       "category_name": categoryName,
//       "image": image,
//       "slug": slug,
//       "parent_id": parentId,
//       "position": position,
//       "is_active": isActive,
//       "created_by": createdBy,
//       "updated_by": updatedBy,
//       "deleted_at": deletedAt,
//       "created_at": createdAt?.toIso8601String(),
//       "updated_at": updatedAt?.toIso8601String(),
//       "priority": priority,
//       "food_count": foodCount,
//       "parentname": parentname,
//       "food": food == null ? [] : List<dynamic>.from(food!.map((x) => x.toJson())),
//       "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
//       "parent": parent,
//     };
}

class Food {
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
  final RxInt? price;
  final RxInt? itemCount;
  final RxDouble? totalPrice;
  final RxDouble? variantPrice;
  final RxDouble? addonsPrice;
  final int? tax;
  final String? taxType;
  final double? discount;
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
  final List<Addon>? addons;
  final int? commentsCount;
  final List<FoodVariant>? foodVariant;
  final CategoryFood? category;
  final List<dynamic>? translations;

  Food({
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
    this.itemCount,
    this.totalPrice,
    this.variantPrice,
    this.addonsPrice,
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
    this.category,
    this.translations,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
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
        price: RxInt(json["price"]),
        itemCount: RxInt(1),
        totalPrice: RxDouble(0.0),
        addonsPrice: RxDouble(0.0),
        variantPrice: RxDouble(0.0),
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: double.parse(json["discount"].toString()),
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
        addons: json["addons"] == null ? [] : List<Addon>.from(json["addons"]!.map((x) => Addon.fromJson(x))),
        commentsCount: json["comments_count"],
        foodVariant: json["food_variant"] == null ? [] : List<FoodVariant>.from(json["food_variant"]!.map((x) => FoodVariant.fromJson(x))),
        category: json["category"] == null ? null : CategoryFood.fromJson(json["category"]),
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );
}

class Addon {
  final String? id;
  final String? addonName;
  final int? price;
  final String? restaurantId;
  final int? isActive;
  final RxBool? isSelected;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Addon({
    this.id,
    this.addonName,
    this.price,
    this.restaurantId,
    this.isActive,
    this.isSelected,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        id: json["id"],
        addonName: json["addon_name"],
        price: json["price"],
        restaurantId: json["restaurant_id"],
        isActive: json["is_active"],
        isSelected: RxBool(false),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}

class Category {
  final String? id;
  final String? categoryName;
  final String? image;
  final String? slug;
  final dynamic parentId;
  final int? position;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? priority;
  final String? parentname;
  final List<dynamic>? translations;
  final dynamic parent;

  Category({
    this.id,
    this.categoryName,
    this.image,
    this.slug,
    this.parentId,
    this.position,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.parentname,
    this.translations,
    this.parent,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["category_name"],
        image: json["image"],
        slug: json["slug"],
        parentId: json["parent_id"],
        position: json["position"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        priority: json["priority"],
        parentname: json["parentname"],
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
        parent: json["parent"],
      );
}

class FoodVariant {
  final String? id;
  final String? foodId;
  final String? variationName;
  final RxInt? isSelected;
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
    this.isSelected,
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
        isSelected: RxInt(0),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        foodVariantOption: json["food_variant_option"] == null
            ? []
            : List<FoodVariantOption>.from(json["food_variant_option"]!.map((x) => FoodVariantOption.fromJson(x))),
      );
}

class FoodVariantOption {
  final String? id;
  final String? foodId;
  final String? foodVariationId;
  final String? variationOptionName;
  final String? price;
  final RxBool? isSelected;
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
    this.price,
    this.isSelected,
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
        price: json["price"],
        isSelected: RxBool(false),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}

class RestaurantAmenity {
  final String? id;
  final String? restaurantId;
  final String? amenitiesId;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Amenities? amenities;

  RestaurantAmenity({
    this.id,
    this.restaurantId,
    this.amenitiesId,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.amenities,
  });

  factory RestaurantAmenity.fromJson(Map<String, dynamic> json) => RestaurantAmenity(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        amenitiesId: json["amenities_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        amenities: json["amenities"] == null ? null : Amenities.fromJson(json["amenities"]),
      );
}

class Amenities {
  final String? id;
  final String? name;
  final String? icon;
  final int? isActive;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Amenities({
    this.id,
    this.name,
    this.icon,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Amenities.fromJson(Map<String, dynamic> json) => Amenities(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        isActive: json["is_active"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}
