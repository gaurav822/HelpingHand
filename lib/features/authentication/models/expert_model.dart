class ExpertModel {
  final String firstname;
  final String lastname;
  final String email;
  final String nationality;
  final String phoneNumber;
  final String address;
  final String password;
  final String bio;
  final int rating;
  final List<String> expertise;

  ExpertModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.nationality,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.bio,
    required this.rating,
    required this.expertise
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
    bio :  '',
    rating : 0,
    expertise: []
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
      'bio':bio,
      'rating':rating,
      'expertise':expertise
    };

    return data;
  }

  // Factory method to create an instance from JSON
  factory ExpertModel.fromJson(Map<String, dynamic> json) {
    return ExpertModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      bio:json['bio'],
      nationality: json['nationality'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      password: json['password'],
      rating:json['rating'],
      expertise: json['expertise']
    );
  }
}
