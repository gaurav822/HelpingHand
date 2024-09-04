import 'dart:convert';
import 'package:helpinghand/Utils/constants.dart';
import 'package:helpinghand/features/authentication/models/student_model.dart';
import 'package:helpinghand/features/dashboard/models/student_profile.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../Utils/exceptions/api_exceptions.dart';
import '../../../Utils/securestorage/secure_storage_service.dart';

class StudentRepository extends GetxController {
  static StudentRepository get instance => Get.find();

  final SecureStorageService secureStorageService = Get.find<SecureStorageService>();


  // Function to save user data through API
  Future<void> saveStudentRecord(StudentModel student) async {
    final url = Uri.parse('${AppConstants.baseUrl}/auth/register/student');
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
      throw ApiException(
          500, e.message); // Customize as per your error handling
    } catch (e) {
      rethrow;
    }
  }

  Future<StudentProfileResponseModel> getStudentProfile() async {
    final url = Uri.parse('${AppConstants.baseUrl}/profile');
    final token = await secureStorageService.read(AppConstants.accessToken);
    print(token);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token!
        },
      );

      if (response.statusCode == 200) {
        // Decode the JSON response body
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Convert the decoded JSON to a StudentProfile object
        final studentProfile = StudentProfileResponseModel.fromJson(jsonResponse);

        // Return the StudentProfile object
        return studentProfile;
      } else {
        // Handle server errors
        throw ApiException(response.statusCode, response.body);
      }
    } on http.ClientException catch (e) {
      throw ApiException(
          500, e.message); // Customize as per your error handling
    } catch (e) {
      print(e.toString());
      throw Exception('Something went wrong, Please try again');
    }
  }
}
