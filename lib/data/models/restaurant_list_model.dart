// To parse this JSON data, do
//
//     final restaurantListModel = restaurantListModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

RestaurantListModel restaurantListModelFromJson(String str) => RestaurantListModel.fromJson(json.decode(str));

String restaurantListModelToJson(RestaurantListModel data) => json.encode(data.toJson());

class RestaurantListModel {
  final bool? success;
  final RestaurantListData? data;

  RestaurantListModel({
    this.success,
    this.data,
  });

  factory RestaurantListModel.fromJson(Map<String, dynamic> json) => RestaurantListModel(
        success: json["success"],
        data: json["data"] == null ? null : RestaurantListData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class RestaurantListData {
  final int? currentPage;
  final List<RestaurantListDatum>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  RestaurantListData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory RestaurantListData.fromJson(Map<String, dynamic> json) => RestaurantListData(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<RestaurantListDatum>.from(json["data"]!.map((x) => RestaurantListDatum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class RestaurantListDatum {
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
  final dynamic gst;
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
  final dynamic freeDeliveryDistance;
  final dynamic additionalData;
  final dynamic additionalDocuments;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final int? isActive;
  final int? isVerify;
  final int? closeTemporarily;
  final RxInt? favorite;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? orderSubscriptionActive;
  final double? distance;
  final String? distanceKm;
  final bool? freeDeliveryDistanceStatus;
  final String? freeDeliveryDistanceValue;
  final String? zoneName;
  final String? ratingCount;
  final int? commentsCount;
  final List<Cuisine>? cuisine;
  final City? city;
  final List<dynamic>? translations;
  final Zone? zone;

  RestaurantListDatum({
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
    this.gst,
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
    this.freeDeliveryDistance,
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
    this.distance,
    this.distanceKm,
    this.freeDeliveryDistanceStatus,
    this.freeDeliveryDistanceValue,
    this.zoneName,
    this.ratingCount,
    this.commentsCount,
    this.cuisine,
    this.city,
    this.translations,
    this.zone,
    this.favorite,
  });

  factory RestaurantListDatum.fromJson(Map<String, dynamic> json) => RestaurantListDatum(
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
        gst: json["gst"],
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
        freeDeliveryDistance: json["free_delivery_distance"],
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
        distance: json["distance"]?.toDouble(),
        distanceKm: json["distance_km"],
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        zoneName: json["zone_name"],
        ratingCount: json["rating_count"],
        commentsCount: json["comments_count"],
        favorite: RxInt(json["favorite"] ?? "0"),
        cuisine: json["cuisine"] == null ? [] : List<Cuisine>.from(json["cuisine"]!.map((x) => Cuisine.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
        zone: json["zone"] == null ? null : Zone.fromJson(json["zone"]),
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
        "gst": gst,
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
        "free_delivery_distance": freeDeliveryDistance,
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
        "distance": distance,
        "distance_km": distanceKm,
        "free_delivery_distance_status": freeDeliveryDistanceStatus,
        "free_delivery_distance_value": freeDeliveryDistanceValue,
        "zone_name": zoneName,
        "rating_count": ratingCount,
        "comments_count": commentsCount,
        "cuisine": cuisine == null ? [] : List<dynamic>.from(cuisine!.map((x) => x.toJson())),
        "city": city?.toJson(),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
        "zone": zone?.toJson(),
      };
}

class City {
  final int? id;
  final int? stateId;
  final String? cityName;
  final String? latitude;
  final String? longitude;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  City({
    this.id,
    this.stateId,
    this.cityName,
    this.latitude,
    this.longitude,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        stateId: json["state_id"],
        cityName: json["city_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_id": stateId,
        "city_name": cityName,
        "latitude": latitude,
        "longitude": longitude,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
  final Pivot? pivot;

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
    this.pivot,
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
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
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
        "pivot": pivot?.toJson(),
      };
}

class Pivot {
  final String? restaurantId;
  final String? cuisineId;

  Pivot({
    this.restaurantId,
    this.cuisineId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        restaurantId: json["restaurant_id"],
        cuisineId: json["cuisine_id"],
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "cuisine_id": cuisineId,
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
  final String? createdBy;
  final String? updatedBy;
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
        "parentname": parentname,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
        "parent": parent,
      };
}

class Zone {
  final String? id;
  final String? zoneName;
  final int? minimumDeliveryCharge;
  final int? maximumDeliveryCharge;
  final int? perKmDeliveryCharge;
  final int? maxCodOrderAmount;
  final int? increasedDeliveryCharge;
  final dynamic increaseDeliveryChargeMessage;
  final int? increasedDeliveryFeeStatus;
  final dynamic coordinates;
  final dynamic restaurantWiseTopic;
  final dynamic customerWiseTopic;
  final dynamic deliverymanWiseTopic;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? cityId;

  Zone({
    this.id,
    this.zoneName,
    this.minimumDeliveryCharge,
    this.maximumDeliveryCharge,
    this.perKmDeliveryCharge,
    this.maxCodOrderAmount,
    this.increasedDeliveryCharge,
    this.increaseDeliveryChargeMessage,
    this.increasedDeliveryFeeStatus,
    this.coordinates,
    this.restaurantWiseTopic,
    this.customerWiseTopic,
    this.deliverymanWiseTopic,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.cityId,
  });

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json["id"],
        zoneName: json["zone_name"],
        minimumDeliveryCharge: json["minimum_delivery_charge"],
        maximumDeliveryCharge: json["maximum_delivery_charge"],
        perKmDeliveryCharge: json["per_km_delivery_charge"],
        maxCodOrderAmount: json["max_cod_order_amount"],
        increasedDeliveryCharge: json["increased_delivery_charge"],
        increaseDeliveryChargeMessage: json["increase_delivery_charge_message"],
        increasedDeliveryFeeStatus: json["increased_delivery_fee_status"],
        coordinates: json["coordinates"],
        restaurantWiseTopic: json["restaurant_wise_topic"],
        customerWiseTopic: json["customer_wise_topic"],
        deliverymanWiseTopic: json["deliveryman_wise_topic"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        cityId: json["city_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zone_name": zoneName,
        "minimum_delivery_charge": minimumDeliveryCharge,
        "maximum_delivery_charge": maximumDeliveryCharge,
        "per_km_delivery_charge": perKmDeliveryCharge,
        "max_cod_order_amount": maxCodOrderAmount,
        "increased_delivery_charge": increasedDeliveryCharge,
        "increase_delivery_charge_message": increaseDeliveryChargeMessage,
        "increased_delivery_fee_status": increasedDeliveryFeeStatus,
        "coordinates": coordinates,
        "restaurant_wise_topic": restaurantWiseTopic,
        "customer_wise_topic": customerWiseTopic,
        "deliveryman_wise_topic": deliverymanWiseTopic,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "city_id": cityId,
      };
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
