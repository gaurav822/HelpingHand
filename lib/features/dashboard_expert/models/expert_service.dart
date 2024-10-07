// To parse this JSON data, do
//
//     final expertService = expertServiceFromJson(jsonString);

import 'dart:convert';

ExpertService expertServiceFromJson(String str) => ExpertService.fromJson(json.decode(str));

String expertServiceToJson(ExpertService data) => json.encode(data.toJson());

class ExpertService {
  final List<Service> services;

  ExpertService({
    required this.services,
  });

  factory ExpertService.fromJson(Map<String, dynamic> json) => ExpertService(
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Service {
  final String id;
  final ServiceId serviceId;
  final String expertId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Service({
    required this.id,
    required this.serviceId,
    required this.expertId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["_id"],
    serviceId: ServiceId.fromJson(json["serviceId"]),
    expertId: json["expertId"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceId": serviceId.toJson(),
    "expertId": expertId,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class ServiceId {
  final String id;
  final StudentId studentId;
  final ServiceTypeId serviceTypeId;
  final String purchaseId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ServiceId({
    required this.id,
    required this.studentId,
    required this.serviceTypeId,
    required this.purchaseId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    id: json["_id"],
    studentId: StudentId.fromJson(json["studentId"]),
    serviceTypeId: ServiceTypeId.fromJson(json["serviceTypeId"]),
    purchaseId: json["purchaseId"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "studentId": studentId.toJson(),
    "serviceTypeId": serviceTypeId.toJson(),
    "purchaseId": purchaseId,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
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

class StudentId {
  final String id;
  final String email;
  final String firstname;
  final String lastname;
  final String t;

  StudentId({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.t,
  });

  factory StudentId.fromJson(Map<String, dynamic> json) => StudentId(
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
