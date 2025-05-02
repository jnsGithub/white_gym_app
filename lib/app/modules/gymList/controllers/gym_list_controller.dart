import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/spot.dart';
import 'package:white_gym/app/model/spot/spot.dart';

import '../../../../global.dart';

class GymListController extends GetxController {
  RxList<Spot> gymList = <Spot>[].obs;
  SpotDataRepository spotDataRepository = SpotDataRepository();
  double longitude = 0;
  double latitude = 0;
  RxBool isNotLatLon= false.obs;
  RxBool isFirst = false.obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentStoreVersion('com.white.gym.app.white_gym');
    });
    getCurrentLocation();
    isFirst.value = Get.routing.previous == '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getSpot() async {
    gymList.value = await spotDataRepository.getSpot();
    gymList.value = gymList.map((i) {
      double distance = Geolocator.distanceBetween(
        latitude,
        longitude,
        i.lat,
        i.lon,
      );
      return i.copyWith(
        distanceBetween: double.parse((distance / 1000).toStringAsFixed(2)),
      );
    }).toList();
    gymList.sort((a, b) => a.distanceBetween.compareTo(b.distanceBetween));
    update();
  }

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Get.snackbar('알림','위치정보 권한이 거부되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      isNotLatLon.value = true;
      getSpot();
      update();
      return;
    }
//37.4752957436392
    //126.98937929355"
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    longitude = position.longitude;
    latitude = position.latitude;
    getSpot();
  }

}
