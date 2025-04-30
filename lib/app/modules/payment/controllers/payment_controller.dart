import 'package:get/get.dart';

import '../../../model/spot/spot.dart';
import '../../../model/spot_item/spot_item.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController
  RxBool check1 = false.obs;
  RxBool check2 = false.obs;
  RxBool ready = false.obs;
  RxInt ticketIndex = 99999.obs;
  RxList<SpotItem> spotItemList = Get.arguments['spotItemList'];
  Spot spot = Get.arguments['spot'];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  checkTicket(index) {
    ticketIndex.value = index;
    ready.value = true;
    check1.value = false;
    check2.value = false;
  }
}
