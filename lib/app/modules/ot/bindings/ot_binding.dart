import 'package:get/get.dart';

import '../controllers/ot_controller.dart';

class OtBinding extends Bindings {
  @override
  void dependencies() {
    // Add your dependencies here
    Get.lazyPut(() => OtController());
  }
}