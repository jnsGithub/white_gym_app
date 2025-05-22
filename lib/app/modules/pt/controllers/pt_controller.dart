import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PtController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement PtController
  TabController? tabController;
  RxInt selectedPageNumber = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
