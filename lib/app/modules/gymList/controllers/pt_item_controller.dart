import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:white_gym/app/model/spot.dart';
import 'package:white_gym/app/model/staff.dart';

import '../../../model/ptItem.dart';
import '../../../model/review/review.dart';

class PtItemController extends GetxController {
  //TODO: Implement PtItemController

  Staff trainer = Get.arguments['trainer'];
  Spot spot = Get.arguments['spot'];

  Rx<TimeOfDay> startWeekdaysTime = TimeOfDay(hour: 0, minute: 0).obs;
  Rx<TimeOfDay> endWeekdaysTime = TimeOfDay(hour: 0, minute: 0).obs;
  Rx<TimeOfDay> startWeekendTime = TimeOfDay(hour: 0, minute: 0).obs;
  Rx<TimeOfDay> endWeekendTime = TimeOfDay(hour: 0, minute: 0).obs;

  RxList ptGroupList = [].obs;
  RxList<PtItem> ptItemList = <PtItem>[].obs;
  RxList<Review> reviewList = <Review>[].obs;
  RxInt tabIndex = 0.obs;
  RxDouble screenHeight =  MediaQuery.of(Get.context!).size.height.obs;
  RxBool isLoading = false.obs;


  UserDataRepository userDataRepository = UserDataRepository();

  @override
  void onInit() {
    super.onInit();
    if(trainer.weekdaysTime != ''){
      startWeekdaysTime.value = TimeOfDay(
        hour: int.parse(trainer.weekdaysTime.split(' ~ ')[0].split(':')[0]),
        minute: int.parse(trainer.weekdaysTime.split(' ~ ')[0].split(':')[1]),
      );
      endWeekdaysTime.value = TimeOfDay(
        hour: int.parse(trainer.weekdaysTime.split(' ~ ')[1].split(':')[0]),
        minute: int.parse(trainer.weekdaysTime.split(' ~ ')[1].split(':')[1]),
      );
    }
    if(trainer.weekendTime != ''){
      startWeekendTime.value = TimeOfDay(
        hour: int.parse(trainer.weekendTime.split(' ~ ')[0].split(':')[0]),
        minute: int.parse(trainer.weekendTime.split(' ~ ')[0].split(':')[1]),
      );
      endWeekendTime.value = TimeOfDay(
        hour: int.parse(trainer.weekendTime.split(' ~ ')[1].split(':')[0]),
        minute: int.parse(trainer.weekendTime.split(' ~ ')[1].split(':')[1]),
      );
    }
    getPtGroupList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getPtGroupList() async {
    ptGroupList.value = await userDataRepository.getPtGroupList(trainer.documentId);

    List ptGroupListCopy = ptGroupList.toList();
    for(var ptGroup in ptGroupListCopy) {
      List ptItem = await userDataRepository.getPtItem(trainer.documentId,ptGroup['id']);
      if(ptItem.isEmpty) {
        ptGroupList.remove(ptGroup);
      } else {
        ptGroup['ptItemList'] = ptItem;
        screenHeight.value += ((ptItem.length * 78)+((ptItem.length-1)*20)+95+26) .toDouble();
      }
    }
    isLoading.value = true;
    reviewList.value = await userDataRepository.getReview(trainer.documentId);
  }
}
