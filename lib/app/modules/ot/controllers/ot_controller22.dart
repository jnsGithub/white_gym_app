import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:white_gym/app/data/spot.dart';

import '../../../../global.dart';
import '../../../data/userData.dart';
import '../../../model/spot.dart';

class OtController22 extends GetxController{
  RxInt selectedValue = 0.obs;
  RxBool isDropdownOpen = false.obs;
  List<RxBool> isRequiredCheck = <RxBool>[false.obs, false.obs, false.obs].obs;
  RxList<Spot> spotList = <Spot>[].obs;
  int selectedIndex = 0;
  String selectedTime = '오전 (07:00~12:00)';
  Rx<Spot> selectedSpot = Spot.empty().obs;
  UserDataRepository userDataRepository = UserDataRepository();
  SpotDataRepository spotDataRepository = SpotDataRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Get.arguments);
    init();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void init() async {
    getSpot(Get.arguments);

    update();
  }

  void getSpot(String docId) async {
    final spots = await spotDataRepository.getSpot(docId: docId.isEmpty ? null : docId);
    spotList.assignAll(spots);
    print(spotList.length);
    selectedSpot.value = spotList[0];

    // if(Get.arguments != ''){
    //   for(int i = 0; i < spotList.length; i++){
    //     if(spotList[i].documentId != Get.arguments){
    //       spotList.removeAt(i);
    //     }
    //   }
    // }
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
        print(spotList.length);
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
}