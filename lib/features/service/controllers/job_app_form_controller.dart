import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/dashboard/screens/student_dashboard.dart';

import '../../../Utils/popups/full_screen_loader.dart';
import '../../../common/loader/loaders.dart';
import '../../../core/network/network_manager.dart';

class JobAppFormController extends GetxController {
  static JobAppFormController get instance => Get.find();

  //controllers
  final hidePassword = true.obs; //Observable for hiding/showing password
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final visaStatus = TextEditingController();
  final emailAddress = TextEditingController();
  final schoolEmailAddress = TextEditingController();
  final schoolName = TextEditingController();
  final nationality = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  final course = TextEditingController();
  final gradDate = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void submitForm()async{
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

    Future.delayed(const Duration(seconds: 3), () {
      // Code to execute after 3 seconds
      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: "Success",
          message: "Your application has been sent!");

      Get.offAll(StudentDashboard(menuScreenContext: Get.context!));

    });

  }

}