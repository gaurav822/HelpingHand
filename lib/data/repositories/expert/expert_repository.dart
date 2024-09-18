import 'dart:convert';
import 'package:helpinghand/Utils/constants.dart';
import 'package:helpinghand/features/authentication/models/expert_model.dart';
import 'package:helpinghand/features/authentication/models/register_response.dart';
import 'package:helpinghand/features/authentication/models/student_model.dart';
import 'package:helpinghand/features/dashboard/models/student_profile.dart';
import 'package:helpinghand/features/dashboard_expert/models/expert_profile_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../Utils/exceptions/api_exceptions.dart';
import '../../../Utils/securestorage/secure_storage_service.dart';
import '../../../features/service/models/expert_list_model.dart';

class ExpertRepository extends GetxController {
  static ExpertRepository get instance => Get.find();

  final SecureStorageService secureStorageService = Get.find<SecureStorageService>();


  // Function to save user data through API
  Future<RegisterResponse> saveExpertRecord(ExpertModel expert) async {
    final url = Uri.parse('${AppConstants.baseUrl}/auth/register/expert');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(expert.toJson()),
      );

      if (response.statusCode == 201) {
        return registerResponseFromJson(response.body);
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

  Future<List<ExpertListModel>> getExperts()async{
    final url = Uri.parse('${AppConstants.baseUrl}/user/experts');
    final token = await secureStorageService.read(AppConstants.accessToken);

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
        // Convert the decoded JSON to a StudentProfile object
        final expertList = expertListModelFromJson(response.body);
        print(expertList);
        // Return the StudentProfile object
        return expertList;
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


  Future<ExpertProfileResponseModel> getExpertProfile() async {
    final url = Uri.parse('${AppConstants.baseUrl}/profile');
    final token = await secureStorageService.read(AppConstants.accessToken);
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
        final expertProfile = ExpertProfileResponseModel.fromJson(jsonResponse);

        // Return the StudentProfile object
        return expertProfile;
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
