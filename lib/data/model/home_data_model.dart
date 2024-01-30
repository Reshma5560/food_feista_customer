// To parse this JSON data, do
//
//     final homeDataModel = homeDataModelFromJson(jsonString);

import 'dart:convert';

HomeDataModel homeDataModelFromJson(String str) =>
    HomeDataModel.fromJson(json.decode(str));

class HomeDataModel {
  final bool? status;
  final List<BannerData>? banner;
  final List<Restaurant>? restaurant;
  final List<Category>? categories;
  final List<Blog>? blogs;
    final List<TrendingFood>? trendingFoods;

  HomeDataModel({
    this.status,
    this.banner,
    this.restaurant,
    this.categories,
    this.blogs,
    this.trendingFoods,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        status: json["status"],
        banner: json["banner"] == null
            ? []
            : List<BannerData>.from(json["banner"]!.map((x) => BannerData.fromJson(x))),
        restaurant: json["restaurant"] == null
            ? []
            : List<Restaurant>.from(
                json["restaurant"]!.map((x) => Restaurant.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        blogs: json["blogs"] == null
            ? []
            : List<Blog>.from(json["blogs"]!.map((x) => Blog.fromJson(x))),
        trendingFoods: json["trendingFoods"] == null
            ? []
            : List<TrendingFood>.from(
                json["trendingFoods"]!.map((x) => TrendingFood.fromJson(x))),
      );
}

class BannerData {
  final String? id;
  final String? title;
  final String? type;
  final String? zoneId;
  final dynamic foodId;
  final String? image;
  final dynamic description;
  final String? restaurantId;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BannerData({
    this.id,
    this.title,
    this.type,
    this.zoneId,
    this.foodId,
    this.image,
    this.description,
    this.restaurantId,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        zoneId: json["zone_id"],
        foodId: json["food_id"],
        image: json["image"],
        description: json["description"],
        restaurantId: json["restaurant_id"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class Blog {
  final String? id;
  final String? blogName;
  final String? content;
  final dynamic image;
  final String? slug;
  final String? blogTypeId;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final BlogType? blogType;

  Blog({
    this.id,
    this.blogName,
    this.content,
    this.image,
    this.slug,
    this.blogTypeId,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.blogType,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        blogName: json["blog_name"],
        content: json["content"],
        image: json["image"],
        slug: json["slug"],
        blogTypeId: json["blog_type_id"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        blogType: json["blog_type"] == null
            ? null
            : BlogType.fromJson(json["blog_type"]),
      );
}

class BlogType {
  final String? id;
  final String? blogTypeName;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BlogType({
    this.id,
    this.blogTypeName,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory BlogType.fromJson(Map<String, dynamic> json) => BlogType(
        id: json["id"],
        blogTypeName: json["blog_type_name"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        priority: json["priority"],
        parentname: json["parentname"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        parent: json["parent"],
      );
}

class Restaurant {
  final String? id;
  final String? restaurantName;
  final String? phone;
  final String? email;
  final String? logo;
  final String? minimumDeliveryTime;
  final String? maximumDeliveryTime;
  final dynamic tinNumber;
  final dynamic date;
  final dynamic tags;
  final dynamic licenseDocument;
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
  final dynamic coverPhoto;
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
  final int? favorite;
  final bool? gstStatus;
  final String? gstCode;
  final bool? freeDeliveryDistanceStatus;
  final String? freeDeliveryDistanceValue;
  final List<dynamic>? translations;

  Restaurant({
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
    this.favorite,
    this.gstStatus,
    this.gstCode,
    this.freeDeliveryDistanceStatus,
    this.freeDeliveryDistanceValue,
    this.translations,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        restaurantName: json["restaurant_name"],
        phone: json["phone"],
        email: json["email"],
        logo: json["logo"],
        minimumDeliveryTime: json["minimum_delivery_time"],
        maximumDeliveryTime: json["maximum_delivery_time"],
        tinNumber: json["tin_number"],
        date: json["date"],
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
        rating: json["rating"] == null
            ? []
            : List<int>.from(json["rating"]!.map((x) => x)),
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
        openingTime: json["opening_time"] == null
            ? null
            : DateTime.parse(json["opening_time"]),
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        orderSubscriptionActive: json["order_subscription_active"],
        favorite: json["favorite"],
        gstStatus: json["gst_status"],
        gstCode: json["gst_code"],
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );
}

class TrendingFood {
  final String? id;
  final String? foodName;
  final String? description;
  final String? image;
  final String? categoryId;
  final dynamic categoryIds;
  final dynamic variations;
  final dynamic addOns;
  final dynamic attributes;
  final dynamic choiceOptions;
  final int? price;
  final int? tax;
  final String? taxType;
  final int? discount;
  final String? discountType;
  final dynamic availableTimeStarts;
  final dynamic availableTimeEnds;
  final int? veg;
  final int? status;
  final String? restaurantId;
  final int? avgRating;
  final String? ratingCount;
  final dynamic rating;
  final String? slug;
  final int? recommended;
  final int? orderCount;
  final dynamic minimumCartQuantity;
  final dynamic maximumCartQuantity;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? commentsCount;
  final List<dynamic>? translations;

  TrendingFood({
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
    this.commentsCount,
    this.translations,
  });

  factory TrendingFood.fromJson(Map<String, dynamic> json) => TrendingFood(
        id: json["id"],
        foodName: json["food_name"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryIds: json["category_ids"],
        variations: json["variations"],
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        commentsCount: json["comments_count"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );
}
