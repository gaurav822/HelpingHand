import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/authentication/authentication_repository.dart';
import 'package:helpinghand/data/repositories/student/student_repository.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';
import 'package:helpinghand/features/dashboard/models/student_profile.dart';

import '../../../../Utils/popups/full_screen_loader.dart';
import '../../../../common/loader/loaders.dart';
import '../../../../core/network/network_manager.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //controllers
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailAddress = TextEditingController();
  final schoolName = TextEditingController();
  final nationality = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getStudentProfile();
  }

  Future<void> getStudentProfile() async {
    try {
      isLoading(true); //
      final studentRepository = Get.put(StudentRepository());
      StudentProfileResponseModel student = await studentRepository
          .getStudentProfile();
      firstName.text = student.firstname;
      lastName.text = student.lastname;
      emailAddress.text = student.email;
      // schoolName.text=student.school;
      // nationality.text = student.nationality;
      // phoneNumber.text = student.phoneNumber;
      // address.text = student.address;
    }
    finally{
      isLoading(false); // Stop loading
    }
  }

  Future<void> logout()async{
    await AuthenticationRepository.instance.logout();
  }
}
