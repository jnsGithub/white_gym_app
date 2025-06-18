import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:white_gym/app/data/send_email.dart';
import 'package:white_gym/app/modules/ot/controllers/ot_controller.dart';
import 'package:white_gym/app/modules/ot/controllers/ot_controller22.dart';

import '../../../../global.dart';
import '../../../model/spot.dart';
import '../../../routes/app_pages.dart';

class OtView22 extends GetView<OtController22> {
  const OtView22({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthScale = size.width / baseWidth;
    double heightScale = size.height / baseHeight;

    return Scaffold(
      backgroundColor: Color(0xffFf7F7F9),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F7F9),
        centerTitle: true,
        title: Image.asset(
          'image/logo_text.png',
          width: 157 * widthScale,
          height: 22.6 * heightScale,
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios), // ← 원하는 아이콘으로 변경
            onPressed: () => Get.back()
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * widthScale, vertical: 20 * heightScale),
          child: Center(
            child: Column(
              spacing: 20 * heightScale,
              children: [
                Container(
                  width: 335 * widthScale,
                  height: 223 * heightScale,
                  padding: EdgeInsets.symmetric(horizontal: 20 * widthScale, vertical: 20 * heightScale),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 23 * heightScale,
                    children: [
                      Text('신청 시간', style: TextStyle(fontSize: 20 * widthScale, color: Colors.black, fontWeight: FontWeight.w600),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16 * heightScale,
                        children: [
                          Row(
                            children: [
                              controller.radioButton(0, widthScale, heightScale),
                              SizedBox(width: 12 * widthScale,),
                              Text('오전', style: TextStyle(fontSize: 16 * widthScale, color: Colors.black, fontWeight: FontWeight.w400),),
                              SizedBox(width: 6 * widthScale,),
                              Text('(07:00~12:00)', style: TextStyle(fontSize: 16 * widthScale, color: Colors.black, fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Row(
                            children: [
                              controller.radioButton(1, widthScale, heightScale),
                              SizedBox(width: 12 * widthScale,),
                              Text('낮', style: TextStyle(fontSize: 16 * widthScale, color: Colors.black, fontWeight: FontWeight.w400),),
                              SizedBox(width: 22 * widthScale,),
                              Text('(12:00~18:00)', style: TextStyle(fontSize: 16 * widthScale, color: Colors.black, fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Row(
                            children: [
                              controller.radioButton(2, widthScale, heightScale),
                              SizedBox(width: 8 * widthScale,),
                              Text('오후', style: TextStyle(fontSize: 16 * widthScale, color: Colors.black, fontWeight: FontWeight.w400),),
                              SizedBox(width: 8 * widthScale,),
                              Text('(18:00~23:00)', style: TextStyle(fontSize: 16 * widthScale, color: Colors.black, fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Text('*자세한 시간은 추후 결정되며 온, 오프라인으로 안내드립니다.', style: TextStyle(fontSize: 12 * widthScale, color: Color(0xffFD675C), fontWeight: FontWeight.w500),)
                        ],
                      )
                    ],
                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20 * widthScale),
                  width: 335 * widthScale,
                  height: 140 * widthScale,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 22 * heightScale,
                    children: [
                      Text('신청 지점', style: TextStyle(fontSize: 20 * widthScale, color: Colors.black, fontWeight: FontWeight.w600),),
                      Obx(() => DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            onMenuStateChange: (value){
                              controller.isDropdownOpen.value = value;
                            },
                            isExpanded: true,
                            hint: Text(controller.selectedSpot.value.name.isEmpty
                                ? '선택하세요.'
                                : controller.selectedSpot.value.name,
                              style: TextStyle(
                                  fontSize: 16 * widthScale,
                                  color: controller.selectedSpot.value.name.isEmpty
                                      ? gray500
                                      : mainColor,
                                  fontWeight: controller.selectedSpot.value.name.isEmpty
                                      ? FontWeight.w400
                                      : FontWeight.w600
                              ),
                            ),
                            iconStyleData: IconStyleData(
                                icon: Icon(
                                  controller.isDropdownOpen.value
                                      ? Icons.keyboard_arrow_up_sharp
                                      : Icons.keyboard_arrow_down_sharp,
                                  color: gray600,),
                                iconSize: 24 * widthScale
                            ),
                            items: controller.spotList.map((item) {
                              return DropdownMenuItem<String>(
                                value: item.documentId,
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                      fontSize: 16 * widthScale,
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
                              height: 50 * heightScale,
                              padding: EdgeInsets.symmetric(horizontal: 16 * widthScale, vertical: 12 * heightScale),
                            ),
                            buttonStyleData: ButtonStyleData(
                              height: 48 * heightScale,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: gray100,
                                  width: 1 * widthScale,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.only(right: 8 * widthScale),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              offset: Offset(0, -8),
                              maxHeight: 300 * heightScale,
                              decoration: BoxDecoration(
                                  color: bg,
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20 * heightScale, horizontal: 20 * widthScale),
                    width: 335 * widthScale,
                    height: 216 * heightScale,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 22 * heightScale,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 6 * widthScale,
                          children: [
                            Text('유의사항', style: TextStyle(fontSize: 20 * widthScale, color: Colors.black, fontWeight: FontWeight.w600),),
                            Text('(필수)', style: TextStyle(fontSize: 16 * widthScale, color: Color(0xffFD675C), fontWeight: FontWeight.w600),)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 22 * heightScale,
                          children: [
                            controller.requiredCheck(0, 'OT 수업시간은 회당 30분입니다.', 16 * widthScale),
                            controller.requiredCheck(1, '무료 신청 가능 횟수는 회원당 2회입니다.', 16 * widthScale),
                            controller.requiredCheck(2, '신청 지점에서 트레이너 배정 이후에 연락 드립니다.', 16 * widthScale),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 24),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(335, 50),
              maximumSize: Size(335, 50),
              backgroundColor: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () async {
              if(myInfo.otCount <= 0){
                if(!Get.isSnackbarOpen){
                  Get.snackbar('신청 실패', 'OT 수업 신청 가능 횟수를 초과했습니다.',backgroundColor: Colors.white,colorText:Colors.red,borderRadius:16,borderColor: gray700,borderWidth: 1);
                }
                return;
              }
              if(controller.selectedSpot.value.name.isEmpty){
                if(!Get.isSnackbarOpen){
                  Get.snackbar('신청 실패', '신청 지점을 선택해주세요.',backgroundColor: Colors.white,colorText:Colors.red,borderRadius:16,borderColor: gray700,borderWidth: 1);
                }
                return;
              }
              if(controller.isRequiredCheck.contains(false.obs)){
                if(!Get.isSnackbarOpen){
                  Get.snackbar('신청 실패', '모든 유의사항에 동의해주세요.',backgroundColor: Colors.white,colorText:Colors.red,borderRadius:16,borderColor: gray700,borderWidth: 1);
                }
                return;
              }
              saving(context);
              if(await SendEmail().sendEmail(controller.selectedSpot.value, controller.selectedIndex, controller.selectedTime)){
                Get.back();
                if(!Get.isSnackbarOpen) {
                  controller.userDataRepository.updateOtCount(myInfo.otCount - 1);
                  Get.offAllNamed(Routes.OT_SUCCESS);
                  Get.snackbar(
                      '신청 완료', '신청이 완료되었습니다.', backgroundColor: Colors.white,
                      colorText: Colors.black,
                      borderRadius: 16,
                      borderColor: gray700,
                      borderWidth: 1);
                }
              }
              else{
                Get.back();
                if(!Get.isSnackbarOpen) {
                  Get.snackbar(
                      '신청 실패', '인포에 문의해주세요.', backgroundColor: Colors.white,
                      colorText: Colors.red,
                      borderRadius: 16,
                      borderColor: gray700,
                      borderWidth: 1);
                }
                return;
              }
            },
            child: Text('신청하기', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)),
      ),
    );
  }
}
