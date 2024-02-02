// To parse this JSON data, do
//
//     final getOrderModel = getOrderModelFromJson(jsonString);

import 'dart:convert';

GetOrderModel getOrderModelFromJson(String str) => GetOrderModel.fromJson(json.decode(str));

class GetOrderModel {
  bool? status;
  List<OrderList>? data;

  GetOrderModel({
    this.status,
    this.data,
  });

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
        status: json["status"],
        data: List<OrderList>.from(json["data"].map((x) => OrderList.fromJson(x))),
      );
}

class OrderList {
  String id;
  String invoiceNumber;
  String userId;
  String orderStatusId;
  String paymentStatusId;
  String paymentTypeId;
  int orderAmount;
  String? totalDiscount;
  int totalTaxAmount;
  int deliveryCharge;
  int restaurantDiscountAmount;
  int originalDeliveryCharge;
  dynamic transactionReference;
  String? deliveryAddressId;
  dynamic deliveryManId;
  dynamic deliveryManRemarks;
  dynamic couponCode;
  String? orderNote;
  dynamic deliveryDate;
  String orderType;
  int checked;
  String restaurantId;
  String adjustment;
  String discountTotal;
  int edited;
  dynamic otp;
  dynamic pending;
  dynamic accepted;
  dynamic confirmed;
  dynamic processing;
  dynamic handover;
  dynamic pickedUp;
  dynamic delivered;
  dynamic canceled;
  dynamic refundRequested;
  dynamic refunded;
  dynamic failed;
  dynamic cancellationNote;
  dynamic cancellationReason;
  dynamic canceledBy;
  dynamic refundRequestCanceled;
  dynamic taxPercentage;
  dynamic deliveryInstruction;
  dynamic unavailableItemNote;
  bool cutlery;
  int distance;
  bool isGuest;
  dynamic deliveryAddress;
  dynamic zoneId;
  int dmTips;
  dynamic taxStatus;
  dynamic vehicleId;
  dynamic scheduleAt;
  int scheduled;
  dynamic processingTime;
  dynamic callback;
  int additionalCharge;
  int partiallyPaidAmount;
  dynamic orderProof;
  dynamic couponCreatedBy;
  dynamic freeDeliveryBy;
  int orderSubscriptionActive;
  int isActive;
  String createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String discountOnProductBy;
  dynamic subscriptionId;
  User user;
  Status orderStatus;
  Status paymentStatus;
  PaymentType paymentType;
  Restaurant restaurant;
  List<OrderDetail> orderDetail;

  OrderList({
    required this.id,
    required this.invoiceNumber,
    required this.userId,
    required this.orderStatusId,
    required this.paymentStatusId,
    required this.paymentTypeId,
    required this.orderAmount,
    this.totalDiscount,
    required this.totalTaxAmount,
    required this.deliveryCharge,
    required this.restaurantDiscountAmount,
    required this.originalDeliveryCharge,
    required this.transactionReference,
    this.deliveryAddressId,
    required this.deliveryManId,
    required this.deliveryManRemarks,
    required this.couponCode,
    this.orderNote,
    required this.deliveryDate,
    required this.orderType,
    required this.checked,
    required this.restaurantId,
    required this.adjustment,
    required this.discountTotal,
    required this.edited,
    required this.otp,
    required this.pending,
    required this.accepted,
    required this.confirmed,
    required this.processing,
    required this.handover,
    required this.pickedUp,
    required this.delivered,
    required this.canceled,
    required this.refundRequested,
    required this.refunded,
    required this.failed,
    required this.cancellationNote,
    required this.cancellationReason,
    required this.canceledBy,
    required this.refundRequestCanceled,
    required this.taxPercentage,
    required this.deliveryInstruction,
    required this.unavailableItemNote,
    required this.cutlery,
    required this.distance,
    required this.isGuest,
    required this.deliveryAddress,
    required this.zoneId,
    required this.dmTips,
    required this.taxStatus,
    required this.vehicleId,
    required this.scheduleAt,
    required this.scheduled,
    required this.processingTime,
    required this.callback,
    required this.additionalCharge,
    required this.partiallyPaidAmount,
    required this.orderProof,
    required this.couponCreatedBy,
    required this.freeDeliveryBy,
    required this.orderSubscriptionActive,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.discountOnProductBy,
    required this.subscriptionId,
    required this.user,
    required this.orderStatus,
    required this.paymentStatus,
    required this.paymentType,
    required this.restaurant,
    required this.orderDetail,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        id: json["id"],
        invoiceNumber: json["invoice_number"],
        userId: json["user_id"],
        orderStatusId: json["order_status_id"],
        paymentStatusId: json["payment_status_id"],
        paymentTypeId: json["payment_type_id"],
        orderAmount: json["order_amount"],
        totalDiscount: json["total_discount"] ?? "",
        totalTaxAmount: json["total_tax_amount"],
        deliveryCharge: json["delivery_charge"],
        restaurantDiscountAmount: json["restaurant_discount_amount"],
        originalDeliveryCharge: json["original_delivery_charge"],
        transactionReference: json["transaction_reference"],
        deliveryAddressId: json["delivery_address_id"] ?? "",
        deliveryManId: json["delivery_man_id"],
        deliveryManRemarks: json["delivery_man_remarks"],
        couponCode: json["coupon_code"],
        orderNote: json["order_note"],
        deliveryDate: json["delivery_date"],
        orderType: json["order_type"],
        checked: json["checked"],
        restaurantId: json["restaurant_id"],
        adjustment: json["adjustment"],
        discountTotal: json["discount_total"],
        edited: json["edited"],
        otp: json["otp"],
        pending: json["pending"],
        accepted: json["accepted"],
        confirmed: json["confirmed"],
        processing: json["processing"],
        handover: json["handover"],
        pickedUp: json["picked_up"],
        delivered: json["delivered"],
        canceled: json["canceled"],
        refundRequested: json["refund_requested"],
        refunded: json["refunded"],
        failed: json["failed"],
        cancellationNote: json["cancellation_note"],
        cancellationReason: json["cancellation_reason"],
        canceledBy: json["canceled_by"],
        refundRequestCanceled: json["refund_request_canceled"],
        taxPercentage: json["tax_percentage"],
        deliveryInstruction: json["delivery_instruction"],
        unavailableItemNote: json["unavailable_item_note"],
        cutlery: json["cutlery"],
        distance: json["distance"],
        isGuest: json["is_guest"],
        deliveryAddress: json["delivery_address"],
        zoneId: json["zone_id"],
        dmTips: json["dm_tips"],
        taxStatus: json["tax_status"],
        vehicleId: json["vehicle_id"],
        scheduleAt: json["schedule_at"],
        scheduled: json["scheduled"],
        processingTime: json["processing_time"],
        callback: json["callback"],
        additionalCharge: json["additional_charge"],
        partiallyPaidAmount: json["partially_paid_amount"],
        orderProof: json["order_proof"],
        couponCreatedBy: json["coupon_created_by"],
        freeDeliveryBy: json["free_delivery_by"],
        orderSubscriptionActive: json["order_subscription_active"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        discountOnProductBy: json["discount_on_product_by"],
        subscriptionId: json["subscription_id"],
        user: User.fromJson(json["user"]),
        orderStatus: Status.fromJson(json["order_status"]),
        paymentStatus: Status.fromJson(json["payment_status"]),
        paymentType: PaymentType.fromJson(json["payment_type"]),
        restaurant: Restaurant.fromJson(json["restaurant"]),
        orderDetail: List<OrderDetail>.from(json["order_detail"].map((x) => OrderDetail.fromJson(x))),
      );
}

class OrderDetail {
  String id;
  String orderId;
  String foodId;
  String price;
  String totalAmount;
  dynamic tax;
  dynamic discount;
  List<Variant> variant;
  List<dynamic> addon;
  int quantity;
  dynamic foodDetails;
  DateTime createdAt;
  DateTime updatedAt;
  Food food;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.foodId,
    required this.price,
    required this.totalAmount,
    required this.tax,
    required this.discount,
    required this.variant,
    required this.addon,
    required this.quantity,
    required this.foodDetails,
    required this.createdAt,
    required this.updatedAt,
    required this.food,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        foodId: json["food_id"],
        price: json["price"].toString(),
        totalAmount: json["total_amount"],
        tax: json["tax"],
        discount: json["discount"],
        variant: List<Variant>.from(json["variant"].map((x) => Variant.fromJson(x))),
        addon: List<dynamic>.from(json["addon"].map((x) => x)),
        quantity: json["quantity"],
        foodDetails: json["food_details"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        food: Food.fromJson(json["food"]),
      );
}

class Food {
  String id;
  String foodName;
  String description;
  String image;
  String categoryId;
  dynamic categoryIds;
  dynamic variations;
  dynamic addOns;
  dynamic attributes;
  dynamic choiceOptions;
  int price;
  int tax;
  String taxType;
  double discount;
  String discountType;
  dynamic availableTimeStarts;
  dynamic availableTimeEnds;
  int veg;
  int status;
  String restaurantId;
  int avgRating;
  String ratingCount;
  dynamic rating;
  String slug;
  int recommended;
  int orderCount;
  int minimumCartQuantity;
  int maximumCartQuantity;
  int isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int commentsCount;
  List<dynamic> translations;

  Food({
    required this.id,
    required this.foodName,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.categoryIds,
    required this.variations,
    required this.addOns,
    required this.attributes,
    required this.choiceOptions,
    required this.price,
    required this.tax,
    required this.taxType,
    required this.discount,
    required this.discountType,
    required this.availableTimeStarts,
    required this.availableTimeEnds,
    required this.veg,
    required this.status,
    required this.restaurantId,
    required this.avgRating,
    required this.ratingCount,
    required this.rating,
    required this.slug,
    required this.recommended,
    required this.orderCount,
    required this.minimumCartQuantity,
    required this.maximumCartQuantity,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.commentsCount,
    required this.translations,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        foodName: json["food_name"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryIds: json["category_ids"],
        variations: json["variations"],
        addOns: json["add_ons"],
        attributes: json["attributes"],
        choiceOptions: json["choice_options"],
        price: json["price"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: double.parse(json["discount"].toString()),
        discountType: json["discount_type"],
        availableTimeStarts: json["available_time_starts"],
        availableTimeEnds: json["available_time_ends"],
        veg: json["veg"],
        status: json["status"],
        restaurantId: json["restaurant_id"],
        avgRating: json["avg_rating"],
        ratingCount: json["rating_count"],
        rating: json["rating"],
        slug: json["slug"],
        recommended: json["recommended"],
        orderCount: json["order_count"],
        minimumCartQuantity: json["minimum_cart_quantity"],
        maximumCartQuantity: json["maximum_cart_quantity"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        commentsCount: json["comments_count"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );
}

class Variant {
  String id;
  String foodId;
  String foodVariationId;
  String variationOptionName;
  String price;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Variant({
    required this.id,
    required this.foodId,
    required this.foodVariationId,
    required this.variationOptionName,
    required this.price,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        foodId: json["food_id"],
        foodVariationId: json["food_variation_id"],
        variationOptionName: json["variation_option_name"],
        price: json["price"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class Status {
  String id;
  String status;
  String statusName;
  int isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Status({
    required this.id,
    required this.status,
    required this.statusName,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        status: json["status"],
        statusName: json["status_name"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class PaymentType {
  String id;
  String paymentTypeName;
  String description;
  String value;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentType({
    required this.id,
    required this.paymentTypeName,
    required this.description,
    required this.value,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"],
        paymentTypeName: json["payment_type_name"],
        description: json["description"],
        value: json["value"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class Restaurant {
  String id;
  String restaurantName;
  String phone;
  String email;
  String logo;
  String minimumDeliveryTime;
  String maximumDeliveryTime;
  dynamic tinNumber;
  dynamic date;
  dynamic tags;
  dynamic licenseDocument;
  String latitude;
  String longitude;
  String address;
  dynamic footerText;
  String minimumOrderAmount;
  int minimumShippingCharge;
  dynamic perKmShippingCharge;
  bool freeDelivery;
  String userId;
  List<int> rating;
  int homeDelivery;
  bool takeAway;
  bool cutlery;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int tax;
  dynamic commission;
  dynamic coverPhoto;
  String slug;
  dynamic qrCode;
  String offDay;
  DateTime openingTime;
  String closingTime;
  String zoneId;
  int announcement;
  dynamic announcementMessage;
  int veg;
  int nonVeg;
  int selfDeliverySystem;
  bool posSystem;
  dynamic deliveryTime;
  int scheduleDelivery;
  bool foodSection;
  bool reviewsSection;
  String restaurantModel;
  int orderCount;
  int totalOrder;
  dynamic maximumShippingCharge;
  dynamic additionalData;
  dynamic additionalDocuments;
  int countryId;
  int stateId;
  int cityId;
  int isActive;
  int isVerify;
  int closeTemporarily;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  bool orderSubscriptionActive;
  bool gstStatus;
  String gstCode;
  bool freeDeliveryDistanceStatus;
  String freeDeliveryDistanceValue;
  List<dynamic> translations;

  Restaurant({
    required this.id,
    required this.restaurantName,
    required this.phone,
    required this.email,
    required this.logo,
    required this.minimumDeliveryTime,
    required this.maximumDeliveryTime,
    required this.tinNumber,
    required this.date,
    required this.tags,
    required this.licenseDocument,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.footerText,
    required this.minimumOrderAmount,
    required this.minimumShippingCharge,
    required this.perKmShippingCharge,
    required this.freeDelivery,
    required this.userId,
    required this.rating,
    required this.homeDelivery,
    required this.takeAway,
    required this.cutlery,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.tax,
    required this.commission,
    required this.coverPhoto,
    required this.slug,
    required this.qrCode,
    required this.offDay,
    required this.openingTime,
    required this.closingTime,
    required this.zoneId,
    required this.announcement,
    required this.announcementMessage,
    required this.veg,
    required this.nonVeg,
    required this.selfDeliverySystem,
    required this.posSystem,
    required this.deliveryTime,
    required this.scheduleDelivery,
    required this.foodSection,
    required this.reviewsSection,
    required this.restaurantModel,
    required this.orderCount,
    required this.totalOrder,
    required this.maximumShippingCharge,
    required this.additionalData,
    required this.additionalDocuments,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.isActive,
    required this.isVerify,
    required this.closeTemporarily,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.orderSubscriptionActive,
    required this.gstStatus,
    required this.gstCode,
    required this.freeDeliveryDistanceStatus,
    required this.freeDeliveryDistanceValue,
    required this.translations,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        restaurantName: json["restaurant_name"],
        phone: json["phone"],
        email: json["email"],
        logo: json["logo"],
        minimumDeliveryTime: json["minimum_delivery_time"],
        maximumDeliveryTime: json["maximum_delivery_time"],
        tinNumber: json["tin_number"],
        date: json["date"],
        tags: json["tags"],
        licenseDocument: json["license_document"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        footerText: json["footer_text"],
        minimumOrderAmount: json["minimum_order_amount"],
        minimumShippingCharge: json["minimum_shipping_charge"],
        perKmShippingCharge: json["per_km_shipping_charge"],
        freeDelivery: json["free_delivery"],
        userId: json["user_id"],
        rating: List<int>.from(json["rating"].map((x) => x)),
        homeDelivery: json["home_delivery"],
        takeAway: json["take_away"],
        cutlery: json["cutlery"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImage: json["meta_image"],
        tax: json["tax"],
        commission: json["commission"],
        coverPhoto: json["cover_photo"],
        slug: json["slug"],
        qrCode: json["qr_code"],
        offDay: json["off_day"],
        openingTime: DateTime.parse(json["opening_time"]),
        closingTime: json["closing_time"],
        zoneId: json["zone_id"],
        announcement: json["announcement"],
        announcementMessage: json["announcement_message"],
        veg: json["veg"],
        nonVeg: json["non_veg"],
        selfDeliverySystem: json["self_delivery_system"],
        posSystem: json["pos_system"],
        deliveryTime: json["delivery_time"],
        scheduleDelivery: json["schedule_delivery"],
        foodSection: json["food_section"],
        reviewsSection: json["reviews_section"],
        restaurantModel: json["restaurant_model"],
        orderCount: json["order_count"],
        totalOrder: json["total_order"],
        maximumShippingCharge: json["maximum_shipping_charge"],
        additionalData: json["additional_data"],
        additionalDocuments: json["additional_documents"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        isActive: json["is_active"],
        isVerify: json["is_verify"],
        closeTemporarily: json["close_temporarily"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        orderSubscriptionActive: json["order_subscription_active"],
        gstStatus: json["gst_status"],
        gstCode: json["gst_code"],
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );
}

class User {
  String id;
  String firstName;
  String lastName;
  String phone;
  String email;
  dynamic image;
  int isPhoneVerified;
  dynamic emailVerifiedAt;
  dynamic emailVerificationToken;
  dynamic cmFirebaseToken;
  int isActive;
  int newsletterSubscribe;
  int isVerified;
  String verifyCode;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int status;
  int orderCount;
  dynamic loginMedium;
  dynamic socialId;
  dynamic zoneId;
  int walletBalance;
  int loyaltyPoint;
  dynamic refCode;
  dynamic refBy;
  String tempToken;
  String currentLanguageKey;

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
      );
}
