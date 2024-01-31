// To parse this JSON data, do
//
//     final getCityModel = getCityModelFromJson(jsonString);

import 'dart:convert';

import 'get_state_model.dart';


GetCityModel getCityModelFromJson(String str) =>
    GetCityModel.fromJson(json.decode(str));

// String getCityModelToJson(GetCityModel data) => json.encode(data.toJson());

class GetCityModel {
  bool? status;
  List<City>? data;

  GetCityModel({
    this.status,
    this.data,
  });

  factory GetCityModel.fromJson(Map<String, dynamic> json) => GetCityModel(
        status: json["status"],
        data: List<City>.from(json["data"].map((x) => City.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  //     };
}

class City {
  int? id;
  int? stateId;
  String? cityName;
  String? latitude;
  String? longitude;
  int? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  StateList? state;

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
    // this.createdAt,
    // this.updatedAt,
    this.state,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] ?? 0,
        stateId: json["state_id"] ?? 0,
        cityName: json["city_name"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        isActive: json["is_active"] ?? 0,
        createdBy: json["created_by"] ?? "",
        updatedBy: json["updated_by"] ?? "",
        deletedAt: json["deleted_at"] ?? "",
        // createdAt: DateTime.parse(json["created_at"] ?? ""),
        // updatedAt: DateTime.parse(json["updated_at"] ?? ""),
        state: StateList.fromJson(json["state"] ?? {}),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "state_id": stateId,
  //       "city_name": cityName,
  //       "latitude": latitude,
  //       "longitude": longitude,
  //       "is_active": isActive,
  //       "created_by": createdBy,
  //       "updated_by": updatedBy,
  //       "deleted_at": deletedAt,
  //       "created_at": createdAt?.toIso8601String(),
  //       "updated_at": updatedAt?.toIso8601String(),
  //       "state": state?.toJson(),
  //     };
}
