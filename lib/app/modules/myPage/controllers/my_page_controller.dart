import 'package:get/get.dart';

import '../../../../global.dart';

class MyPageController extends GetxController {
  //TODO: Implement MyPageController

  final count = 0.obs;
  RxBool isDone = false.obs;
  @override
  void onInit() {
    super.onInit();
    isDone.value = myInfo.ticket.endDate.isBefore(DateTime.now().add(Duration(days: -1)));
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
