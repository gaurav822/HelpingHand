import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/authentication/models/student_model.dart';
import 'package:helpinghand/features/authentication/models/register_response.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';
import 'package:helpinghand/features/document/model/document_service.dart';
import 'package:helpinghand/features/document/screens/document_upload_screen.dart';
import 'package:helpinghand/features/service/models/service.dart';

import '../../../../Utils/popups/full_screen_loader.dart';
import '../../../../common/loader/loaders.dart';
import '../../../../core/network/network_manager.dart';
import '../../../../data/repositories/student/student_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //controllers
  final hidePassword = true.obs; //Observable for hiding/showing password
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailAddress = TextEditingController();
  final schoolEmailAddress = TextEditingController();
  final schoolName = TextEditingController();
  final nationality = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

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

      // save authenticated user to firebase firestore
      final student = StudentModel(
          firstname: firstName.text.trim(),
          lastname: lastName.text.trim(),
          // school: schoolName.text.trim(),
          email: emailAddress.text.trim(),
          // schoolEmail: schoolEmailAddress.text.trim(),
          // nationality: nationality.text.trim(),
          // phoneNumber: phoneNumber.text.trim(),
          // address: address.text.trim(),
          password: password.text.trim());

      final studentRepository = Get.put(StudentRepository());
      RegisterResponse studentRegister = await studentRepository.saveStudentRecord(student);

      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Upload document to continue");

      // Move to verify email address
      Get.to(() => DocumentUploadScreen(profile:studentRegister, documentServices: const [DocumentService(id: 'f9b2a1d3c5e678f0a1b2c3d4', type: 'ID',docName: 'Visa')],));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }
}
