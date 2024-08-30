import 'dart:convert';
import 'package:helpinghand/features/authentication/models/student_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../Utils/exceptions/api_exceptions.dart';

class StudentRepository extends GetxController {
  static StudentRepository get instance => Get.find();

  final String baseUrl = "https://helpinghandapi.onrender.com/api"; // Replace with your API base URL

  // Function to save user data through API
  Future<void> saveStudentRecord(StudentModel student) async {
    final url = Uri.parse('$baseUrl/auth/register/student');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(student.toJson()),
      );

      if (response.statusCode == 201) {
        // Handle success
        print("Student record saved successfully.");
      } else {
        // Handle server errors
        throw ApiException(response.statusCode, response.body);
      }
    } on http.ClientException catch (e) {
      throw ApiException(500, e.message); // Customize as per your error handling
    } catch (e) {
      print(e.toString());
      throw Exception('Something went wrong, Please try again');
    }
  }
}
