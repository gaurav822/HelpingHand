import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/authentication/authentication_repository.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/data/repositories/service/serviceRepository.dart';
import 'package:helpinghand/data/repositories/student/student_repository.dart';
import 'package:helpinghand/features/authentication/models/expert_model.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';
import 'package:helpinghand/features/dashboard/models/student_profile.dart';
import 'package:helpinghand/features/dashboard/screens/student_dashboard.dart';
import 'package:helpinghand/features/service/models/expert_list_model.dart';
import 'package:helpinghand/features/service/models/requested_service.dart';

import '../../../../Utils/popups/full_screen_loader.dart';
import '../../../../common/loader/loaders.dart';
import '../../../../core/network/network_manager.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  //controllers
  // State variables
  var experts = <ExpertListModel>[].obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getExperts();
  }

  Future<void> getExperts() async {
    try {
      isLoading(true); // Start loading
      List<ExpertListModel> fetchedExperts = await ExpertRepository.instance.getExperts();
      experts.assignAll(fetchedExperts); // Assign the fetched data to the observable list
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
