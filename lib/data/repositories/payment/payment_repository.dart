import 'dart:convert';
import 'dart:math';
import 'package:helpinghand/Utils/constants.dart';
import 'package:helpinghand/features/authentication/models/expert_model.dart';
import 'package:helpinghand/features/authentication/models/student_model.dart';
import 'package:helpinghand/features/dashboard/models/student_profile.dart';
import 'package:helpinghand/features/service/models/requested_service.dart';
import 'package:helpinghand/features/service/models/service.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';


import '../../../Utils/exceptions/api_exceptions.dart';
import '../../../Utils/securestorage/secure_storage_service.dart';
import '../../../features/service/models/expert_list_model.dart';

class PaymentRepository extends GetxController {
  static PaymentRepository get instance => Get.find();

  final SecureStorageService secureStorageService = Get.find<SecureStorageService>();


  // Function to save user data through API
  Future<void> confirmPurchase(List<String> serviceTypeIds) async {
    final url = Uri.parse('${AppConstants.baseUrl}/service/purchase');

    final token = await secureStorageService.read(AppConstants.accessToken);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!
        },
        body: json.encode({
          'serviceTypeIds':serviceTypeIds,
        }),
      );

      if (response.statusCode == 201) {
        // Handle success
        print(response.body);
        print("Payment Confirmed Request Sent saved successfully.");
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
