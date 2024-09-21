import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/authentication/authentication_repository.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/data/repositories/payment/payment_repository.dart';
import 'package:helpinghand/data/repositories/service/serviceRepository.dart';
import 'package:helpinghand/data/repositories/student/student_repository.dart';
import 'package:helpinghand/features/authentication/models/expert_model.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';
import 'package:helpinghand/features/dashboard/models/student_profile.dart';
import 'package:helpinghand/features/dashboard/screens/pending_payment_screen.dart';
import 'package:helpinghand/features/dashboard/screens/student_dashboard.dart';
import 'package:helpinghand/features/service/models/expert_list_model.dart';
import 'package:helpinghand/features/service/models/requested_service.dart';

import '../../../../Utils/popups/full_screen_loader.dart';
import '../../../../common/loader/loaders.dart';
import '../../../../core/network/network_manager.dart';

class PaymentController extends GetxController {
  static PaymentController get instance => Get.find();

  //controllers

  Future<void> confirmPurchase(List<String> services) async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog("Confirming your purchase...");

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      //form validation

      final paymentRepo = Get.put(PaymentRepository());
      await paymentRepo.confirmPurchase(services);

      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
          title: "Success", message: "Your payment request has been sent!");

      Get.to(()=>const PaymentPendingScreen());

      // Move to verify email address
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }
}
