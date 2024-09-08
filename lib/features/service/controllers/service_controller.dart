import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/features/service/models/expert_list_model.dart';

import '../../../Utils/popups/full_screen_loader.dart';
import '../../../common/loader/loaders.dart';
import '../../../core/network/network_manager.dart';
import '../../../data/repositories/service/serviceRepository.dart';
import '../models/requested_service.dart';


class ServiceController extends GetxController {
  static ServiceController get instance => Get.find();

//controllers
  // State variables
  var serviceRequests = <RequestedService>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getServiceRequests();
  }


  Future<void> getServiceRequests() async {
    try {
      List<RequestedService> fetchedRequests = await ServiceRepository.instance.getServiceRequests();
      serviceRequests.assignAll(fetchedRequests); // Assign the fetched data to the observable list
    } finally {
      isLoading(false); // Stop loading
    }
  }

  Future<void> sendServiceRequest(String expertId) async{
    try {
      //start loading
      FullScreenLoader.openLoadingDialog("Request for service...");

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }
      //form validation

      final serviceRepository = Get.put(ServiceRepository());
      await serviceRepository.sendServiceRequest(expertId);
      getServiceRequests();

      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
          title: "Success",
          message: "Your service request has been sent!");

      // Move to verify email address
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }

  Future<void> acceptServiceRequest(String serviceRequestId) async{
    try {
      //start loading
      FullScreenLoader.openLoadingDialog("Accepting a service...");

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }
      //form validation

      final serviceRepository = Get.put(ServiceRepository());
      await serviceRepository.acceptServiceRequest(serviceRequestId);
      getServiceRequests();

      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
          title: "Success",
          message: "Service request approved successfully");

      // Move to verify email address
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }
}
