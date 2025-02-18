import 'package:get/get.dart';

import 'package:white_gym/app/modules/payment/controllers/payment_detail_controller.dart';

import '../controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
  }
}

class PaymentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentDetailController>(
          () => PaymentDetailController(),
    );
  }
}