// To parse this JSON data, do
//
//     final requestedService = requestedServiceFromJson(jsonString);

import 'dart:convert';

List<RequestedService> requestedServiceFromJson(String str) => List<RequestedService>.from(json.decode(str).map((x) => RequestedService.fromJson(x)));

String requestedServiceToJson(List<RequestedService> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestedService {
  final String id;
  final String serviceTypeId;
  final dynamic serviceId;
  final String expertId;
  final String studentId;
  final String status;
  final DateTime requestedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  RequestedService({
    required this.id,
    required this.serviceTypeId,
    required this.serviceId,
    required this.expertId,
    required this.studentId,
    required this.status,
    required this.requestedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory RequestedService.fromJson(Map<String, dynamic> json) => RequestedService(
    id: json["_id"],
    serviceTypeId: json["serviceTypeId"],
    serviceId: json["serviceId"],
    expertId: json["expertId"],
    studentId: json["studentId"],
    status: json["status"],
    requestedAt: DateTime.parse(json["requestedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceTypeId": serviceTypeId,
    "serviceId": serviceId,
    "expertId": expertId,
    "studentId": studentId,
    "status": status,
    "requestedAt": requestedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
