import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/spot.dart';
import 'package:white_gym/global.dart';

import '../../../model/spot.dart';

class SuggestionController extends GetxController {
  //TODO: Implement SuggestionController
  TextEditingController goodController = TextEditingController();
  TextEditingController improvementsController = TextEditingController();
  TextEditingController otherMattersController = TextEditingController();
  TextEditingController hpController = TextEditingController();
  SpotDataRepository spotDataRepository = SpotDataRepository();
  RxList<String> spotList = [
    '강남점',
    '역삼점',
    '남광장점',
    '북광장점',
    '선릉점',
  ].obs;
  List <Spot> spotList2 = <Spot>[].obs;
  RxString selectedSpot = '선택해주세요'.obs;
  RxInt selectedIndex = 3.obs;
  RxInt groupValue = 0.obs;
  List<String> radioList = [
    '시설 및 환경',
    '운영 및 시스템',
    '직원 및 서비스',
    '회원 간 매너 및 안전',
    '기타',
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getSpotList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    goodController.dispose();
    improvementsController.dispose();
    otherMattersController.dispose();
    hpController.dispose();
  }
  getSpotList() async {
    try {
      spotList2 = await spotDataRepository.getSpot();
      spotList.clear();
      for (var spot in spotList2) {
        spotList.add(spot.name);
      }
    } catch (e) {
      print('스팟 리스트 가져오기 실패: $e');
    }
  }
  saveSuggestion() async {
    try {
      if (goodController.text.isEmpty || improvementsController.text.isEmpty || otherMattersController.text.isEmpty) {
        Get.snackbar('오류', '모든 항목을 입력해주세요.');
        return;
      }
      if (selectedSpot.value == '선택해주세요') {
        Get.snackbar('오류', '스팟을 선택해주세요.');
        return;
      }
      final target = spotList2.firstWhere(
            (spot) => spot.name == selectedSpot.value);

      Map<String,dynamic> suggestionData = {
        'good': goodController.text,
        'improvements': improvementsController.text,
        'otherMatters': otherMattersController.text,
        'hp': hpController.text,
        'spot': selectedSpot.value,
        'category': radioList[groupValue.value],
        'spotId':target.documentId,
        'userDocumentId': myInfo.documentId,
        'userName': myInfo.name,
        'serviceRating': selectedIndex.value,
        'check': 0,
        'createdAt': DateTime.now(),
      };
      await spotDataRepository.saveSuggestion(suggestionData);
      Get.back();
      Get.snackbar('성공', '건의사항이 저장되었습니다.', backgroundColor: Colors.white, colorText: text22, borderRadius: 16, borderColor: gray700, borderWidth: 1);
    } catch (e) {
      print('건의사항 저장 실패: $e');
      Get.snackbar('오류', '건의사항 저장에 실패했습니다.', backgroundColor: Colors.white, colorText: text22, borderRadius: 16, borderColor: gray700, borderWidth: 1);
    }
  }
}
