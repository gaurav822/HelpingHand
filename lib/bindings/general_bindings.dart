import 'package:get/get.dart';
import 'package:helpinghand/core/network/network_manager.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}