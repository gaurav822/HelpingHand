import 'package:get/get.dart';
import 'package:helpinghand/core/network/network_manager.dart';

import '../Utils/securestorage/secure_storage_service.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(SecureStorageService());
  }
}