import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/features/authentication/models/expert_model.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';

import '../../../../Utils/popups/full_screen_loader.dart';
import '../../../../common/loader/loaders.dart';
import '../../../../core/network/network_manager.dart';

class ExpertSignUpController extends GetxController {
  static ExpertSignUpController get instance => Get.find();
  final rememberMe = false.obs;
  //controllers
  final hidePassword = true.obs; //Observable for hiding/showing password
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailAddress = TextEditingController();
  final nationality = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final bio = TextEditingController();
  final password = TextEditingController();
  final rating = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // Add this to hold selected services
  final RxMap<String, bool> selectedServices = <String, bool>{}.obs;

  void updateSelectedServices(Map<String, bool> services) {
    selectedServices.value = services;
  }

  void signUp() async {
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

      // Collect selected services
      final expertise = selectedServices.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();

      print(expertise);

      // save authenticated user to firebase firestore
      final expert = ExpertModel(
          firstname: firstName.text.trim(),
          lastname: lastName.text.trim(),
          email: emailAddress.text.trim(),
          nationality: nationality.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          address: address.text.trim(),
          password: password.text.trim(),
          bio: bio.text.trim(),
          expertise: expertise,
          rating: 5
      );

      final expertRepository = Get.put(ExpertRepository());
      await expertRepository.saveExpertRecord(expert);

      FullScreenLoader.stopLoading();

      // show success message
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
