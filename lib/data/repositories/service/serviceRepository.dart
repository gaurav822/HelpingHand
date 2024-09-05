import 'dart:convert';
import 'package:helpinghand/Utils/constants.dart';
import 'package:helpinghand/features/authentication/models/expert_model.dart';
import 'package:helpinghand/features/authentication/models/student_model.dart';
import 'package:helpinghand/features/dashboard/models/student_profile.dart';
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
          'serviceTypeId':'66c72ca2b9c17c17a42ce2b8'
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
}
