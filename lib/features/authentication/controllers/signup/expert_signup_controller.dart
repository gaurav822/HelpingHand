import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';

import '../../../../Utils/popups/full_screen_loader.dart';
import '../../../../common/loader/loaders.dart';
import '../../../../core/network/network_manager.dart';
import '../../../../repositories/authentication/authentication_repository.dart';

class ExpertSignUpController extends GetxController {
  static ExpertSignUpController get instance => Get.find();
  final rememberMe = false.obs;
  //controllers
  final hidePassword = true.obs; //Observable for hiding/showing password
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailAddress = TextEditingController();
  final schoolName = TextEditingController();
  final nationality = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final bio = TextEditingController();
  final password = TextEditingController();
  final hotelPan = TextEditingController();
  final hotelAddress = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signUp({String? role}) async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog("Processing your information...");

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }
      //form validation

      if (!formKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Register user in firebase authentication and save user data in the firebase
      // final userCredential = await AuthenticationRepository.instance
      //     .registerWithEmailAndPassword(
      //     emailAddress.text.trim(), password.text.trim());

      //save authenticated user to firebase firestore
      // final user = UserModel(
      //     id: userCredential.user!.uid,
      //     role: role!,
      //     firstname: firstName.text.trim(),
      //     lastname: lastName.text.trim(),
      //     email: emailAddress.text.trim(),
      //     phoneNumber: phoneNumber.text.trim(),
      //     address: address.text.trim(),
      //     businessPanNumber: hotelPan.text.trim());

      // final userRepository = Get.put(UserRepository());
      // await userRepository.saveUserRecord(user);

      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Verify email to continue");

      // Move to verify email address
      Get.to(() => VerifyAccountScreen(email: emailAddress.text.trim(),));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }
}
