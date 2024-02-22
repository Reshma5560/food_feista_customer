// To parse this JSON data, do
//
//     final cmsPagesModel = cmsPagesModelFromJson(jsonString);

import 'dart:convert';

CmsPagesModel cmsPagesModelFromJson(String str) => CmsPagesModel.fromJson(json.decode(str));

String cmsPagesModelToJson(CmsPagesModel data) => json.encode(data.toJson());

class CmsPagesModel {
  final bool? status;
  final List<CmsDatum>? data;

  CmsPagesModel({
    this.status,
    this.data,
  });

  factory CmsPagesModel.fromJson(Map<String, dynamic> json) => CmsPagesModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<CmsDatum>.from(json["data"]!.map((x) => CmsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CmsDatum {
  final String? id;
  final String? cmsPageName;
  final String? body;
  final String? url;
  final String? metaTitle;
  final String? metaTag;
  final String? metaTagKeyword;
  final String? metaDescription;
  final int? isActive;
  final int? isShow;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CmsDatum({
    this.id,
    this.cmsPageName,
    this.body,
    this.url,
    this.metaTitle,
    this.metaTag,
    this.metaTagKeyword,
    this.metaDescription,
    this.isActive,
    this.isShow,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory CmsDatum.fromJson(Map<String, dynamic> json) => CmsDatum(
        id: json["id"],
        cmsPageName: json["cms_page_name"],
        body: json["body"],
        url: json["url"],
        metaTitle: json["meta_title"],
        metaTag: json["meta_tag"],
        metaTagKeyword: json["meta_tag_keyword"],
        metaDescription: json["meta_description"],
        isActive: json["is_active"],
        isShow: json["is_show"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cms_page_name": cmsPageName,
        "body": body,
        "url": url,
        "meta_title": metaTitle,
        "meta_tag": metaTag,
        "meta_tag_keyword": metaTagKeyword,
        "meta_description": metaDescription,
        "is_active": isActive,
        "is_show": isShow,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
