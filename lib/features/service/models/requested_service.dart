// To parse this JSON data, do
//
//     final studentServiceList = studentServiceListFromJson(jsonString);

import 'dart:convert';

StudentServiceList studentServiceListFromJson(String str) => StudentServiceList.fromJson(json.decode(str));

String studentServiceListToJson(StudentServiceList data) => json.encode(data.toJson());

class StudentServiceList {
  final List<StudentService> services;

  StudentServiceList({
    required this.services,
  });

  factory StudentServiceList.fromJson(Map<String, dynamic> json) => StudentServiceList(
    services: List<StudentService>.from(json["services"].map((x) => StudentService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class StudentService {
  final String id;
  final String studentId;
  final ServiceTypeId serviceTypeId;
  final String purchaseId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final ServiceRequest? serviceRequest;

  StudentService({
    required this.id,
    required this.studentId,
    required this.serviceTypeId,
    required this.purchaseId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.serviceRequest,
  });

  factory StudentService.fromJson(Map<String, dynamic> json) => StudentService(
    id: json["_id"],
    studentId: json["studentId"],
    serviceTypeId: ServiceTypeId.fromJson(json["serviceTypeId"]),
    purchaseId: json["purchaseId"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    serviceRequest: json["serviceRequest"] == null ? null : ServiceRequest.fromJson(json["serviceRequest"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "studentId": studentId,
    "serviceTypeId": serviceTypeId.toJson(),
    "purchaseId": purchaseId,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "serviceRequest": serviceRequest?.toJson(),
  };
}

class ServiceRequest {
  final String id;
  final String serviceId;
  final ExpertId expertId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ServiceRequest({
    required this.id,
    required this.serviceId,
    required this.expertId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ServiceRequest.fromJson(Map<String, dynamic> json) => ServiceRequest(
    id: json["_id"],
    serviceId: json["serviceId"],
    expertId: ExpertId.fromJson(json["expertId"]),
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceId": serviceId,
    "expertId": expertId.toJson(),
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class ExpertId {
  final String id;
  final String email;
  final String firstname;
  final String lastname;
  final String t;

  ExpertId({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.t,
  });

  factory ExpertId.fromJson(Map<String, dynamic> json) => ExpertId(
    id: json["_id"],
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    t: json["__t"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "__t": t,
  };
}

class ServiceTypeId {
  final String id;
  final String typename;
  final String description;
  final int price;

  ServiceTypeId({
    required this.id,
    required this.typename,
    required this.description,
    required this.price,
  });

  factory ServiceTypeId.fromJson(Map<String, dynamic> json) => ServiceTypeId(
    id: json["_id"],
    typename: json["typename"],
    description: json["description"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "typename": typename,
    "description": description,
    "price": price,
  };
}
