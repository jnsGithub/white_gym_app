import 'package:get/get.dart';

import '../controllers/gym_detail_controller.dart';
import '../controllers/gym_list_controller.dart';

class GymListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GymListController>(
      () => GymListController(),
    );
  }
}
class GymDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GymDetailController>(
          () => GymDetailController(),
    );
  }
}

