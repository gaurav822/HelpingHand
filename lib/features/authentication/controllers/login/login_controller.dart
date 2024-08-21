import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../Utils/popups/full_screen_loader.dart';
import '../../../../common/loader/loaders.dart';
import '../../../../core/network/network_manager.dart';
import '../../../../repositories/authentication/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

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
    emailAddress.text = localStorage.read('REMEMBER_ME_EMAIL')??"";
    password.text = localStorage.read('REMEMBER_ME_PASSWORD')??"";
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

      // await AuthenticationRepository.instance.loginWithEmailAndPassword(emailAddress.text.trim(),password.text.trim());

      FullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

      //
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!',message: e.toString());
    }
  }
}
