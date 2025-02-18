import 'package:get/get.dart';
import '../controllers/main_home_controller.dart';
import '../controllers/pause_ticket_controller.dart';

class PauseTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PauseTicketController>(
      () => PauseTicketController(),
    );

  }
}
class MainHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainHomeController>(
          () => MainHomeController(),
    );
  }
}