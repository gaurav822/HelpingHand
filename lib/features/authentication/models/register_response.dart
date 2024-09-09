import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  final String msg;
  final User user;

  RegisterResponse({
    required this.msg,
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    msg: json["msg"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "user": user.toJson(),
  };
}

class User {
  final String email;
  final bool isVerified;
  final String firstname;
  final String lastname;
  final String userType;
  final bool isAdmin;
  final String id;
  final String t;
  final String? school;           // Optional field
  final String? schoolEmail;      // Optional field
  final String? bio;              // Optional field for experts
  final List<String>? expertise;  // Optional field for experts
  final String nationality;
  final String phoneNumber;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.email,
    required this.isVerified,
    required this.firstname,
    required this.lastname,
    required this.userType,
    required this.isAdmin,
    required this.id,
    required this.t,
    this.school,                  // Optional field
    this.schoolEmail,             // Optional field
    this.bio,                     // Optional field
    this.expertise,               // Optional field
    required this.nationality,
    required this.phoneNumber,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    isVerified: json["isVerified"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    userType: json["userType"],
    isAdmin: json["isAdmin"],
    id: json["_id"],
    t: json["__t"],
    school: json["school"],                     // May or may not exist
    schoolEmail: json["schoolEmail"],           // May or may not exist
    bio: json["bio"],                           // May or may not exist
    expertise: json["expertise"] != null ? List<String>.from(json["expertise"]) : null, // May or may not exist
    nationality: json["nationality"],
    phoneNumber: json["phoneNumber"],
    address: json["address"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "isVerified": isVerified,
    "firstname": firstname,
    "lastname": lastname,
    "userType": userType,
    "isAdmin": isAdmin,
    "_id": id,
    "__t": t,
    "school": school,                         // Include only if exists
    "schoolEmail": schoolEmail,               // Include only if exists
    "bio": bio,                               // Include only if exists
    "expertise": expertise != null ? List<dynamic>.from(expertise!) : null, // Include only if exists
    "nationality": nationality,
    "phoneNumber": phoneNumber,
    "address": address,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
