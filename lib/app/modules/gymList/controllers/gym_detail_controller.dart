import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:white_gym/app/data/spot.dart';
import 'package:white_gym/app/model/spot_item/spot_item.dart';
import 'package:white_gym/global.dart';

import '../../../model/spot/spot.dart';

class GymDetailController extends GetxController {
  late GoogleMapController mapController;
  late Spot spot;
  SpotDataRepository spotDataRepository = SpotDataRepository();
  PageController pageController = PageController();
  late CameraPosition kGooglePlex;
  final markers = <Marker>{};
  RxInt listIndex = 0.obs;
  RxInt moreLength = 0.obs;
  RxBool haveTicket = false.obs;
  RxBool moreCheck = false.obs;
  RxList<SpotItem> spotItemList = <SpotItem>[].obs;
  List iconList = ['shower.png','publicLocker.png','locker.png','wifi.png', 'towel.png','sportswear.png',];
  List iconTextList = ['샤워부스','공용락커','개인락커','와이파이','수건대여','운동복 대여',];
  late Timer timer;
  @override
  void onInit() {
    super.onInit();
    spot = Get.arguments;
    kGooglePlex = CameraPosition(
      target: LatLng(spot.lat, spot.lon),
      zoom: 14.4746,
    );
    getSpotItem();
    markers.add(Marker(
      markerId: MarkerId('1'),
      position: LatLng(spot.lat, spot.lon),
    ));
    update();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
    timer.cancel();
    pageController.dispose();
    mapController.dispose();
  }
  getMoreList(){
    moreLength.value = spotItemList.length;
    moreCheck.value = true;
  }
  changeListIndex(i){
    listIndex.value = i;
  }
  initController(GoogleMapController controller){
    try{
      mapController=controller;
      update();
    } catch(e){
      print(e);
    }

  }
  getSpotItem() async {
    spotItemList.value = await spotDataRepository.getSpotItem(spot.documentId);
    spotItemList.value.sort((a, b) => a.index.compareTo(b.index));
    if(spotItemList.length<=3){
      moreLength.value = spotItemList.length;
      moreCheck.value = true;
    } else {
      moreLength.value = 3;
    }
    timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (listIndex.value < spot.imageUrlList.length - 1) {
        listIndex.value++;
        pageController.animateToPage(
          listIndex.value,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeIn,
        );
      } else {
        listIndex.value = 0;
        pageController.jumpToPage(0);
      }
      update();
    });

  }
}
