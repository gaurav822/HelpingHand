
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpinghand/Utils/securestorage/secure_storage_service.dart';
import 'package:helpinghand/features/dashboard/screens/student_dashboard.dart';
import 'package:helpinghand/features/dashboard_expert/screens/expert_dashboard.dart';
import 'package:path/path.dart';
import '../../../Utils/constants.dart';
import '../../../Utils/exceptions/api_exceptions.dart';
import '../../../common/loader/loaders.dart';
import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../features/authentication/screens/login/login_screen.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import 'package:http/http.dart' as http;

import '../../../features/authentication/screens/signup/verify_account_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final SecureStorageService secureStorageService = Get.find<SecureStorageService>();

  //variable
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    //redirect to appropriate screen
    screenRedirect();
  }

  //function to show relavant screen

  screenRedirect() async {

    String? accessToken = await secureStorageService.read(AppConstants.accessToken);
    if(accessToken!=null){
      checkSession(accessToken);
    }
    else{
      _handleFirstTimeLaunch();
    }
  }

  void checkSession(String accessToken) async {
    bool tokenValid = await secureStorageService.isTokenValid();

    if (tokenValid) {
      // Redirect to Dashboard
        String? userType = await secureStorageService.read(AppConstants.userType);
        if (userType != null) {
          LoginController.instance.navigateBasedOnUserType(userType);
        }
    } else {
      // Token expired, clear storage and redirect to Login
      await secureStorageService.deleteAll();
      Loaders.errorSnackBar(title: 'Session Expired!', message: "Logging out...");
      Get.offAll(const LoginScreen());// Clear stored tokens
    }
  }


  _handleFirstTimeLaunch(){
    print("Coming here");
    //Local storage
    deviceStorage.writeIfNull('isFirstTime', true);
    //Check if its the first time launching the app
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }


  //Sign in with email And Password
  Future<String> signInWithEmailPass({required String email, required String password}) async {
    final url = Uri.parse('${AppConstants.baseUrl}/auth/login');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        //handle if verified or not;
        bool isAccountVerified = json.decode(response.body)['user']["isVerified"] as bool;

        if(isAccountVerified){

          //saveAccessToken
          String token = json.decode(response.body)['token'] as String;
          secureStorageService.storeToken(token,86400);
          // Handle success
          String userType = _fetchUserType(response.body);
          return userType;
        }
        else{
          secureStorageService.write(AppConstants.userEmail, json.decode(response.body)['user']["email"] as  String);
          return '';
        }

      } else {

        final message = json.decode(response.body)['msg'] as String;
        // Handle server errors
        throw ApiException(response.statusCode,message);
      }
    } on http.ClientException catch (e) {
      throw ApiException(500, e.message); // Customize as per your error handling
    } catch (e) {
      throw Exception(e);
    }
  }


  // Extract the user type from the response body
  String _fetchUserType(String responseBody) {
    final Map<String, dynamic> decodedResponse = json.decode(responseBody);
    String userType =  decodedResponse['user']['userType'] as String;
    secureStorageService.write(AppConstants.userType, userType);
    secureStorageService.write(AppConstants.userId, decodedResponse['user']['_id'] as String);

    return userType;
  }

  Future<void> logout() async{
    secureStorageService.delete(AppConstants.accessToken);
  }

}
