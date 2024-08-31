
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpinghand/features/dashboard/screens/student_dashboard.dart';
import 'package:helpinghand/features/dashboard_expert/screens/expert_dashboard.dart';
import 'package:path/path.dart';
import '../../../Utils/constants.dart';
import '../../../Utils/exceptions/api_exceptions.dart';
import '../../../features/authentication/screens/login/login_screen.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import 'package:http/http.dart' as http;

import '../../../features/authentication/screens/signup/verify_account_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

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
    _handleFirstTimeLaunch();
  }

  _handleFirstTimeLaunch(){
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
          // Handle success
          String userType = _fetchUserType(response.body);
          return userType;
        }
        else{
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
    return decodedResponse['user']['userType'] as String;
  }


  // Navigate based on user type
}
