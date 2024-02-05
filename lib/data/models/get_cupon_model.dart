// To parse this JSON data, do
//
//     final getCuponModel = getCuponModelFromJson(jsonString);

import 'dart:convert';

GetCouponModel getCouponModelFromJson(String str) => GetCouponModel.fromJson(json.decode(str));

String getCouponModelToJson(GetCouponModel data) => json.encode(data.toJson());

class GetCouponModel {
  final bool? status;
  final List<Datum>? data;

  GetCouponModel({
    this.status,
    this.data,
  });

  factory GetCouponModel.fromJson(Map<String, dynamic> json) => GetCouponModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
