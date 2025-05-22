import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestionController extends GetxController {
  //TODO: Implement SuggestionController
  TextEditingController goodController = TextEditingController();

  List<String> spotList = [
    '강남점',
    '역삼점',
    '남광장점',
    '북광장점',
    '선릉점',
  ];
  RxString selectedSpot = '선택해주세요'.obs;
  RxInt selectedIndex = 1.obs;
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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
