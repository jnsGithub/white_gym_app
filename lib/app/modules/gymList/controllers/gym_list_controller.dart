import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/spot.dart';
import 'package:white_gym/app/model/spot.dart';

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
    for(var i in gymList){
      double distance = Geolocator.distanceBetween(
        latitude,
        longitude,
        i.lat,
        i.lon,
      );
      i.distanceBetween = double.parse((distance / 1000).toStringAsFixed(2));
    }
    update();
  }
  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Get.snackbar('알림','위치정보 권한이 거부되었습니다.');
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
