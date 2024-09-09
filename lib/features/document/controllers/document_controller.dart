
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/authentication/authentication_repository.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/features/authentication/models/register_response.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';
import 'package:helpinghand/features/dashboard_expert/models/expert_profile_response_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/popups/full_screen_loader.dart';
import '../../../Utils/securestorage/secure_storage_service.dart';
import '../../../common/loader/loaders.dart';
import '../../../core/network/network_manager.dart';
import '../../../data/repositories/document/documentRepository.dart';

class DocumentController extends GetxController {
  static DocumentController get instance => Get.find();

  Future<void> uploadDocument(String documentType,String docName,XFile file,String serviceId,RegisterResponse profile)async{
    try {
      //start loading
      FullScreenLoader.openLoadingDialog("Uploading a document...");

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      //form validation

      final documentRepository = Get.put(DocumentRepository());
      await documentRepository.uploadDocument(documentType,file,serviceId,profile.user.id);

      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
          title: "Success", message: "${docName} document has been uploaded successfully");

      // Get.offAll(() => VerifyAccountScreen(email: profile.user.email));


      // Move to verify email address
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }

}
