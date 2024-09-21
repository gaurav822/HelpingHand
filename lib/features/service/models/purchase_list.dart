// To parse this JSON data, do
//
//     final purchase = purchaseFromJson(jsonString);

import 'dart:convert';

List<Purchase> purchaseFromJson(String str) => List<Purchase>.from(json.decode(str).map((x) => Purchase.fromJson(x)));

String purchaseToJson(List<Purchase> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Purchase {
  final List<String> serviceTypes;
  final int totalPrice;
  final String paymentStatus;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Purchase({
    required this.serviceTypes,
    required this.totalPrice,
    required this.paymentStatus,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
    serviceTypes: List<String>.from(json["serviceTypes"].map((x) => x)),
    totalPrice: json["totalPrice"],
    paymentStatus: json["paymentStatus"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "serviceTypes": List<dynamic>.from(serviceTypes.map((x) => x)),
    "totalPrice": totalPrice,
    "paymentStatus": paymentStatus,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
