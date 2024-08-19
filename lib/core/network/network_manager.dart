import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController{

  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;
  /// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
  super.onInit();
  _connectivitySubscription =  _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value = result[0];
    if (_connectionStatus.value == ConnectivityResult.none) {
      Fluttertoast.showToast(msg: "No internet connection");
    }
  }

  Future<bool> isConnected() async {

    try{
      final result = await _connectivity.checkConnectivity();

      if(result==ConnectivityResult.none){
        return false;
      }
      else {
        return true;
      }
    } on PlatformException catch(e){
        return false;
    }
  }

}