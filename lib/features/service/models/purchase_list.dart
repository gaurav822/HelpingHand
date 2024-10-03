// To parse this JSON data, do
//
//     final purchaseList = purchaseListFromJson(jsonString);

import 'dart:convert';

PurchaseList purchaseListFromJson(String str) => PurchaseList.fromJson(json.decode(str));

String purchaseListToJson(PurchaseList data) => json.encode(data.toJson());

class PurchaseList {
  final List<Purchase> purchaseWithServices;

  PurchaseList({
    required this.purchaseWithServices,
  });

  factory PurchaseList.fromJson(Map<String, dynamic> json) => PurchaseList(
    purchaseWithServices: List<Purchase>.from(json["purchaseWithServices"].map((x) => Purchase.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "purchaseWithServices": List<dynamic>.from(purchaseWithServices.map((x) => x.toJson())),
  };
}

class Purchase {
  final String id;
  final String studentId;
  final List<ServiceType> serviceTypes;
  final int totalPrice;
  final String paymentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final List<PurchaseService> services;

  Purchase({
    required this.id,
    required this.studentId,
    required this.serviceTypes,
    required this.totalPrice,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.services,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
    id: json["_id"],
    studentId: json["studentId"],
    serviceTypes: List<ServiceType>.from(json["serviceTypes"].map((x) => ServiceType.fromJson(x))),
    totalPrice: json["totalPrice"],
    paymentStatus: json["paymentStatus"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    services: List<PurchaseService>.from(json["services"].map((x) => PurchaseService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "studentId": studentId,
    "serviceTypes": List<dynamic>.from(serviceTypes.map((x) => x.toJson())),
    "totalPrice": totalPrice,
    "paymentStatus": paymentStatus,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class ServiceType {
  final String id;
  final String typename;
  final String description;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ServiceType({
    required this.id,
    required this.typename,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
    id: json["_id"],
    typename: json["typename"],
    description: json["description"],
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "typename": typename,
    "description": description,
    "price": price,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class PurchaseService {
  final String id;
  final String studentId;
  final String serviceTypeId;
  final String purchaseId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  PurchaseService({
    required this.id,
    required this.studentId,
    required this.serviceTypeId,
    required this.purchaseId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory PurchaseService.fromJson(Map<String, dynamic> json) => PurchaseService(
    id: json["_id"],
    studentId: json["studentId"],
    serviceTypeId: json["serviceTypeId"],
    purchaseId: json["purchaseId"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "studentId": studentId,
    "serviceTypeId": serviceTypeId,
    "purchaseId": purchaseId,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
