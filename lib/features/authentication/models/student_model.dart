class StudentModel {
  final String firstname;
  final String lastname;
  // final String school;
  final String email;
  // final String schoolEmail;
  // final String nationality;
  // final String phoneNumber;
  // final String address;
  final String password;

  StudentModel({
    required this.firstname,
    required this.lastname,
    // required this.school,
    required this.email,
    // required this.schoolEmail,
    // required this.nationality,
    // required this.phoneNumber,
    // required this.address,
    required this.password,
  });

  // Helper function to get full name
  String get fullName => '$firstname $lastname';

  // Static function to create an empty user model
  static StudentModel empty() => StudentModel(
    firstname: '',
    lastname: '',
    // school: '',
    email: '',
    // schoolEmail: '',
    // nationality: '',
    // phoneNumber: '',
    // address: '',
    password: '',
  );

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    final data = {
      'firstname': firstname,
      'lastname': lastname,
      // 'school': school,
      'email':email,
      // 'schoolEmail': schoolEmail,
      // 'nationality': nationality,
      // 'phoneNumber': phoneNumber,
      // 'address': address,
      'password': password,
    };

    return data;
  }

  // Factory method to create an instance from JSON
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      // school: json['school'],
      email: json['email'],
      // schoolEmail: json['schoolEmail'],
      // nationality: json['nationality'],
      // phoneNumber: json['phoneNumber'],
      // address: json['address'],
      password: json['password'],
    );
  }
}
