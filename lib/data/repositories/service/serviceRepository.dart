import 'dart:convert';
import 'package:helpinghand/Utils/constants.dart';
import 'package:helpinghand/features/authentication/models/expert_model.dart';
import 'package:helpinghand/features/authentication/models/student_model.dart';
import 'package:helpinghand/features/dashboard/models/student_profile.dart';
import 'package:helpinghand/features/service/models/requested_service.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../Utils/exceptions/api_exceptions.dart';
import '../../../Utils/securestorage/secure_storage_service.dart';
import '../../../features/service/models/expert_list_model.dart';

class ServiceRepository extends GetxController {
  static ServiceRepository get instance => Get.find();

  final SecureStorageService secureStorageService = Get.find<SecureStorageService>();


  // Function to save user data through API
  Future<void> sendServiceRequest(String expertId) async {
    final url = Uri.parse('${AppConstants.baseUrl}/service/request/create');

    final studentId = await secureStorageService.read(AppConstants.userId);
    final token = await secureStorageService.read(AppConstants.accessToken);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!
        },
        body: json.encode({
          'studentId':studentId,
          'expertId':expertId,
          'serviceTypeId':'66dab399df286cc18e4ed4f5'
        }),
      );

      if (response.statusCode == 201) {
        // Handle success
        print("Service Request Sent saved successfully.");
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


  Future<void> acceptServiceRequest(String serviceRequestId) async {
    final url = Uri.parse('${AppConstants.baseUrl}/service/request/accept/$serviceRequestId');

    final token = await secureStorageService.read(AppConstants.accessToken);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!
        }
      );

      if (response.statusCode == 200) {
        // Handle success
        print("Service request approved saved successfully.");
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

  Future<List<RequestedService>> getServiceRequests() async {
    final studentId = await secureStorageService.read(AppConstants.userId);
    final userType = await secureStorageService.read(AppConstants.userType);
    bool isStudent = userType == "Student" ? true :false;
    final url = Uri.parse('${AppConstants.baseUrl}/service/getRequestedServices');
    final token = await secureStorageService.read(AppConstants.accessToken);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!
        },
        body: json.encode({
          isStudent?'studentId':'expertId' : studentId,
        }),
      );

      if (response.statusCode == 200) {
        // Handle success
        print(response.body);
        return requestedServiceFromJson(response.body);

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

}
