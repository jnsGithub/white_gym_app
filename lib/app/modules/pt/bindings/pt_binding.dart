import 'package:get/get.dart';

import '../controllers/pt_controller.dart';

class PtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PtController>(
      () => PtController(),
    );
  }
}
