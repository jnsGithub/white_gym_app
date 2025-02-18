import 'package:get/get.dart';

import 'package:white_gym/app/modules/myPage/controllers/card_list_controller.dart';
import 'package:white_gym/app/modules/myPage/controllers/edit_hp_controller.dart';
import 'package:white_gym/app/modules/myPage/controllers/payment_list_controller.dart';
import 'package:white_gym/app/modules/myPage/controllers/setting_controller.dart';

import '../controllers/my_page_controller.dart';

class MyPageBinding extends Bindings {
  @override
  void dependencies() {


    Get.lazyPut<MyPageController>(
      () => MyPageController(),
    );
  }
}

class CardListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardListController>(
      () => CardListController(),
    );
  }
}

class PaymentListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentListController>(
      () => PaymentListController(),
    );
  }
}

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}

class EditHpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditHpController>(
      () => EditHpController(),
    );
  }
}