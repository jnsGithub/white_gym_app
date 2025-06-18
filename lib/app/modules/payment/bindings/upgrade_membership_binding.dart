import 'package:get/get.dart';
import '../controllers/upgrade_membership_controller.dart';

class UpgradeMembershipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpgradeMembershipController>(
      () => UpgradeMembershipController(),
    );
  }
}
