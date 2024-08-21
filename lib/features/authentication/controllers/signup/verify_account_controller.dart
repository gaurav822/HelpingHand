import 'dart:async';

import 'package:get/get.dart';


class VerifyAccountController extends GetxController {
  static VerifyAccountController get instance => Get.find();

  //Send email whenever verify email screen appears & Set timer for auto redirect
  @override
  void onInit() {
    // TODO: implement onInit
    // sendEmailVerification();
    // setTimerForAutoRedirect();
    super.onInit();
  }

  //Send email verification link

  // sendEmailVerification() async {
  //   try {
  //     await AuthenticationRepository.instance.sendEmailVerification();
  //     Loaders.successSnackBar(
  //         title: 'Email sent !',
  //         message: "Please Check your inbox and verify email.");
  //   } catch (e) {
  //     Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
  //   }
  // }

  //Timer for automatically redirect on Email Verification
  // setTimerForAutoRedirect() async {
  //   Timer.periodic(const Duration(seconds: 1), (timer) async{
  //     await FirebaseAuth.instance.currentUser?.reload();
  //     final user = FirebaseAuth.instance.currentUser;
  //     if(user?.emailVerified?? false){
  //       timer.cancel();
  //       Get.off(()=>  SuccessScreen(onPressedCallback: AuthenticationRepository.instance.screenRedirect()));
  //     }
  //   });
  // }


  // Manually check if  email Verified
  // checkEmailVerificationStatus() async {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   if(currentUser!=null && currentUser.emailVerified){
  //     Get.off(()=>  SuccessScreen(onPressedCallback: AuthenticationRepository.instance.screenRedirect()));
  //
  //   }
  // }
}
