import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/features/authentication/models/expert_model.dart';
import 'package:helpinghand/features/authentication/models/register_response.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';
import 'package:helpinghand/features/document/model/document_service.dart';
import 'package:helpinghand/features/document/screens/document_upload_screen.dart';

import '../../../../Utils/popups/full_screen_loader.dart';
import '../../../../common/loader/loaders.dart';
import '../../../../core/network/network_manager.dart';
import '../../../../data/repositories/service/serviceRepository.dart';
import 'package:helpinghand/features/service/models/service.dart';


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

  var services = <Service>[].obs;
  var isLoading = true.obs;

  void updateSelectedServices(Map<String, bool> services) {
    selectedServices.value = services;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getServiceTypes();
  }

  Future<void> getServiceTypes() async {
    try {
      List<Service> serviceList = await ServiceRepository.instance.getServiceTypes();
      services.assignAll(serviceList);
    } finally {
      isLoading(false); // Stop loading
    }
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


      // Ensure at least one expertise is selected
      if (selectedServices.entries.where((entry) => entry.value).isEmpty) {
        FullScreenLoader.stopLoading();
        Loaders.errorSnackBar(title: 'Please select at least one expertise');
        return;
      }

      // Create list of DocumentService objects
      List<DocumentService> documentServices = selectedServices.entries
          .where((entry) => entry.value) // Only selected services
          .map((entry) {
        // Find corresponding service object based on typename
        final service = services.firstWhere((service) => service.typename == entry.key);
        return DocumentService(id: service.id, type: 'Certificate',docName: service.typename);
      })
          .toList();

      final expertise = documentServices.map((docService) => docService.docName).toList();

      documentServices.add(const DocumentService(id: 'f9b2a1d3c5e678f0a1b2c3d4', type: 'ID',docName: 'Visa'));

      // Now `documentServices` contains a list of selected services

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
      RegisterResponse profile = await expertRepository.saveExpertRecord(expert);

      FullScreenLoader.stopLoading();

      // show success message
      Loaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Upload documents to continue");

      // Move to verify email address
      Get.to(() => DocumentUploadScreen(profile: profile,documentServices: documentServices,));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }
}
