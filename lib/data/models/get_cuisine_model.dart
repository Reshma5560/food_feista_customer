// To parse this JSON data, do
//
//     final getCuisineModel = getCuisineModelFromJson(jsonString);

import 'dart:convert';

GetCuisineModel getCuisineModelFromJson(String str) =>
    GetCuisineModel.fromJson(json.decode(str));

String getCuisineModelToJson(GetCuisineModel data) =>
    json.encode(data.toJson());

class GetCuisineModel {
  final bool? status;
  final List<CuisineDatum>? data;

  GetCuisineModel({
    this.status,
    this.data,
  });

  factory GetCuisineModel.fromJson(Map<String, dynamic> json) =>
      GetCuisineModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<CuisineDatum>.from(
                json["data"]!.map((x) => CuisineDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CuisineDatum {
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

  CuisineDatum({
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

  factory CuisineDatum.fromJson(Map<String, dynamic> json) => CuisineDatum(
        id: json["id"],
        cuisineName: json["cuisine_name"],
        image: json["image"],
        slug: json["slug"],
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
