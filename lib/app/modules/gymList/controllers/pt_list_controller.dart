import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:white_gym/app/data/spot.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:white_gym/app/model/spot.dart';
import 'package:white_gym/app/model/staff.dart';

import '../../../../global.dart';

class PtListController extends GetxController {
  late Spot spot;
  UserDataRepository userDataRepository = UserDataRepository();
  RxList<Staff> staffList = <Staff>[].obs;
  @override
  void onInit() {
    super.onInit();
    spot = Get.arguments;
    getTRList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getTRList() async {
    staffList.value = await userDataRepository.getTR(spot.documentId);
  }
}
