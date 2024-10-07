import 'package:get/get.dart';
import 'package:helpinghand/features/dashboard_expert/models/expert_service.dart';

import '../../../Utils/popups/full_screen_loader.dart';
import '../../../common/loader/loaders.dart';
import '../../../core/network/network_manager.dart';
import '../../../data/repositories/service/serviceRepository.dart';

class ExpertServiceController extends GetxController {

  static ExpertServiceController get instance => Get.find();

  var isLoading = true.obs;

  var services = <Service>[].obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getExpertServices();
  }



  Future<void> getExpertServices() async {
    try {
      List<Service> fetchedSer =
      await ServiceRepository.instance.getExpertServices();
      services.assignAll(
          fetchedSer); // Assign the fetched data to the observable list
    } finally {
      isLoading(false); // Stop loading
    }
  }


  Future<void> acceptServiceRequest(String serviceRequestId) async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog("Accepting a service...");

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      //form validation

      final serviceRepository = Get.put(ServiceRepository());
      await serviceRepository.acceptServiceRequest(serviceRequestId);
      getExpertServices();

      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
          title: "Success", message: "Service request approved successfully");

      // Move to verify email address
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }

}