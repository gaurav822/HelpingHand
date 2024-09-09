import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/authentication/authentication_repository.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/features/dashboard_expert/models/expert_profile_response_model.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/securestorage/secure_storage_service.dart';

class ExpertProfileController extends GetxController {
  static ExpertProfileController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final SecureStorageService secureStorageService = Get.find<SecureStorageService>();

  var isLoading = true.obs;
  final firstName = ''.obs;

  // Create an observable for the entire expert profile
  var expertProfile = Rx<ExpertProfileResponseModel?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getExpertProfile();
    getReviews();
  }

  Future<void> getExpertProfile() async {
    String? name = await secureStorageService.read(AppConstants.userName);
    firstName.value = name!;

    try {
      final expertRepository = Get.put(ExpertRepository());
      ExpertProfileResponseModel fetchedProfile = await expertRepository
          .getExpertProfile();
      expertProfile.value = fetchedProfile; // Update the observable
    }
    catch(e){
      isLoading(false); // Stop loading
    }
  }

  Future<void> getReviews() async {
    try{

    }
    finally{
      isLoading(false);
    }
  }

  Future<void> logout()async{
    await AuthenticationRepository.instance.logout();
  }
}
