import 'dart:convert';
import 'dart:math';
import 'package:helpinghand/Utils/constants.dart';
import 'package:helpinghand/features/service/models/requested_service.dart';
import 'package:helpinghand/features/service/models/service.dart' as sv;
import 'package:http/http.dart' as http;
import 'package:get/get.dart';


import '../../../Utils/exceptions/api_exceptions.dart';
import '../../../Utils/securestorage/secure_storage_service.dart';
import '../../../features/dashboard_expert/models/expert_service.dart';
import '../../../features/service/models/purchase_list.dart';

class ServiceRepository extends GetxController {
  static ServiceRepository get instance => Get.find();

  final SecureStorageService secureStorageService = Get.find<SecureStorageService>();


  // Function to save user data through API
  Future<void> sendServiceRequest(String expertId,String serviceTypeId) async {
    final url = Uri.parse('${AppConstants.baseUrl}/service/request/create');
    final studentId = await secureStorageService.read(AppConstants.userId);
    print(studentId);
    final token = await secureStorageService.read(AppConstants.accessToken);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!
        },
        body: json.encode({
          'expertId':expertId,
          'studentId' : studentId,
          'serviceId':serviceTypeId
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

  Future<List<StudentService>> getServiceRequests() async {
    final url = Uri.parse('${AppConstants.baseUrl}/service/me');
    final token = await secureStorageService.read(AppConstants.accessToken);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!
        }
      );

      if (response.statusCode == 200) {
        // Handle success
        print(response.body);
        return studentServiceListFromJson(response.body).services;

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



  Future<List<Service>> getExpertServices() async {
    final url = Uri.parse('${AppConstants.baseUrl}/service/expertServices');
    final token = await secureStorageService.read(AppConstants.accessToken);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!
        }
      );

      if (response.statusCode == 200) {
        // Handle success
        print(response.body);
        return expertServiceFromJson(response.body).services;

      } else {
        print(e);
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


  Future<List<sv.Service>> getServiceTypes() async {
    final url = Uri.parse('${AppConstants.baseUrl}/service/types');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Handle success
        return sv.serviceFromJson(response.body);

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



  Future<List<Purchase>> getPurchaseList() async{
    final token = await secureStorageService.read(AppConstants.accessToken);
    final url = Uri.parse('${AppConstants.baseUrl}/service/purchases');
    try {
      final response = await http.get(
        url,
        headers: {
          'x-auth-token':token!,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Handle success
        print(response.body);
        return purchaseListFromJson(response.body).purchaseWithServices;

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
