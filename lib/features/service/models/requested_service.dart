  // To parse this JSON data, do
  //
  //     final requestedService = requestedServiceFromJson(jsonString);

  import 'dart:convert';

  List<RequestedService> requestedServiceFromJson(String str) => List<RequestedService>.from(json.decode(str).map((x) => RequestedService.fromJson(x)));

  String requestedServiceToJson(List<RequestedService> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  class RequestedService {
    final String id;
    final ServiceTypeId serviceTypeId;
    final dynamic serviceId;
    final TId expertId;
    final TId studentId;
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
      serviceTypeId: ServiceTypeId.fromJson(json["serviceTypeId"]),
      serviceId: json["serviceId"],
      expertId: TId.fromJson(json["expertId"]),
      studentId: TId.fromJson(json["studentId"]),
      status: json["status"],
      requestedAt: DateTime.parse(json["requestedAt"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
      "_id": id,
      "serviceTypeId": serviceTypeId.toJson(),
      "serviceId": serviceId,
      "expertId": expertId.toJson(),
      "studentId": studentId.toJson(),
      "status": status,
      "requestedAt": requestedAt.toIso8601String(),
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "__v": v,
    };
  }

  class TId {
    final String id;
    final String firstname;
    final String lastname;
    final String t;

    TId({
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.t,
    });

    factory TId.fromJson(Map<String, dynamic> json) => TId(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      t: json["__t"],
    );

    Map<String, dynamic> toJson() => {
      "_id": id,
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
