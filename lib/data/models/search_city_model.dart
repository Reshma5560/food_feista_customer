// To parse this JSON data, do
//
//     final searchCityModel = searchCityModelFromJson(jsonString);

import 'dart:convert';

SearchCityModel searchCityModelFromJson(String str) => SearchCityModel.fromJson(json.decode(str));


class SearchCityModel {
  final bool? status;
  final SearchCity? data;

  SearchCityModel({
    this.status,
    this.data,
  });

  factory SearchCityModel.fromJson(Map<String, dynamic> json) => SearchCityModel(
    status: json["status"],
    data: json["data"] == null ? null : SearchCity.fromJson(json["data"]),
  );


}

class SearchCity {
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

  SearchCity({
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

  factory SearchCity.fromJson(Map<String, dynamic> json) => SearchCity(
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


}
