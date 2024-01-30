// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  final bool status;
  final String message;
  final String token;
  final User user;

  UserDataModel({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final dynamic image;
  final int isPhoneVerified;
  final dynamic emailVerifiedAt;
  final dynamic emailVerificationToken;
  final dynamic cmFirebaseToken;
  final int isActive;
  final int newsletterSubscribe;
  final int isVerified;
  final String verifyCode;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int orderCount;
  final dynamic loginMedium;
  final dynamic socialId;
  final dynamic zoneId;
  final int walletBalance;
  final int loyaltyPoint;
  final dynamic refCode;
  final dynamic refBy;
  final String tempToken;
  final String currentLanguageKey;
  final List<UserRole> roles;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.image,
    required this.isPhoneVerified,
    required this.emailVerifiedAt,
    required this.emailVerificationToken,
    required this.cmFirebaseToken,
    required this.isActive,
    required this.newsletterSubscribe,
    required this.isVerified,
    required this.verifyCode,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.orderCount,
    required this.loginMedium,
    required this.socialId,
    required this.zoneId,
    required this.walletBalance,
    required this.loyaltyPoint,
    required this.refCode,
    required this.refBy,
    required this.tempToken,
    required this.currentLanguageKey,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    email: json["email"],
    image: json["image"],
    isPhoneVerified: json["is_phone_verified"],
    emailVerifiedAt: json["email_verified_at"],
    emailVerificationToken: json["email_verification_token"],
    cmFirebaseToken: json["cm_firebase_token"],
    isActive: json["is_active"],
    newsletterSubscribe: json["newsletter_subscribe"],
    isVerified: json["is_verified"],
    verifyCode: json["verify_code"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
    orderCount: json["order_count"],
    loginMedium: json["login_medium"],
    socialId: json["social_id"],
    zoneId: json["zone_id"],
    walletBalance: json["wallet_balance"],
    loyaltyPoint: json["loyalty_point"],
    refCode: json["ref_code"],
    refBy: json["ref_by"],
    tempToken: json["temp_token"],
    currentLanguageKey: json["current_language_key"],
    roles: List<UserRole>.from(json["roles"].map((x) => UserRole.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "image": image,
    "is_phone_verified": isPhoneVerified,
    "email_verified_at": emailVerifiedAt,
    "email_verification_token": emailVerificationToken,
    "cm_firebase_token": cmFirebaseToken,
    "is_active": isActive,
    "newsletter_subscribe": newsletterSubscribe,
    "is_verified": isVerified,
    "verify_code": verifyCode,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "status": status,
    "order_count": orderCount,
    "login_medium": loginMedium,
    "social_id": socialId,
    "zone_id": zoneId,
    "wallet_balance": walletBalance,
    "loyalty_point": loyaltyPoint,
    "ref_code": refCode,
    "ref_by": refBy,
    "temp_token": tempToken,
    "current_language_key": currentLanguageKey,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class UserRole {
  final String id;
  final String name;
  final String guardName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  UserRole({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  final String modelType;
  final String modelUuid;
  final String roleId;

  Pivot({
    required this.modelType,
    required this.modelUuid,
    required this.roleId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelType: json["model_type"],
    modelUuid: json["model_uuid"],
    roleId: json["role_id"],
  );

  Map<String, dynamic> toJson() => {
    "model_type": modelType,
    "model_uuid": modelUuid,
    "role_id": roleId,
  };
}
