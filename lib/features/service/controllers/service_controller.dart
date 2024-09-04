import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/features/service/models/expert_list_model.dart';

import '../../../core/network/network_manager.dart';


class ServiceController extends GetxController {
  static ServiceController get instance => Get.find();


  void requestService() async{
    final isConnected = await NetworkManager.instance.isConnected();

    if (!isConnected){
      Fluttertoast.showToast(msg: "Check Internet Connection");
      return;
    }
  }
}
