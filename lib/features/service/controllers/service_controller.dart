import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/features/dashboard/controllers/dashboard_controller.dart';
import 'package:helpinghand/features/service/models/expert_list_model.dart';
import 'package:helpinghand/features/service/models/purchase_list.dart';
import 'package:helpinghand/features/service/models/service.dart';

import '../../../Utils/popups/full_screen_loader.dart';
import '../../../common/loader/loaders.dart';
import '../../../core/network/network_manager.dart';
import '../../../data/repositories/service/serviceRepository.dart';
import '../models/requested_service.dart';

class ServiceController extends GetxController {
  static ServiceController get instance => Get.find();

//controllers
  // State variables
  var serviceRequests = <StudentService>[].obs;
  var services = <Service>[].obs;
  var purchases = <Purchase>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getServiceTypes();
    getPurchasedServices();
    getServiceRequests();
  }

  Future<void> getServiceTypes() async {
    try {
      List<Service> serviceList =
          await ServiceRepository.instance.getServiceTypes();
      services.assignAll(serviceList);
    } catch (e) {
      isLoading(false); // Stop loading
    }
  }

  Future<void> getPurchasedServices() async{
    try {
      List<Purchase> purchaseList = await ServiceRepository.instance.getPurchaseList();
      print("The purchase list is ");
      log(purchaseList.toString());
      purchases.assignAll(purchaseList);
    } catch (e) {
      isLoading(false); // Stop loading
    }
  }

  Future<void> getServiceRequests() async {
    try {
      List<StudentService> fetchedRequests =
          await ServiceRepository.instance.getServiceRequests();
      serviceRequests.assignAll(
          fetchedRequests); // Assign the fetched data to the observable list
    } finally {
      isLoading(false); // Stop loading
    }
  }


  Future<void> sendServiceRequest(String expertId, String serviceTypeId) async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog("Request for service...");

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      //form validation

      final serviceRepository = Get.put(ServiceRepository());
      await serviceRepository.sendServiceRequest(expertId, serviceTypeId);
      getServiceRequests();

      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
          title: "Success", message: "Your service request has been sent!");

      // Move to verify email address
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }

  List<ExpertListModel> getExpertsByServiceType(String serviceType)  {
    List<ExpertListModel> fetchedExperts = filterExpertsByServiceType(
        DashboardController.instance.experts, serviceType);

    return fetchedExperts;
    // Assign the fetched data to the observable list
  }

  List<ExpertListModel> filterExpertsByServiceType(
      List<ExpertListModel> expertList, String serviceType) {
    return expertList
        .where((expert) => expert.expertise.contains(serviceType))
        .toList();
  }
}
