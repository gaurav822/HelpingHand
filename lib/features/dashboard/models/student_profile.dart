// To parse this JSON data, do
//
//     final studentProfile = studentProfileFromJson(jsonString);

import 'dart:convert';

StudentProfileResponseModel studentProfileFromJson(String str) => StudentProfileResponseModel.fromJson(json.decode(str));

String studentProfileToJson(StudentProfileResponseModel data) => json.encode(data.toJson());

class StudentProfileResponseModel {
  final String id;
  final String email;
  final String password;
  final bool isVerified;
  final String? emailToken;
  final String firstname;
  final String lastname;
  final String userType;
  final String t;
  // final String school;
  // final String schoolEmail;
  // final String nationality;
  // final String phoneNumber;
  // final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  StudentProfileResponseModel({
    required this.id,
    required this.email,
    required this.password,
    required this.isVerified,
    required this.emailToken,
    required this.firstname,
    required this.lastname,
    required this.userType,
    required this.t,
    // required this.school,
    // required this.schoolEmail,
    // required this.nationality,
    // required this.phoneNumber,
    // required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory StudentProfileResponseModel.fromJson(Map<String, dynamic> json) => StudentProfileResponseModel(
    id: json["_id"],
    email: json["email"],
    password: json["password"],
    isVerified: json["isVerified"],
    emailToken: json["emailToken"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    userType: json["userType"],
    t: json["__t"],
    // school: json["school"],
    // schoolEmail: json["schoolEmail"],
    // nationality: json["nationality"],
    // phoneNumber: json["phoneNumber"],
    // address: json["address"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "password": password,
    "isVerified": isVerified,
    "emailToken": emailToken,
    "firstname": firstname,
    "lastname": lastname,
    "userType": userType,
    "__t": t,
    // "school": school,
    // "schoolEmail": schoolEmail,
    // "nationality": nationality,
    // "phoneNumber": phoneNumber,
    // "address": address,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
