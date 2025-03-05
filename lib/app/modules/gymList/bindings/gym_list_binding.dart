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
    // 페이지가 진입할 때마다 새 컨트롤러를 생성합니다.
    Get.lazyPut<GymDetailController>(() => GymDetailController(), fenix: false);
  }
  // @override
  // void dependencies() {
  //   Get.lazyPut<GymDetailController>(
  //         () => GymDetailController(),
  //       fenix: false
  //   );
  // }
}

