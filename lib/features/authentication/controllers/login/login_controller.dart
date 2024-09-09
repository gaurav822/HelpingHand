import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpinghand/Utils/constants.dart';
import 'package:helpinghand/features/dashboard/screens/student_dashboard.dart';
import 'package:helpinghand/features/dashboard_expert/screens/expert_dashboard.dart';

import '../../../../Utils/popups/full_screen_loader.dart';
import '../../../../Utils/securestorage/secure_storage_service.dart';
import '../../../../common/loader/loaders.dart';
import '../../../../core/network/network_manager.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../screens/signup/verify_account_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final SecureStorageService secureStorageService = Get.find<SecureStorageService>();

  //variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    loginFormKey.currentState?.reset();
    // emailAddress.text = localStorage.read('REMEMBER_ME_EMAIL')??"";
    // password.text = localStorage.read('REMEMBER_ME_PASSWORD')??"";
  }
  //Email and Password Sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog("Logging you in...");

      //Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      //Check validation form
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Save data if remember me is Selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', emailAddress.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user with email and password authentication


      String userType = await AuthenticationRepository.instance.signInWithEmailPass(email: emailAddress.text.trim(),password:password.text.trim());

      FullScreenLoader.stopLoading();

      loginFormKey.currentState!.reset();

      // If the user type is retrieved, navigate based on it
      if (userType.isNotEmpty) {
         navigateBasedOnUserType(userType);
      }
      else{
        String? userEmail = await secureStorageService.read(AppConstants.userEmail);
        Get.offAll(() => VerifyAccountScreen(email: userEmail));
      }

      //
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!',message: e.toString());
    }
  }

  void navigateBasedOnUserType(String userType) {
    Fluttertoast.showToast(msg: "Login Successful!");
    if (userType == 'Student') {

      Get.offAll(() => StudentDashboard(menuScreenContext: Get.context!));
    } else
    {
      Get.offAll(() => ExpertDashboard(menuScreenContext: Get.context!));
    }
  }
}
