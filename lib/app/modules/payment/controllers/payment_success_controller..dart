import 'package:get/get.dart';

class PaymentSuccessController extends GetxController{
  String spotDocumentId = '';

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      spotDocumentId = Get.arguments;
    }
  }
  @override
  void onClose() {
    super.onClose();
  }
}