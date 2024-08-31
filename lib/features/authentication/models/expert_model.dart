class ExpertModel {
  final String firstname;
  final String lastname;
  final String email;
  final String nationality;
  final String phoneNumber;
  final String address;
  final String password;

  ExpertModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.nationality,
    required this.phoneNumber,
    required this.address,
    required this.password,
  });

  // Helper function to get full name
  String get fullName => '$firstname $lastname';

  // Static function to create an empty user model
  static ExpertModel empty() => ExpertModel(
    firstname: '',
    lastname: '',
    email: '',
    nationality: '',
    phoneNumber: '',
    address: '',
    password: '',
  );

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    final data = {
      'firstname': firstname,
      'lastname': lastname,
      'email':email,
      'nationality': nationality,
      'phoneNumber': phoneNumber,
      'address': address,
      'password': password,
    };

    return data;
  }

  // Factory method to create an instance from JSON
  factory ExpertModel.fromJson(Map<String, dynamic> json) {
    return ExpertModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      nationality: json['nationality'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      password: json['password'],
    );
  }
}
