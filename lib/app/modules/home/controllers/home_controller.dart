import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print('HomeController onInit');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentStoreVersion('com.white.gym.app.white_gym');
    });
    print('currentStoreVersion : ${box.read('currentStoreVersion')}');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
