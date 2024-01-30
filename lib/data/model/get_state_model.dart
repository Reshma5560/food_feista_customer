// To parse this JSON data, do
//
//     final getStateModel = getStateModelFromJson(jsonString);

import 'dart:convert';

import 'get_country_model.dart';


GetStateModel getStateModelFromJson(String str) =>
    GetStateModel.fromJson(json.decode(str));

class GetStateModel {
  bool? status;
  List<StateList>? data;

  GetStateModel({
    this.status,
    this.data,
  });

  factory GetStateModel.fromJson(Map<String, dynamic> json) => GetStateModel(
        status: json["status"],
        data: List<StateList>.from(
            json["data"].map((x) => StateList.fromJson(x))),
      );
}

class StateList {
  int? id;
  int? countryId;
  String? stateName;
  int? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  Country? country;

  StateList({
    this.id,
    this.countryId,
    this.stateName,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    // this.createdAt,
    // this.updatedAt,
    this.country,
  });

  factory StateList.fromJson(Map<String, dynamic> json) => StateList(
        id: json["id"] ?? 0,
        countryId: json["country_id"] ?? 0,
        stateName: json["state_name"] ?? "",
        isActive: json["is_active"] ?? 0,
        createdBy: json["created_by"] ?? "",
        updatedBy: json["updated_by"] ?? "",
        deletedAt: json["deleted_at"] ?? "",
        // createdAt: DateTime.parse(json["created_at"] ?? ""),
        // updatedAt: DateTime.parse(json["updated_at"] ?? ""),
        country: Country.fromJson(json["country"] ?? {}),
      );
}

enum CountryName { INDIA }

final countryNameValues = EnumValues({"India": CountryName.INDIA});

enum ShortName { IN }

final shortNameValues = EnumValues({"IN": ShortName.IN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
