import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firstName.text = "Gaurav";
    lastName.text = "Dahal";
    schoolName.text="CQUniversity";
    emailAddress.text="gaurav.dahal@cqumail.com";
    nationality.text="Nepal";
    phoneNumber.text="0493348778";
    address.text = "Granville,NSW";
  }
}
