// To parse this JSON data, do
//
//     final getAddressModel = getAddressModelFromJson(jsonString);

import 'dart:convert';

import 'package:foodapplication/data/models/get_city_model.dart';
import 'package:foodapplication/data/models/get_country_model.dart';

import 'get_state_model.dart';

GetAddressModel getAddressModelFromJson(String str) =>
    GetAddressModel.fromJson(json.decode(str));

class GetAddressModel {
  bool status;
  List<Datum> data;

  GetAddressModel({
    required this.status,
    required this.data,
  });

  factory GetAddressModel.fromJson(Map<String, dynamic> json) =>
      GetAddressModel(
        status: json["status"],
        data: List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //     };
}

class Datum {
  String id;
  String addressType;
  String contactPersonNumber;
  String address;
  String latitude;
  String longitude;
  String userId;
  dynamic zoneId;
  String contactPersonName;
  dynamic floor;
  dynamic road;
  dynamic house;
  int isActive;
  dynamic isDefault;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  // DateTime createdAt;
  // DateTime updatedAt;
  int countryId;
  int stateId;
  int cityId;
  String zipCode;
  Country country;
  StateList state;
  City city;

  Datum({
    required this.id,
    required this.addressType,
    required this.contactPersonNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.zoneId,
    required this.contactPersonName,
    required this.floor,
    required this.road,
    required this.house,
    required this.isActive,
    required this.isDefault,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    // required this.createdAt,
    // required this.updatedAt,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.city,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? "",
        addressType: json["address_type"] ?? "",
        contactPersonNumber: json["contact_person_number"] ?? "",
        address: json["address"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        userId: json["user_id"] ?? "",
        zoneId: json["zone_id"] ?? "",
        contactPersonName: json["contact_person_name"] ?? "",
        floor: json["floor"] ?? "",
        road: json["road"] ?? "",
        house: json["house"] ?? "",
        isActive: json["is_active"] ?? 0,
        isDefault: json["is_default"] ?? "",
        createdBy: json["created_by"] ?? "",
        updatedBy: json["updated_by"] ?? "",
        deletedAt: json["deleted_at"] ?? "",
        // createdAt: DateTime.parse(json["created_at"]??""),
        // updatedAt: DateTime.parse(json["updated_at"]??""),
        countryId: json["country_id"] ?? 0,
        stateId: json["state_id"] ?? 0,
        cityId: json["city_id"] ?? 0,
        zipCode: json["zip_code"],
        country: Country.fromJson(json["country"] ?? {}),
        state: StateList.fromJson(json["state"] ?? {}),
        city: City.fromJson(json["city"] ?? {}),
      );
}
