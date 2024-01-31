// To parse this JSON data, do
//
//     final getAddressByIdModel = getAddressByIdModelFromJson(jsonString);

import 'dart:convert';

import 'package:foodapplication/model/get_city_model.dart';
import 'package:foodapplication/model/get_country_model.dart';
import 'package:foodapplication/model/get_state_model.dart';

GetAddressByIdModel getAddressByIdModelFromJson(String str) =>
    GetAddressByIdModel.fromJson(json.decode(str));

class GetAddressByIdModel {
  bool status;
  Data data;

  GetAddressByIdModel({
    required this.status,
    required this.data,
  });

  factory GetAddressByIdModel.fromJson(Map<String, dynamic> json) =>
      GetAddressByIdModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  String id;
  String addressType;
  String contactPersonNumber;
  String address;
  String latitude;
  String longitude;
  String userId;
  dynamic zoneId;
  String contactPersonName;
  String floor;
  dynamic road;
  String house;
  int isActive;
  dynamic isDefault;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int countryId;
  int stateId;
  int cityId;
  String zipCode;
  Country country;
  StateList state;
  City city;

  Data({
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
    required this.createdAt,
    required this.updatedAt,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.city,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        addressType: json["address_type"],
        contactPersonNumber: json["contact_person_number"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        userId: json["user_id"],
        zoneId: json["zone_id"],
        contactPersonName: json["contact_person_name"],
        floor: json["floor"],
        road: json["road"],
        house: json["house"],
        isActive: json["is_active"],
        isDefault: json["is_default"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        zipCode: json["zip_code"],
        country: Country.fromJson(json["country"]),
        state: StateList.fromJson(json["state"]),
        city: City.fromJson(json["city"]),
      );
}
