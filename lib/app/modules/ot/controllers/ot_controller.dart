import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:white_gym/app/data/ptSchedules.dart';
import 'package:white_gym/app/data/spot.dart';
import 'package:white_gym/app/model/staff.dart';

import '../../../../global.dart';
import '../../../data/userData.dart';
import '../../../model/spot.dart';

class OtController extends GetxController{
  PtSchedules ptSchedules = PtSchedules();
  int selectedIndex = 0;
  String selectedTime = '오전 (07:00~12:00)';
  List<RxBool> isRequiredCheck = <RxBool>[false.obs,false.obs, false.obs, false.obs].obs;
  final List<String> options = [
    '다이어트',
    '바디 프로필',
    '기초 체력 증진',
    '근력 증가',
    '운동 방법 학습',
    '기타',
  ];

  // 각 옵션별 선택 상태를 저장할 맵
  RxMap<String, bool> selectedMap = <String, bool>{}.obs;
  RxInt selectedValue = 0.obs;
  RxBool isDropdownOpen = false.obs;
  RxBool recommendation = false.obs;
  RxInt selectedTR = 9999.obs;
  RxList<Staff> staffList = <Staff>[].obs;
  RxList<Spot> spotList = <Spot>[].obs;
  TextEditingController diseaseController = TextEditingController();
  ScrollController scrollController = ScrollController();
  UserDataRepository userDataRepository = UserDataRepository();
  SpotDataRepository spotDataRepository = SpotDataRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Get.arguments);
    staffList.value = (Get.arguments as List<Staff>?) ?? [];
    selectedMap.value = {
      for (var option in options) option: false,
    };
    // init();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Widget radioButton(int index, double widthScale, double heightScale) {
    return Transform.translate(
      offset: Offset(-4 * widthScale, 0), // ← x축으로 -10만큼 이동
      child: Transform.scale(
        scale: 1.25,
        child: Radio(
            value: index,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // ← 터치영역 축소
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (selectedValue.value == index) {
                return mainColor; // ✅ 비활성화 시 색상
              }
              return gray100; // ✅ 기본 색상
            }),
            groupValue: selectedValue.value,
            onChanged: (value){
              selectedValue.value = value!;
              selectedIndex = index;
              selectedTime = index == 0
                  ? '오전 (07:00~12:00)'
                  : index == 1
                  ? '낮 (12:00~18:00)'
                  : '오후 (18:00~23:00)';
            }
            ),
      ),
    );
  }
  Widget requiredCheck(int index, String text, double fontSize){
    return Obx(() => GestureDetector(
      onTap: (){
        isRequiredCheck[index].value = !isRequiredCheck[index].value;
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.check, color: isRequiredCheck[index].value ? mainColor : gray100, size: 20,),
            SizedBox(width: 8,),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  height: 1.4,
                    fontSize: fontSize,
                    color: isRequiredCheck[index].value
                        ? mainColor
                        : Colors.black,
                    fontWeight: isRequiredCheck[index].value
                        ? FontWeight.w600
                        : FontWeight.w400
                ),
                maxLines: 3,
                softWrap: true,
              ),
            )
          ],
        ),
    ),
    );
  }
  addOt () async {
    try {
      Map<String,dynamic> ot = {
        'userDocumentId': myInfo.documentId,
        'trainerDocumentId':selectedTR.value == 9999 ? '' : staffList[selectedTR.value].documentId,
        'trainerName': selectedTR.value == 9999 ? '' : staffList[selectedTR.value].name,
        'trainingType': 'OT',
        'trainingPart': [],
        'status': 0, // 0: 예약 대기, 1: 예약 확정, 2: 취소
        'createDate': DateTime.now(),
        'wishTimeValue': selectedIndex,
        'exercisePurpose':selectedMap.keys.where((key) => selectedMap[key]!).toList(),
        'isOt': true,
        'isNoShowConfirmed': false,
        'comment': '',
        'attendanceTimeList': [],
        'noShowConfirmDate': null,
        'noShowConfirmMangerName': null,
        'noShowConfirmManagerId': null,
        'notice': '',
        'ptTicketId': '',
        'reservationDate': null,
      };
      bool a = await ptSchedules.addOtSchedule(ot);
      return a;
    } catch (e){
      print(e);
      Get.snackbar(
        유저의 오티 숫자 올라가게 해야함
          '신청 실패', 'OT 신청 횟수 소진22', backgroundColor: Colors.white,
          colorText: Colors.red,
          borderRadius: 16,
          borderColor: gray700,
          borderWidth: 1);
     return false;
    }
  }
}