import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

}