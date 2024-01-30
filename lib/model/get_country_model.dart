// To parse this JSON data, do
//
//     final getCountryModel = getCountryModelFromJson(jsonString);

import 'dart:convert';

GetCountryModel getCountryModelFromJson(String str) =>
    GetCountryModel.fromJson(json.decode(str));

// String getCountryModelToJson(GetCountryModel data) =>
//     json.encode(data.toJson());

class GetCountryModel {
  bool? status;
  List<Country>? data;

  GetCountryModel({
    this.status,
    this.data,
  });

  factory GetCountryModel.fromJson(Map<String, dynamic> json) =>
      GetCountryModel(
        status: json["status"],
        data: List<Country>.from(json["data"].map((x) => Country.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  //     };
}

class Country {
  int? id;
  String? countryName;
  String? shortName;
  String? countryCode;
  int? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  // DateTime? createdAt;
  // DateTime? updatedAt;

  Country({
    this.id,
    this.countryName,
    this.shortName,
    this.countryCode,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    // this.createdAt,
    // this.updatedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"] ?? 0,
        countryName: json["country_name"] ?? "",
        shortName: json["short_name"] ?? "",
        countryCode: json["country_code"] ?? "",
        isActive: json["is_active"] ?? 0,
        createdBy: json["created_by"] ?? "",
        updatedBy: json["updated_by"] ?? "",
        deletedAt: json["deleted_at"] ?? "",
        // createdAt: DateTime.parse(json["created_at"] ),
        // updatedAt: DateTime.parse(json["updated_at"] ?? ""),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "country_name": countryName,
  //       "short_name": shortName,
  //       "country_code": countryCode,
  //       "is_active": isActive,
  //       "created_by": createdBy,
  //       "updated_by": updatedBy,
  //       "deleted_at": deletedAt,
  //       "created_at": createdAt?.toIso8601String(),
  //       "updated_at": updatedAt?.toIso8601String(),
  //     };
}
