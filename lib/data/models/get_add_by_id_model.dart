// To parse this JSON data, do
//
//     final getAddressByIdModel = getAddressByIdModelFromJson(jsonString);

import 'dart:convert';

GetAddressByIdModel getAddressByIdModelFromJson(String str) => GetAddressByIdModel.fromJson(json.decode(str));

class GetAddressByIdModel {
  bool status;
  Data data;

  GetAddressByIdModel({
    required this.status,
    required this.data,
  });

  factory GetAddressByIdModel.fromJson(Map<String, dynamic> json) => GetAddressByIdModel(
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
  CountryData country;
  StateData state;
  CityData city;

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
        floor: json["floor"] ?? "",
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
        country: CountryData.fromJson(json["country"]),
        state: StateData.fromJson(json["state"]),
        city: CityData.fromJson(json["city"]),
      );
}

class CityData {
  int id;
  int stateId;
  String cityName;
  String latitude;
  String longitude;
  int isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  CityData({
    required this.id,
    required this.stateId,
    required this.cityName,
    required this.latitude,
    required this.longitude,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        id: json["id"],
        stateId: json["state_id"],
        cityName: json["city_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class CountryData {
  int id;
  String countryName;
  String shortName;
  String countryCode;
  int isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  CountryData({
    required this.id,
    required this.countryName,
    required this.shortName,
    required this.countryCode,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        id: json["id"],
        countryName: json["country_name"],
        shortName: json["short_name"],
        countryCode: json["country_code"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class StateData {
  int id;
  int countryId;
  String stateName;
  int isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  StateData({
    required this.id,
    required this.countryId,
    required this.stateName,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
        id: json["id"],
        countryId: json["country_id"],
        stateName: json["state_name"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
