// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';

CategoryListModel categoryListModelFromJson(String str) => CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) => json.encode(data.toJson());

class CategoryListModel {
  final bool? status;
  final CategoryListData? data;

  CategoryListModel({
    this.status,
    this.data,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
        status: json["status"],
        data: json["data"] == null ? null : CategoryListData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class CategoryListData {
  final int? currentPage;
  final List<CategoryListDatum>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  CategoryListData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory CategoryListData.fromJson(Map<String, dynamic> json) => CategoryListData(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<CategoryListDatum>.from(json["data"]!.map((x) => CategoryListDatum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class CategoryListDatum {
  final String? id;
  final String? categoryName;
  final String? image;
  final String? slug;
  final dynamic parentId;
  final int? position;
  final int? isActive;
  final String? createdBy;
  final String? updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? priority;
  final String? parentname;
  final List<dynamic>? translations;
  final dynamic parent;

  CategoryListDatum({
    this.id,
    this.categoryName,
    this.image,
    this.slug,
    this.parentId,
    this.position,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.parentname,
    this.translations,
    this.parent,
  });

  factory CategoryListDatum.fromJson(Map<String, dynamic> json) => CategoryListDatum(
        id: json["id"],
        categoryName: json["category_name"],
        image: json["image"],
        slug: json["slug"],
        parentId: json["parent_id"],
        position: json["position"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        priority: json["priority"],
        parentname: json["parentname"],
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "image": image,
        "slug": slug,
        "parent_id": parentId,
        "position": position,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "priority": priority,
        "parentname": parentname,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
        "parent": parent,
      };
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
