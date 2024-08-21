
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../features/authentication/screens/login/login_screen.dart';

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
}
