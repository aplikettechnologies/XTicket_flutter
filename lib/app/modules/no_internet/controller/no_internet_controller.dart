import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../screens/no_internet_screen.dart';

class NoInternetController extends GetxController {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  String connectionStatus = 'ConnectionStatus---->';

  // check connection changes
  void listenConnectionChanges() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      ConnectivityResult result,
    ) {
      if (result == ConnectivityResult.none) {
        connectionType(result);
        Get.to(NoInternetScreen());
      } else {
        connectionType(result);
        Get.back();
      }
    });
    update();
  }

  // check inital connection
  checkInitalConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      log('$connectionStatus No connection available');
      Get.to(NoInternetScreen());
    } else {
      log('$connectionStatus  connection available');
    }
  }

  // check conneciton type
  void connectionType(status) {
    if (status == ConnectivityResult.mobile) {
      log('$connectionStatus Mobile data connection is being used.');
    } else if (status == ConnectivityResult.wifi) {
      log('$connectionStatus Wi-Fi connection is being used.');
    } else if (status == ConnectivityResult.bluetooth) {
      log('$connectionStatus Bluetooth connection is being used.');
    } else if (status == ConnectivityResult.ethernet) {
      log('$connectionStatus Ethernet connection is being used.');
    } else if (status == ConnectivityResult.other) {
      log('$connectionStatus Bluetooth connection is being used.');
    } else if (status == ConnectivityResult.vpn) {
      log('$connectionStatus VPN connection is being used.');
    } else if (status == ConnectivityResult.none) {
      log('$connectionStatus No connection available');
    }
  }

  @override
  void onInit() {
    checkInitalConnection();
    listenConnectionChanges();
    super.onInit();
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  RxBool isRetry = false.obs;
  Future<void> retry() async {
    isRetry.value = true;
    update();
    await Connectivity().checkConnectivity().whenComplete(() async {
      await Future.delayed(Duration(seconds: 1));
      isRetry.value = false;
      update();
    });
  }
}
