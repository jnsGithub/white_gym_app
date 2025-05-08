import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:white_gym/app/data/spot.dart';

import '../../../../global.dart';
import '../../../model/spot.dart';

class OtController extends GetxController{
  RxInt selectedValue = 1.obs;
  RxBool isDropdownOpen = false.obs;
  List<RxBool> isRequiredCheck = <RxBool>[false.obs, false.obs, false.obs].obs;
  RxList<Spot> spotList = <Spot>[].obs;

  Rx<Spot> selectedSpot = Spot.empty().obs;

  SpotDataRepository spotDataRepository = SpotDataRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void init() async {
   spotList = await spotDataRepository.getSpot();
  }

  Widget radioButton(int index){
    return Transform.translate(
      offset: Offset(-4, 0), // ← x축으로 -10만큼 이동
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
            }),
      ),
    );
  }
  Widget requiredCheck(int index, String text){
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
                    fontSize: 16,
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