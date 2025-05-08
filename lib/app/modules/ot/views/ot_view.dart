import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:white_gym/app/modules/ot/controllers/ot_controller.dart';

import '../../../../global.dart';
import '../../../model/spot.dart';
import '../../../routes/app_pages.dart';

class OtView extends GetView<OtController> {
  const OtView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F7F9),
        centerTitle: true,
        title: Image.asset(
          'image/logo_text.png',
          width: size.width * 0.4187,
          height: size.height * 0.0278,
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios), // ← 원하는 아이콘으로 변경
            onPressed: () => Get.back()
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              spacing: 20,
              children: [
                Container(
                  width: 335,
                  height: 223,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 23,
                    children: [
                      Text('신청 시간', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),),
                      Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              controller.radioButton(1),
                              SizedBox(width: 8,),
                              Text('오전', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
                              SizedBox(width: 8,),
                              Text('(07:00~12:00)', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Row(
                            children: [
                              controller.radioButton(2),
                              SizedBox(width: 8,),
                              Text('낮', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
                              SizedBox(width: 22,),
                              Text('(12:00~18:00)', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Row(
                            children: [
                              controller.radioButton(3),
                              SizedBox(width: 8,),
                              Text('오후', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
                              SizedBox(width: 8,),
                              Text('(18:00~23:00)', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Text('*자세한 시간은 추후 결정되며 온, 오프라인으로 안내드립니다.', style: TextStyle(fontSize: 12, color: Color(0xffFD675C), fontWeight: FontWeight.w500),)
                        ],
                      )
                    ],
                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 335,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 22,
                      children: [
                        Text('신청 지점', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),),
                        DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    onMenuStateChange: (value){
                                      controller.isDropdownOpen.value = value;
                                    },
                                    isExpanded: true,
                                    hint: Obx(() =>
                                        Text(controller.selectedSpot.value.name.isEmpty
                                            ? '선택하세요.'
                                            : controller.selectedSpot.value.name,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: controller.selectedSpot.value.name.isEmpty
                                                  ? gray500
                                                  : mainColor,
                                              fontWeight: controller.selectedSpot.value.name.isEmpty
                                                  ? FontWeight.w400
                                                  : FontWeight.w600
                                          ),
                                        )
                                    ),
                                    iconStyleData: IconStyleData(
                                        icon: Icon(
                                          controller.isDropdownOpen.value
                                              ? Icons.keyboard_arrow_up_sharp
                                              : Icons.keyboard_arrow_down_sharp,
                                          color: gray600,),
                                        iconSize: 24
                                    ),
                                    items: controller.spotList.map((item) {
                                      return DropdownMenuItem<String>(
                                        value: item.documentId,
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(
                                          item.name,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: controller.selectedSpot.value.documentId == item.documentId
                                                  ? mainColor
                                                  : Colors.black,
                                              fontWeight: controller.selectedSpot.value.documentId == item.documentId
                                                  ? FontWeight.w600
                                                  : FontWeight.w400
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    // value: controller.selectedSpot.value,
                                    onChanged: (String? value) async {
                                      controller.selectedSpot.value = controller.spotList.firstWhere((element) => element.documentId == value);
                                      print(controller.selectedSpot.value.name);
                                      print(value);
                                    },
                                    menuItemStyleData: MenuItemStyleData(
                                      overlayColor: WidgetStateProperty.all(mainColor.withAlpha(8)),
                                      height: 50,
                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    ),
                                    buttonStyleData: ButtonStyleData(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: gray100,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.only(right: 8),
                                    ),
                                    dropdownStyleData: const DropdownStyleData(
                                      offset: Offset(0, -8),
                                      maxHeight: 300,
                                      decoration: BoxDecoration(
                                          color: bg,
                                          borderRadius: BorderRadius.all(Radius.circular(16))
                                      ),
                                    ),
                                  ),
                                ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    width: 335,
                    height: 216,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 22,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 6,
                          children: [
                            Text('유의사항', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),),
                            Text('(필수)', style: TextStyle(fontSize: 16, color: Color(0xffFD675C), fontWeight: FontWeight.w600),)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 22,
                          children: [
                            controller.requiredCheck(0, 'OT 수업시간은 회당 30분입니다.'),
                            controller.requiredCheck(1, '무료 신청 가능 횟수는 회원당 2회입니다.'),
                            controller.requiredCheck(2, '신청 지점에서 트레이너 배정 이후에 연락 드립니다.'),
                          ],
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(335, 50),
                maximumSize: Size(335, 50),
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: (){
                Get.offAllNamed(Routes.OT_SUCCESS);
              },
              child: Text('신청하기', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)),
        ),
      ),
    );
  }
}
