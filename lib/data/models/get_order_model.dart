// // To parse this JSON data, do
// //
// //     final getOrderModel = getOrderModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetOrderModel getOrderModelFromJson(String str) => GetOrderModel.fromJson(json.decode(str));
//
// class GetOrderModel {
//   bool? status;
//   List<OrderList>? data;
//
//   GetOrderModel({
//     this.status,
//     this.data,
//   });
//
//   factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
//         status: json["status"],
//         data: List<OrderList>.from(json["data"].map((x) => OrderList.fromJson(x))),
//       );
// }
//
// class OrderList {
//   String id;
//   String invoiceNumber;
//   String userId;
//   String orderStatusId;
//   String paymentStatusId;
//   String paymentTypeId;
//   int orderAmount;
//   String? totalDiscount;
//   int totalTaxAmount;
//   int deliveryCharge;
//   int restaurantDiscountAmount;
//   int originalDeliveryCharge;
//   dynamic transactionReference;
//   String? deliveryAddressId;
//   dynamic deliveryManId;
//   dynamic deliveryManRemarks;
//   dynamic couponCode;
//   String? orderNote;
//   dynamic deliveryDate;
//   String orderType;
//   int checked;
//   String restaurantId;
//   String adjustment;
//   String discountTotal;
//   int edited;
//   dynamic otp;
//   dynamic pending;
//   dynamic accepted;
//   dynamic confirmed;
//   dynamic processing;
//   dynamic handover;
//   dynamic pickedUp;
//   dynamic delivered;
//   dynamic canceled;
//   dynamic refundRequested;
//   dynamic refunded;
//   dynamic failed;
//   dynamic cancellationNote;
//   dynamic cancellationReason;
//   dynamic canceledBy;
//   dynamic refundRequestCanceled;
//   dynamic taxPercentage;
//   dynamic deliveryInstruction;
//   dynamic unavailableItemNote;
//   bool cutlery;
//   int distance;
//   bool isGuest;
//   dynamic deliveryAddress;
//   dynamic zoneId;
//   int dmTips;
//   dynamic taxStatus;
//   dynamic vehicleId;
//   dynamic scheduleAt;
//   int scheduled;
//   dynamic processingTime;
//   dynamic callback;
//   int additionalCharge;
//   int partiallyPaidAmount;
//   dynamic orderProof;
//   dynamic couponCreatedBy;
//   dynamic freeDeliveryBy;
//   int orderSubscriptionActive;
//   int isActive;
//   String createdBy;
//   dynamic updatedBy;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String discountOnProductBy;
//   dynamic subscriptionId;
//   User user;
//   Status orderStatus;
//   Status paymentStatus;
//   PaymentType paymentType;
//   Restaurant restaurant;
//   List<OrderDetail> orderDetail;
//
//   OrderList({
//     required this.id,
//     required this.invoiceNumber,
//     required this.userId,
//     required this.orderStatusId,
//     required this.paymentStatusId,
//     required this.paymentTypeId,
//     required this.orderAmount,
//     this.totalDiscount,
//     required this.totalTaxAmount,
//     required this.deliveryCharge,
//     required this.restaurantDiscountAmount,
//     required this.originalDeliveryCharge,
//     required this.transactionReference,
//     this.deliveryAddressId,
//     required this.deliveryManId,
//     required this.deliveryManRemarks,
//     required this.couponCode,
//     this.orderNote,
//     required this.deliveryDate,
//     required this.orderType,
//     required this.checked,
//     required this.restaurantId,
//     required this.adjustment,
//     required this.discountTotal,
//     required this.edited,
//     required this.otp,
//     required this.pending,
//     required this.accepted,
//     required this.confirmed,
//     required this.processing,
//     required this.handover,
//     required this.pickedUp,
//     required this.delivered,
//     required this.canceled,
//     required this.refundRequested,
//     required this.refunded,
//     required this.failed,
//     required this.cancellationNote,
//     required this.cancellationReason,
//     required this.canceledBy,
//     required this.refundRequestCanceled,
//     required this.taxPercentage,
//     required this.deliveryInstruction,
//     required this.unavailableItemNote,
//     required this.cutlery,
//     required this.distance,
//     required this.isGuest,
//     required this.deliveryAddress,
//     required this.zoneId,
//     required this.dmTips,
//     required this.taxStatus,
//     required this.vehicleId,
//     required this.scheduleAt,
//     required this.scheduled,
//     required this.processingTime,
//     required this.callback,
//     required this.additionalCharge,
//     required this.partiallyPaidAmount,
//     required this.orderProof,
//     required this.couponCreatedBy,
//     required this.freeDeliveryBy,
//     required this.orderSubscriptionActive,
//     required this.isActive,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.discountOnProductBy,
//     required this.subscriptionId,
//     required this.user,
//     required this.orderStatus,
//     required this.paymentStatus,
//     required this.paymentType,
//     required this.restaurant,
//     required this.orderDetail,
//   });
//
//   factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
//         id: json["id"],
//         invoiceNumber: json["invoice_number"],
//         userId: json["user_id"],
//         orderStatusId: json["order_status_id"],
//         paymentStatusId: json["payment_status_id"],
//         paymentTypeId: json["payment_type_id"],
//         orderAmount: json["order_amount"],
//         totalDiscount: json["total_discount"] ?? "",
//         totalTaxAmount: json["total_tax_amount"],
//         deliveryCharge: json["delivery_charge"],
//         restaurantDiscountAmount: json["restaurant_discount_amount"],
//         originalDeliveryCharge: json["original_delivery_charge"],
//         transactionReference: json["transaction_reference"],
//         deliveryAddressId: json["delivery_address_id"] ?? "",
//         deliveryManId: json["delivery_man_id"],
//         deliveryManRemarks: json["delivery_man_remarks"],
//         couponCode: json["coupon_code"],
//         orderNote: json["order_note"],
//         deliveryDate: json["delivery_date"],
//         orderType: json["order_type"],
//         checked: json["checked"],
//         restaurantId: json["restaurant_id"],
//         adjustment: json["adjustment"],
//         discountTotal: json["discount_total"],
//         edited: json["edited"],
//         otp: json["otp"],
//         pending: json["pending"],
//         accepted: json["accepted"],
//         confirmed: json["confirmed"],
//         processing: json["processing"],
//         handover: json["handover"],
//         pickedUp: json["picked_up"],
//         delivered: json["delivered"],
//         canceled: json["canceled"],
//         refundRequested: json["refund_requested"],
//         refunded: json["refunded"],
//         failed: json["failed"],
//         cancellationNote: json["cancellation_note"],
//         cancellationReason: json["cancellation_reason"],
//         canceledBy: json["canceled_by"],
//         refundRequestCanceled: json["refund_request_canceled"],
//         taxPercentage: json["tax_percentage"],
//         deliveryInstruction: json["delivery_instruction"],
//         unavailableItemNote: json["unavailable_item_note"],
//         cutlery: json["cutlery"],
//         distance: json["distance"],
//         isGuest: json["is_guest"],
//         deliveryAddress: json["delivery_address"],
//         zoneId: json["zone_id"],
//         dmTips: json["dm_tips"],
//         taxStatus: json["tax_status"],
//         vehicleId: json["vehicle_id"],
//         scheduleAt: json["schedule_at"],
//         scheduled: json["scheduled"],
//         processingTime: json["processing_time"],
//         callback: json["callback"],
//         additionalCharge: json["additional_charge"],
//         partiallyPaidAmount: json["partially_paid_amount"],
//         orderProof: json["order_proof"],
//         couponCreatedBy: json["coupon_created_by"],
//         freeDeliveryBy: json["free_delivery_by"],
//         orderSubscriptionActive: json["order_subscription_active"],
//         isActive: json["is_active"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         discountOnProductBy: json["discount_on_product_by"],
//         subscriptionId: json["subscription_id"],
//         user: User.fromJson(json["user"]),
//         orderStatus: Status.fromJson(json["order_status"]),
//         paymentStatus: Status.fromJson(json["payment_status"]),
//         paymentType: PaymentType.fromJson(json["payment_type"]),
//         restaurant: Restaurant.fromJson(json["restaurant"]),
//         orderDetail: List<OrderDetail>.from(json["order_detail"].map((x) => OrderDetail.fromJson(x))),
//       );
// }
//
// class OrderDetail {
//   String id;
//   String orderId;
//   String foodId;
//   String price;
//   String totalAmount;
//   dynamic tax;
//   dynamic discount;
//   List<Variant> variant;
//   List<dynamic> addon;
//   int quantity;
//   dynamic foodDetails;
//   DateTime createdAt;
//   DateTime updatedAt;
//   Food food;
//
//   OrderDetail({
//     required this.id,
//     required this.orderId,
//     required this.foodId,
//     required this.price,
//     required this.totalAmount,
//     required this.tax,
//     required this.discount,
//     required this.variant,
//     required this.addon,
//     required this.quantity,
//     required this.foodDetails,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.food,
//   });
//
//   factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
//         id: json["id"],
//         orderId: json["order_id"],
//         foodId: json["food_id"],
//         price: json["price"].toString(),
//         totalAmount: json["total_amount"],
//         tax: json["tax"],
//         discount: json["discount"],
//         variant: List<Variant>.from(json["variant"].map((x) => Variant.fromJson(x))),
//         addon: List<dynamic>.from(json["addon"].map((x) => x)),
//         quantity: json["quantity"],
//         foodDetails: json["food_details"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         food: Food.fromJson(json["food"]),
//       );
// }
//
// class Food {
//   String id;
//   String foodName;
//   String description;
//   String image;
//   String categoryId;
//   dynamic categoryIds;
//   dynamic variations;
//   dynamic addOns;
//   dynamic attributes;
//   dynamic choiceOptions;
//   int price;
//   int tax;
//   String taxType;
//   double discount;
//   String discountType;
//   dynamic availableTimeStarts;
//   dynamic availableTimeEnds;
//   int veg;
//   int status;
//   String restaurantId;
//   int avgRating;
//   String ratingCount;
//   dynamic rating;
//   String slug;
//   int recommended;
//   int orderCount;
//   int minimumCartQuantity;
//   int maximumCartQuantity;
//   int isActive;
//   dynamic createdBy;
//   dynamic updatedBy;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int commentsCount;
//   List<dynamic> translations;
//
//   Food({
//     required this.id,
//     required this.foodName,
//     required this.description,
//     required this.image,
//     required this.categoryId,
//     required this.categoryIds,
//     required this.variations,
//     required this.addOns,
//     required this.attributes,
//     required this.choiceOptions,
//     required this.price,
//     required this.tax,
//     required this.taxType,
//     required this.discount,
//     required this.discountType,
//     required this.availableTimeStarts,
//     required this.availableTimeEnds,
//     required this.veg,
//     required this.status,
//     required this.restaurantId,
//     required this.avgRating,
//     required this.ratingCount,
//     required this.rating,
//     required this.slug,
//     required this.recommended,
//     required this.orderCount,
//     required this.minimumCartQuantity,
//     required this.maximumCartQuantity,
//     required this.isActive,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.commentsCount,
//     required this.translations,
//   });
//
//   factory Food.fromJson(Map<String, dynamic> json) => Food(
//         id: json["id"],
//         foodName: json["food_name"],
//         description: json["description"],
//         image: json["image"],
//         categoryId: json["category_id"],
//         categoryIds: json["category_ids"],
//         variations: json["variations"],
//         addOns: json["add_ons"],
//         attributes: json["attributes"],
//         choiceOptions: json["choice_options"],
//         price: json["price"],
//         tax: json["tax"],
//         taxType: json["tax_type"],
//         discount: double.parse(json["discount"].toString()),
//         discountType: json["discount_type"],
//         availableTimeStarts: json["available_time_starts"],
//         availableTimeEnds: json["available_time_ends"],
//         veg: json["veg"],
//         status: json["status"],
//         restaurantId: json["restaurant_id"],
//         avgRating: json["avg_rating"],
//         ratingCount: json["rating_count"],
//         rating: json["rating"],
//         slug: json["slug"],
//         recommended: json["recommended"],
//         orderCount: json["order_count"],
//         minimumCartQuantity: json["minimum_cart_quantity"],
//         maximumCartQuantity: json["maximum_cart_quantity"],
//         isActive: json["is_active"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         commentsCount: json["comments_count"],
//         translations: List<dynamic>.from(json["translations"].map((x) => x)),
//       );
// }
//
// class Variant {
//   String id;
//   String foodId;
//   String foodVariationId;
//   String variationOptionName;
//   String price;
//   dynamic createdBy;
//   dynamic updatedBy;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   Variant({
//     required this.id,
//     required this.foodId,
//     required this.foodVariationId,
//     required this.variationOptionName,
//     required this.price,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//         id: json["id"],
//         foodId: json["food_id"],
//         foodVariationId: json["food_variation_id"],
//         variationOptionName: json["variation_option_name"],
//         price: json["price"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
// }
//
// class Status {
//   String id;
//   String status;
//   String statusName;
//   int isActive;
//   dynamic createdBy;
//   dynamic updatedBy;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   Status({
//     required this.id,
//     required this.status,
//     required this.statusName,
//     required this.isActive,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Status.fromJson(Map<String, dynamic> json) => Status(
//         id: json["id"],
//         status: json["status"],
//         statusName: json["status_name"],
//         isActive: json["is_active"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
// }
//
// class PaymentType {
//   String id;
//   String paymentTypeName;
//   String description;
//   String value;
//   int isActive;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   PaymentType({
//     required this.id,
//     required this.paymentTypeName,
//     required this.description,
//     required this.value,
//     required this.isActive,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
//         id: json["id"],
//         paymentTypeName: json["payment_type_name"],
//         description: json["description"],
//         value: json["value"],
//         isActive: json["is_active"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
// }
//
// class Restaurant {
//   String id;
//   String restaurantName;
//   String phone;
//   String email;
//   String logo;
//   String minimumDeliveryTime;
//   String maximumDeliveryTime;
//   dynamic tinNumber;
//   dynamic date;
//   dynamic tags;
//   dynamic licenseDocument;
//   String latitude;
//   String longitude;
//   String address;
//   dynamic footerText;
//   String minimumOrderAmount;
//   int minimumShippingCharge;
//   dynamic perKmShippingCharge;
//   bool freeDelivery;
//   String userId;
//   List<int> rating;
//   int homeDelivery;
//   bool takeAway;
//   bool cutlery;
//   dynamic metaTitle;
//   dynamic metaDescription;
//   dynamic metaImage;
//   int tax;
//   dynamic commission;
//   dynamic coverPhoto;
//   String slug;
//   dynamic qrCode;
//   String offDay;
//   DateTime openingTime;
//   String closingTime;
//   String zoneId;
//   int announcement;
//   dynamic announcementMessage;
//   int veg;
//   int nonVeg;
//   int selfDeliverySystem;
//   bool posSystem;
//   dynamic deliveryTime;
//   int scheduleDelivery;
//   bool foodSection;
//   bool reviewsSection;
//   String restaurantModel;
//   int orderCount;
//   int totalOrder;
//   dynamic maximumShippingCharge;
//   dynamic additionalData;
//   dynamic additionalDocuments;
//   int countryId;
//   int stateId;
//   int cityId;
//   int isActive;
//   int isVerify;
//   int closeTemporarily;
//   dynamic createdBy;
//   dynamic updatedBy;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//   bool orderSubscriptionActive;
//   bool gstStatus;
//   String gstCode;
//   bool freeDeliveryDistanceStatus;
//   String freeDeliveryDistanceValue;
//   List<dynamic> translations;
//
//   Restaurant({
//     required this.id,
//     required this.restaurantName,
//     required this.phone,
//     required this.email,
//     required this.logo,
//     required this.minimumDeliveryTime,
//     required this.maximumDeliveryTime,
//     required this.tinNumber,
//     required this.date,
//     required this.tags,
//     required this.licenseDocument,
//     required this.latitude,
//     required this.longitude,
//     required this.address,
//     required this.footerText,
//     required this.minimumOrderAmount,
//     required this.minimumShippingCharge,
//     required this.perKmShippingCharge,
//     required this.freeDelivery,
//     required this.userId,
//     required this.rating,
//     required this.homeDelivery,
//     required this.takeAway,
//     required this.cutlery,
//     required this.metaTitle,
//     required this.metaDescription,
//     required this.metaImage,
//     required this.tax,
//     required this.commission,
//     required this.coverPhoto,
//     required this.slug,
//     required this.qrCode,
//     required this.offDay,
//     required this.openingTime,
//     required this.closingTime,
//     required this.zoneId,
//     required this.announcement,
//     required this.announcementMessage,
//     required this.veg,
//     required this.nonVeg,
//     required this.selfDeliverySystem,
//     required this.posSystem,
//     required this.deliveryTime,
//     required this.scheduleDelivery,
//     required this.foodSection,
//     required this.reviewsSection,
//     required this.restaurantModel,
//     required this.orderCount,
//     required this.totalOrder,
//     required this.maximumShippingCharge,
//     required this.additionalData,
//     required this.additionalDocuments,
//     required this.countryId,
//     required this.stateId,
//     required this.cityId,
//     required this.isActive,
//     required this.isVerify,
//     required this.closeTemporarily,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.orderSubscriptionActive,
//     // required this.gstStatus,
//     required this.gstCode,
//     required this.freeDeliveryDistanceStatus,
//     required this.freeDeliveryDistanceValue,
//     required this.translations,
//   });
//
//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         id: json["id"],
//         restaurantName: json["restaurant_name"],
//         phone: json["phone"],
//         email: json["email"],
//         logo: json["logo"],
//         minimumDeliveryTime: json["minimum_delivery_time"],
//         maximumDeliveryTime: json["maximum_delivery_time"],
//         tinNumber: json["tin_number"],
//         date: json["date"],
//         tags: json["tags"],
//         licenseDocument: json["license_document"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         address: json["address"],
//         footerText: json["footer_text"],
//         minimumOrderAmount: json["minimum_order_amount"],
//         minimumShippingCharge: json["minimum_shipping_charge"],
//         perKmShippingCharge: json["per_km_shipping_charge"],
//         freeDelivery: json["free_delivery"],
//         userId: json["user_id"],
//         rating: List<int>.from(json["rating"].map((x) => x)),
//         homeDelivery: json["home_delivery"],
//         takeAway: json["take_away"],
//         cutlery: json["cutlery"],
//         metaTitle: json["meta_title"],
//         metaDescription: json["meta_description"],
//         metaImage: json["meta_image"],
//         tax: json["tax"],
//         commission: json["commission"],
//         coverPhoto: json["cover_photo"],
//         slug: json["slug"],
//         qrCode: json["qr_code"],
//         offDay: json["off_day"],
//         openingTime: DateTime.parse(json["opening_time"]),
//         closingTime: json["closing_time"],
//         zoneId: json["zone_id"],
//         announcement: json["announcement"],
//         announcementMessage: json["announcement_message"],
//         veg: json["veg"],
//         nonVeg: json["non_veg"],
//         selfDeliverySystem: json["self_delivery_system"],
//         posSystem: json["pos_system"],
//         deliveryTime: json["delivery_time"],
//         scheduleDelivery: json["schedule_delivery"],
//         foodSection: json["food_section"],
//         reviewsSection: json["reviews_section"],
//         restaurantModel: json["restaurant_model"],
//         orderCount: json["order_count"],
//         totalOrder: json["total_order"],
//         maximumShippingCharge: json["maximum_shipping_charge"],
//         additionalData: json["additional_data"],
//         additionalDocuments: json["additional_documents"],
//         countryId: json["country_id"],
//         stateId: json["state_id"],
//         cityId: json["city_id"],
//         isActive: json["is_active"],
//         isVerify: json["is_verify"],
//         closeTemporarily: json["close_temporarily"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         orderSubscriptionActive: json["order_subscription_active"],
//         // gstStatus: json["gst_status"],
//         gstCode: json["gst_code"],
//         freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
//         freeDeliveryDistanceValue: json["free_delivery_distance_value"],
//         translations: List<dynamic>.from(json["translations"].map((x) => x)),
//       );
// }
//
// class User {
//   String id;
//   String firstName;
//   String lastName;
//   String phone;
//   String email;
//   dynamic image;
//   int isPhoneVerified;
//   dynamic emailVerifiedAt;
//   dynamic emailVerificationToken;
//   dynamic cmFirebaseToken;
//   int isActive;
//   int newsletterSubscribe;
//   int isVerified;
//   String verifyCode;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int status;
//   int orderCount;
//   dynamic loginMedium;
//   dynamic socialId;
//   dynamic zoneId;
//   int walletBalance;
//   int loyaltyPoint;
//   dynamic refCode;
//   dynamic refBy;
//   String tempToken;
//   String currentLanguageKey;
//
//   User({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.phone,
//     required this.email,
//     required this.image,
//     required this.isPhoneVerified,
//     required this.emailVerifiedAt,
//     required this.emailVerificationToken,
//     required this.cmFirebaseToken,
//     required this.isActive,
//     required this.newsletterSubscribe,
//     required this.isVerified,
//     required this.verifyCode,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.status,
//     required this.orderCount,
//     required this.loginMedium,
//     required this.socialId,
//     required this.zoneId,
//     required this.walletBalance,
//     required this.loyaltyPoint,
//     required this.refCode,
//     required this.refBy,
//     required this.tempToken,
//     required this.currentLanguageKey,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         phone: json["phone"],
//         email: json["email"],
//         image: json["image"],
//         isPhoneVerified: json["is_phone_verified"],
//         emailVerifiedAt: json["email_verified_at"],
//         emailVerificationToken: json["email_verification_token"],
//         cmFirebaseToken: json["cm_firebase_token"],
//         isActive: json["is_active"],
//         newsletterSubscribe: json["newsletter_subscribe"],
//         isVerified: json["is_verified"],
//         verifyCode: json["verify_code"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         status: json["status"],
//         orderCount: json["order_count"],
//         loginMedium: json["login_medium"],
//         socialId: json["social_id"],
//         zoneId: json["zone_id"],
//         walletBalance: json["wallet_balance"],
//         loyaltyPoint: json["loyalty_point"],
//         refCode: json["ref_code"],
//         refBy: json["ref_by"],
//         tempToken: json["temp_token"],
//         currentLanguageKey: json["current_language_key"],
//       );
// }
// To parse this JSON data, do
//
//     final getOrderModel = getOrderModelFromJson(jsonString);

import 'dart:convert';

GetOrderModel getOrderModelFromJson(String str) => GetOrderModel.fromJson(json.decode(str));

String getOrderModelToJson(GetOrderModel data) => json.encode(data.toJson());

class GetOrderModel {
  final bool? status;
  final List<OrderList>? data;

  GetOrderModel({
    this.status,
    this.data,
  });

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<OrderList>.from(json["data"]!.map((x) => OrderList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OrderList {
  final String? id;
  final String? invoiceNumber;
  final String? userId;
  final String? orderStatusId;
  final String? paymentStatusId;
  final String? paymentTypeId;
  final int? orderAmount;
  final String? totalDiscount;
  final int? totalTaxAmount;
  final int? deliveryCharge;
  final int? restaurantDiscountAmount;
  final int? originalDeliveryCharge;
  final dynamic transactionReference;
  final String? deliveryAddressId;
  final dynamic deliveryManId;
  final dynamic deliveryManRemarks;
  final dynamic customerComplaint;
  final dynamic couponCode;
  final String? orderNote;
  final dynamic deliveryDate;
  final String? orderType;
  final int? checked;
  final String? restaurantId;
  final String? adjustment;
  final String? discountTotal;
  final int? edited;
  final dynamic otp;
  final dynamic pending;
  final dynamic accepted;
  final dynamic confirmed;
  final dynamic processing;
  final dynamic handover;
  final dynamic pickedUp;
  final dynamic delivered;
  final dynamic canceled;
  final dynamic refundRequested;
  final dynamic refunded;
  final dynamic failed;
  final dynamic cancellationNote;
  final dynamic cancellationReason;
  final dynamic canceledBy;
  final dynamic refundRequestCanceled;
  final dynamic taxPercentage;
  final dynamic deliveryInstruction;
  final dynamic unavailableItemNote;
  final bool? cutlery;
  final int? distance;
  final bool? isGuest;
  final DeliveryAddress? deliveryAddress;
  final dynamic zoneId;
  final int? dmTips;
  final dynamic taxStatus;
  final dynamic vehicleId;
  final dynamic scheduleAt;
  final int? scheduled;
  final dynamic processingTime;
  final dynamic callback;
  final int? additionalCharge;
  final int? partiallyPaidAmount;
  final dynamic orderProof;
  final dynamic couponCreatedBy;
  final dynamic freeDeliveryBy;
  final int? orderSubscriptionActive;
  final int? isActive;
  final String? createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? discountOnProductBy;
  final dynamic subscriptionId;
  final User? user;
  final Status? orderStatus;
  final Status? paymentStatus;
  final PaymentType? paymentType;
  final Restaurant? restaurant;
  final List<OrderDetail>? orderDetail;

  OrderList({
    this.id,
    this.invoiceNumber,
    this.userId,
    this.orderStatusId,
    this.paymentStatusId,
    this.paymentTypeId,
    this.orderAmount,
    this.totalDiscount,
    this.totalTaxAmount,
    this.deliveryCharge,
    this.restaurantDiscountAmount,
    this.originalDeliveryCharge,
    this.transactionReference,
    this.deliveryAddressId,
    this.deliveryManId,
    this.deliveryManRemarks,
    this.customerComplaint,
    this.couponCode,
    this.orderNote,
    this.deliveryDate,
    this.orderType,
    this.checked,
    this.restaurantId,
    this.adjustment,
    this.discountTotal,
    this.edited,
    this.otp,
    this.pending,
    this.accepted,
    this.confirmed,
    this.processing,
    this.handover,
    this.pickedUp,
    this.delivered,
    this.canceled,
    this.refundRequested,
    this.refunded,
    this.failed,
    this.cancellationNote,
    this.cancellationReason,
    this.canceledBy,
    this.refundRequestCanceled,
    this.taxPercentage,
    this.deliveryInstruction,
    this.unavailableItemNote,
    this.cutlery,
    this.distance,
    this.isGuest,
    this.deliveryAddress,
    this.zoneId,
    this.dmTips,
    this.taxStatus,
    this.vehicleId,
    this.scheduleAt,
    this.scheduled,
    this.processingTime,
    this.callback,
    this.additionalCharge,
    this.partiallyPaidAmount,
    this.orderProof,
    this.couponCreatedBy,
    this.freeDeliveryBy,
    this.orderSubscriptionActive,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.discountOnProductBy,
    this.subscriptionId,
    this.user,
    this.orderStatus,
    this.paymentStatus,
    this.paymentType,
    this.restaurant,
    this.orderDetail,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        id: json["id"],
        invoiceNumber: json["invoice_number"],
        userId: json["user_id"],
        orderStatusId: json["order_status_id"],
        paymentStatusId: json["payment_status_id"],
        paymentTypeId: json["payment_type_id"],
        orderAmount: json["order_amount"],
        totalDiscount: json["total_discount"],
        totalTaxAmount: json["total_tax_amount"],
        deliveryCharge: json["delivery_charge"],
        restaurantDiscountAmount: json["restaurant_discount_amount"],
        originalDeliveryCharge: json["original_delivery_charge"],
        transactionReference: json["transaction_reference"],
        deliveryAddressId: json["delivery_address_id"],
        deliveryManId: json["delivery_man_id"],
        deliveryManRemarks: json["delivery_man_remarks"],
        customerComplaint: json["customer_complaint"],
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
        deliveryAddress: json["delivery_address"] == null ? null : DeliveryAddress.fromJson(json["delivery_address"]),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        discountOnProductBy: json["discount_on_product_by"],
        subscriptionId: json["subscription_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        orderStatus: json["order_status"] == null ? null : Status.fromJson(json["order_status"]),
        paymentStatus: json["payment_status"] == null ? null : Status.fromJson(json["payment_status"]),
        paymentType: json["payment_type"] == null ? null : PaymentType.fromJson(json["payment_type"]),
        restaurant: json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]),
        orderDetail: json["order_detail"] == null ? [] : List<OrderDetail>.from(json["order_detail"]!.map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoice_number": invoiceNumber,
        "user_id": userId,
        "order_status_id": orderStatusId,
        "payment_status_id": paymentStatusId,
        "payment_type_id": paymentTypeId,
        "order_amount": orderAmount,
        "total_discount": totalDiscount,
        "total_tax_amount": totalTaxAmount,
        "delivery_charge": deliveryCharge,
        "restaurant_discount_amount": restaurantDiscountAmount,
        "original_delivery_charge": originalDeliveryCharge,
        "transaction_reference": transactionReference,
        "delivery_address_id": deliveryAddressId,
        "delivery_man_id": deliveryManId,
        "delivery_man_remarks": deliveryManRemarks,
        "customer_complaint": customerComplaint,
        "coupon_code": couponCode,
        "order_note": orderNote,
        "delivery_date": deliveryDate,
        "order_type": orderType,
        "checked": checked,
        "restaurant_id": restaurantId,
        "adjustment": adjustment,
        "discount_total": discountTotal,
        "edited": edited,
        "otp": otp,
        "pending": pending,
        "accepted": accepted,
        "confirmed": confirmed,
        "processing": processing,
        "handover": handover,
        "picked_up": pickedUp,
        "delivered": delivered,
        "canceled": canceled,
        "refund_requested": refundRequested,
        "refunded": refunded,
        "failed": failed,
        "cancellation_note": cancellationNote,
        "cancellation_reason": cancellationReason,
        "canceled_by": canceledBy,
        "refund_request_canceled": refundRequestCanceled,
        "tax_percentage": taxPercentage,
        "delivery_instruction": deliveryInstruction,
        "unavailable_item_note": unavailableItemNote,
        "cutlery": cutlery,
        "distance": distance,
        "is_guest": isGuest,
        "delivery_address": deliveryAddress?.toJson(),
        "zone_id": zoneId,
        "dm_tips": dmTips,
        "tax_status": taxStatus,
        "vehicle_id": vehicleId,
        "schedule_at": scheduleAt,
        "scheduled": scheduled,
        "processing_time": processingTime,
        "callback": callback,
        "additional_charge": additionalCharge,
        "partially_paid_amount": partiallyPaidAmount,
        "order_proof": orderProof,
        "coupon_created_by": couponCreatedBy,
        "free_delivery_by": freeDeliveryBy,
        "order_subscription_active": orderSubscriptionActive,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "discount_on_product_by": discountOnProductBy,
        "subscription_id": subscriptionId,
        "user": user?.toJson(),
        "order_status": orderStatus?.toJson(),
        "payment_status": paymentStatus?.toJson(),
        "payment_type": paymentType?.toJson(),
        "restaurant": restaurant?.toJson(),
        "order_detail": orderDetail == null ? [] : List<dynamic>.from(orderDetail!.map((x) => x.toJson())),
      };
}

class DeliveryAddress {
  final String? id;
  final String? addressType;
  final String? contactPersonNumber;
  final String? address;
  final String? latitude;
  final String? longitude;
  final String? userId;
  final dynamic zoneId;
  final String? contactPersonName;
  final dynamic floor;
  final dynamic road;
  final dynamic house;
  final int? isActive;
  final int? isDefault;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String? zipCode;
  final Country? country;
  final State? state;
  final City? city;

  DeliveryAddress({
    this.id,
    this.addressType,
    this.contactPersonNumber,
    this.address,
    this.latitude,
    this.longitude,
    this.userId,
    this.zoneId,
    this.contactPersonName,
    this.floor,
    this.road,
    this.house,
    this.isActive,
    this.isDefault,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.countryId,
    this.stateId,
    this.cityId,
    this.zipCode,
    this.country,
    this.state,
    this.city,
  });

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        zipCode: json["zip_code"],
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        state: json["state"] == null ? null : State.fromJson(json["state"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address_type": addressType,
        "contact_person_number": contactPersonNumber,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "user_id": userId,
        "zone_id": zoneId,
        "contact_person_name": contactPersonName,
        "floor": floor,
        "road": road,
        "house": house,
        "is_active": isActive,
        "is_default": isDefault,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "zip_code": zipCode,
        "country": country?.toJson(),
        "state": state?.toJson(),
        "city": city?.toJson(),
      };
}

class City {
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
    this.createdAt,
    this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_id": stateId,
        "city_name": cityName,
        "latitude": latitude,
        "longitude": longitude,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Country {
  final int? id;
  final String? countryName;
  final String? shortName;
  final String? countryCode;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Country({
    this.id,
    this.countryName,
    this.shortName,
    this.countryCode,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        countryName: json["country_name"],
        shortName: json["short_name"],
        countryCode: json["country_code"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country_name": countryName,
        "short_name": shortName,
        "country_code": countryCode,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class State {
  final int? id;
  final int? countryId;
  final String? stateName;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  State({
    this.id,
    this.countryId,
    this.stateName,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        countryId: json["country_id"],
        stateName: json["state_name"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country_id": countryId,
        "state_name": stateName,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class OrderDetail {
  final String? id;
  final String? orderId;
  final String? foodId;
  final double? price;
  final String? totalAmount;
  final dynamic tax;
  final dynamic discount;
  final List<Variant>? variant;
  final List<Addon>? addon;
  final int? quantity;
  final dynamic foodDetails;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Food? food;

  OrderDetail({
    this.id,
    this.orderId,
    this.foodId,
    this.price,
    this.totalAmount,
    this.tax,
    this.discount,
    this.variant,
    this.addon,
    this.quantity,
    this.foodDetails,
    this.createdAt,
    this.updatedAt,
    this.food,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        foodId: json["food_id"],
        price: json["price"]?.toDouble(),
        totalAmount: json["total_amount"],
        tax: json["tax"],
        discount: json["discount"],
        variant: json["variant"] == null ? [] : List<Variant>.from(json["variant"]!.map((x) => Variant.fromJson(x))),
        addon: json["addon"] == null ? [] : List<Addon>.from(json["addon"]!.map((x) => Addon.fromJson(x))),
        quantity: json["quantity"],
        foodDetails: json["food_details"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        food: json["food"] == null ? null : Food.fromJson(json["food"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "food_id": foodId,
        "price": price,
        "total_amount": totalAmount,
        "tax": tax,
        "discount": discount,
        "variant": variant == null ? [] : List<dynamic>.from(variant!.map((x) => x.toJson())),
        "addon": addon == null ? [] : List<dynamic>.from(addon!.map((x) => x.toJson())),
        "quantity": quantity,
        "food_details": foodDetails,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "food": food?.toJson(),
      };
}

class Addon {
  final String? id;
  final String? addonName;
  final int? price;
  final String? restaurantId;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Addon({
    this.id,
    this.addonName,
    this.price,
    this.restaurantId,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        id: json["id"],
        addonName: json["addon_name"],
        price: json["price"],
        restaurantId: json["restaurant_id"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "addon_name": addonName,
        "price": price,
        "restaurant_id": restaurantId,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Food {
  final String? id;
  final String? foodName;
  final String? description;
  final String? image;
  final String? categoryId;
  final String? categoryIds;
  final List<dynamic>? variations;
  final String? addOns;
  final dynamic attributes;
  final dynamic choiceOptions;
  final String? basePrice;
  final int? price;
  final int? tax;
  final String? taxType;
  final double? discount;
  final String? discountType;
  final String? availableTimeStarts;
  final String? availableTimeEnds;
  final int? veg;
  final int? status;
  final String? restaurantId;
  final int? avgRating;
  final String? ratingCount;
  final dynamic rating;
  final String? slug;
  final int? recommended;
  final int? orderCount;
  final int? minimumCartQuantity;
  final int? maximumCartQuantity;
  final int? isActive;
  final dynamic createdBy;
  final String? updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? commentsCount;
  final List<dynamic>? translations;

  Food({
    this.id,
    this.foodName,
    this.description,
    this.image,
    this.categoryId,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.basePrice,
    this.price,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.status,
    this.restaurantId,
    this.avgRating,
    this.ratingCount,
    this.rating,
    this.slug,
    this.recommended,
    this.orderCount,
    this.minimumCartQuantity,
    this.maximumCartQuantity,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.commentsCount,
    this.translations,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        foodName: json["food_name"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryIds: json["category_ids"],
        variations: json["variations"] == null ? [] : List<dynamic>.from(json["variations"]!.map((x) => x)),
        addOns: json["add_ons"],
        attributes: json["attributes"],
        choiceOptions: json["choice_options"],
        basePrice: json["base_price"],
        price: json["price"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: json["discount"]?.toDouble(),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        commentsCount: json["comments_count"],
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_name": foodName,
        "description": description,
        "image": image,
        "category_id": categoryId,
        "category_ids": categoryIds,
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x)),
        "add_ons": addOns,
        "attributes": attributes,
        "choice_options": choiceOptions,
        "base_price": basePrice,
        "price": price,
        "tax": tax,
        "tax_type": taxType,
        "discount": discount,
        "discount_type": discountType,
        "available_time_starts": availableTimeStarts,
        "available_time_ends": availableTimeEnds,
        "veg": veg,
        "status": status,
        "restaurant_id": restaurantId,
        "avg_rating": avgRating,
        "rating_count": ratingCount,
        "rating": rating,
        "slug": slug,
        "recommended": recommended,
        "order_count": orderCount,
        "minimum_cart_quantity": minimumCartQuantity,
        "maximum_cart_quantity": maximumCartQuantity,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "comments_count": commentsCount,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
      };
}

class Variant {
  final String? id;
  final String? foodId;
  final String? foodVariationId;
  final String? variationOptionName;
  final String? price;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final FoodVariant? foodVariant;

  Variant({
    this.id,
    this.foodId,
    this.foodVariationId,
    this.variationOptionName,
    this.price,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.foodVariant,
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        foodVariant: json["food_variant"] == null ? null : FoodVariant.fromJson(json["food_variant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_id": foodId,
        "food_variation_id": foodVariationId,
        "variation_option_name": variationOptionName,
        "price": price,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "food_variant": foodVariant?.toJson(),
      };
}

class FoodVariant {
  final String? id;
  final String? foodId;
  final String? variationName;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FoodVariant({
    this.id,
    this.foodId,
    this.variationName,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory FoodVariant.fromJson(Map<String, dynamic> json) => FoodVariant(
        id: json["id"],
        foodId: json["food_id"],
        variationName: json["variation_name"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_id": foodId,
        "variation_name": variationName,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Status {
  final String? id;
  final String? status;
  final String? statusName;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Status({
    this.id,
    this.status,
    this.statusName,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        status: json["status"],
        statusName: json["status_name"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "status_name": statusName,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class PaymentType {
  final String? id;
  final String? paymentTypeName;
  final String? description;
  final String? value;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentType({
    this.id,
    this.paymentTypeName,
    this.description,
    this.value,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"],
        paymentTypeName: json["payment_type_name"],
        description: json["description"],
        value: json["value"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_type_name": paymentTypeName,
        "description": description,
        "value": value,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Restaurant {
  final String? id;
  final String? restaurantName;
  final String? phone;
  final String? email;
  final String? logo;
  final String? minimumDeliveryTime;
  final String? maximumDeliveryTime;
  final String? tinNumber;
  final DateTime? date;
  final dynamic tags;
  final String? licenseDocument;
  final String? latitude;
  final String? longitude;
  final String? address;
  final dynamic footerText;
  final String? minimumOrderAmount;
  final int? minimumShippingCharge;
  final dynamic perKmShippingCharge;
  final bool? freeDelivery;
  final String? userId;
  final List<int>? rating;
  final int? homeDelivery;
  final bool? takeAway;
  final bool? cutlery;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final dynamic metaImage;
  final int? tax;
  final dynamic commission;
  final String? coverPhoto;
  final String? slug;
  final dynamic qrCode;
  final String? offDay;
  final DateTime? openingTime;
  final String? closingTime;
  final String? zoneId;
  final int? announcement;
  final dynamic announcementMessage;
  final int? veg;
  final int? nonVeg;
  final int? selfDeliverySystem;
  final bool? posSystem;
  final dynamic deliveryTime;
  final int? scheduleDelivery;
  final bool? foodSection;
  final bool? reviewsSection;
  final String? restaurantModel;
  final int? orderCount;
  final int? totalOrder;
  final dynamic maximumShippingCharge;
  final dynamic additionalData;
  final dynamic additionalDocuments;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final int? isActive;
  final int? isVerify;
  final int? closeTemporarily;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? orderSubscriptionActive;
  final bool? freeDeliveryDistanceStatus;
  final String? freeDeliveryDistanceValue;
  final List<dynamic>? translations;

  Restaurant({
    this.id,
    this.restaurantName,
    this.phone,
    this.email,
    this.logo,
    this.minimumDeliveryTime,
    this.maximumDeliveryTime,
    this.tinNumber,
    this.date,
    this.tags,
    this.licenseDocument,
    this.latitude,
    this.longitude,
    this.address,
    this.footerText,
    this.minimumOrderAmount,
    this.minimumShippingCharge,
    this.perKmShippingCharge,
    this.freeDelivery,
    this.userId,
    this.rating,
    this.homeDelivery,
    this.takeAway,
    this.cutlery,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.tax,
    this.commission,
    this.coverPhoto,
    this.slug,
    this.qrCode,
    this.offDay,
    this.openingTime,
    this.closingTime,
    this.zoneId,
    this.announcement,
    this.announcementMessage,
    this.veg,
    this.nonVeg,
    this.selfDeliverySystem,
    this.posSystem,
    this.deliveryTime,
    this.scheduleDelivery,
    this.foodSection,
    this.reviewsSection,
    this.restaurantModel,
    this.orderCount,
    this.totalOrder,
    this.maximumShippingCharge,
    this.additionalData,
    this.additionalDocuments,
    this.countryId,
    this.stateId,
    this.cityId,
    this.isActive,
    this.isVerify,
    this.closeTemporarily,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.orderSubscriptionActive,
    this.freeDeliveryDistanceStatus,
    this.freeDeliveryDistanceValue,
    this.translations,
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
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
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
        rating: json["rating"] == null ? [] : List<int>.from(json["rating"]!.map((x) => x)),
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
        openingTime: json["opening_time"] == null ? null : DateTime.parse(json["opening_time"]),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        orderSubscriptionActive: json["order_subscription_active"],
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_name": restaurantName,
        "phone": phone,
        "email": email,
        "logo": logo,
        "minimum_delivery_time": minimumDeliveryTime,
        "maximum_delivery_time": maximumDeliveryTime,
        "tin_number": tinNumber,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "tags": tags,
        "license_document": licenseDocument,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "footer_text": footerText,
        "minimum_order_amount": minimumOrderAmount,
        "minimum_shipping_charge": minimumShippingCharge,
        "per_km_shipping_charge": perKmShippingCharge,
        "free_delivery": freeDelivery,
        "user_id": userId,
        "rating": rating == null ? [] : List<dynamic>.from(rating!.map((x) => x)),
        "home_delivery": homeDelivery,
        "take_away": takeAway,
        "cutlery": cutlery,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "tax": tax,
        "commission": commission,
        "cover_photo": coverPhoto,
        "slug": slug,
        "qr_code": qrCode,
        "off_day": offDay,
        "opening_time": openingTime?.toIso8601String(),
        "closing_time": closingTime,
        "zone_id": zoneId,
        "announcement": announcement,
        "announcement_message": announcementMessage,
        "veg": veg,
        "non_veg": nonVeg,
        "self_delivery_system": selfDeliverySystem,
        "pos_system": posSystem,
        "delivery_time": deliveryTime,
        "schedule_delivery": scheduleDelivery,
        "food_section": foodSection,
        "reviews_section": reviewsSection,
        "restaurant_model": restaurantModel,
        "order_count": orderCount,
        "total_order": totalOrder,
        "maximum_shipping_charge": maximumShippingCharge,
        "additional_data": additionalData,
        "additional_documents": additionalDocuments,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "is_active": isActive,
        "is_verify": isVerify,
        "close_temporarily": closeTemporarily,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "order_subscription_active": orderSubscriptionActive,
        "free_delivery_distance_status": freeDeliveryDistanceStatus,
        "free_delivery_distance_value": freeDeliveryDistanceValue,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
      };
}

class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? image;
  final int? isPhoneVerified;
  final dynamic emailVerifiedAt;
  final dynamic emailVerificationToken;
  final dynamic cmFirebaseToken;
  final int? isActive;
  final int? newsletterSubscribe;
  final int? isVerified;
  final String? verifyCode;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? status;
  final int? orderCount;
  final dynamic loginMedium;
  final dynamic socialId;
  final dynamic zoneId;
  final int? walletBalance;
  final int? loyaltyPoint;
  final dynamic refCode;
  final dynamic refBy;
  final String? tempToken;
  final String? currentLanguageKey;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.image,
    this.isPhoneVerified,
    this.emailVerifiedAt,
    this.emailVerificationToken,
    this.cmFirebaseToken,
    this.isActive,
    this.newsletterSubscribe,
    this.isVerified,
    this.verifyCode,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.orderCount,
    this.loginMedium,
    this.socialId,
    this.zoneId,
    this.walletBalance,
    this.loyaltyPoint,
    this.refCode,
    this.refBy,
    this.tempToken,
    this.currentLanguageKey,
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
      };
}
