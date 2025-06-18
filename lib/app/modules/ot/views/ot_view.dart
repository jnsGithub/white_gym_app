import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:white_gym/app/data/send_email.dart';
import 'package:white_gym/app/modules/ot/controllers/ot_controller.dart';

import '../../../../global.dart';
import '../../../model/spot.dart';
import '../../../routes/app_pages.dart';

class OtView extends GetView<OtController> {
  const OtView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthScale = size.width / baseWidth;
    double heightScale = size.height / baseHeight;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 화면을 클릭하면 키보드가 내려가도록 설정
      },
      child: Scaffold(
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
          controller: controller.scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 * widthScale, vertical: 20 * heightScale),
            child: Column(
              spacing: 20 * heightScale,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.only(left: 20,top: 22,bottom: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('트레이너 선택',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                      SizedBox(height: 16 * heightScale,),
                      SizedBox(
                        width: size.width ,
                        height: size.width * 0.456,
                        child: Obx(()=>
                            ListView.builder(
                                itemCount: controller.staffList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return GestureDetector(
                                    onTap: (){
                                      if(controller.recommendation.value){
                                        return;
                                      }
                                      controller.selectedTR.value = index == controller.selectedTR.value ? 9999:index;

                                    },
                                    child: Column(
                                      children: [
                                        Obx(()=>
                                           Container(
                                            width: size.width * 0.2933,
                                            height: size.width*0.2933,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              image: DecorationImage(
                                                opacity:controller.selectedTR.value==index?1:0.5,
                                                image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/white-gym.firebasestorage.app/o/spot%2F2025-01-31%2013%3A35%3A23.968?alt=media&token=d5bc1e8d-b5a6-424f-bed5-698ced2efd94'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8,),
                                        Row(
                                          spacing: 4,
                                          children: [
                                            Text(
                                              controller.staffList[index].name,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: gray900,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.4
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              controller.staffList[index].name,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: gray900,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.4
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4,),
                                        Obx(()=> controller.selectedTR.value == index ? Icon(Icons.check,color: mainColor,size: 24,):Container())
                                      ],
                                    ),
                                  );
                                }
                            ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('트레이너 선택이 어렵다면?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                      SizedBox(height: 12),
                      Obx(()=>
                          GestureDetector(
                            onTap: () {
                              controller.recommendation.value = !controller.recommendation.value;
                              if(controller.recommendation.value) {
                                controller.selectedTR.value = 9999; // 자동 배정 선택 시 인덱스 9999로 설정
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  // 선택된 상태면 파란 체크박스, 아니면 회색 빈 박스
                                  controller.recommendation.value
                                      ? Icons.check_box_rounded
                                      : Icons.check_box,
                                  color: controller.recommendation.value ? mainColor : gray100,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  '자동 배정',
                                  style: TextStyle(
                                      fontSize: 16,
                                      height: 1.4,
                                      color: gray900
                                  ),
                                ),
                              ],
                            ),
                          ),
                      )
                    ],
                  ),
                ),
                Container(
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
                          Text('*자세한 시간은 추후 결정되며 온, 오프라인으로 안내드립니다.', style: TextStyle(fontSize: 14 , color: Color(0xffFF3C66),height: 1.4, fontWeight: FontWeight.w500),)
                        ],
                      )
                    ],
                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 22 ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    spacing: 18,
                    children: [
                      Row(
                        spacing: 6,
                        children: [
                          Text('운동 목적',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                          Text('(중복 선택 가능)',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray500,height: 1.4),),
                        ],
                      ),
                      GridView.builder(
                        itemCount:  controller.options.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16 * heightScale,
                          crossAxisSpacing: 16 * widthScale,
                          childAspectRatio: 5, // 가로 세로 비율 조정
                        ),
                        itemBuilder: (context, index) {
                          String option = controller.options[index];
                          return Obx(() =>  GestureDetector(
                            onTap: () {
                              controller.selectedMap[option] = !controller.selectedMap[option]!;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              // Row를 최소 너비만 차지하게 하기 위해 MainAxisSize.min
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    // 선택된 상태면 파란 체크박스, 아니면 회색 빈 박스
                                    controller.selectedMap[option]!
                                        ? Icons.check_box
                                        : Icons.check_box,
                                    color: controller.selectedMap[option]! ? mainColor : gray100,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    option,
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1.4,
                                      color: gray900
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 26 * heightScale, horizontal: 20 * widthScale),
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
                            controller.requiredCheck(2, '노쇼 시, 차감된 OT 횟수는 복구되지 않습니다.', 16 * widthScale),
                            controller.requiredCheck(3, '신청 지점에서 트레이너 배정 이후에 연락 드립니다.', 16 * widthScale),
                          ],
                        )
                      ],
                    )
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 14,
                    children: [
                      Text('질병 및 기타 사항',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                      Container(
                        width: size.width,
                        child: TextField(
                          controller: controller.diseaseController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: '질병 등 기타 사항이 있다면 작성해주세요.',
                            hintStyle: TextStyle(fontSize: 16, color: gray500),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: gray100, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: mainColor, width: 1),
                            ),
                        ),
                      )
                      )
                    ],
                  ),
                )
              ],
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
                final maxScroll = controller.scrollController.position.maxScrollExtent;

                controller.scrollController.animateTo(
                  maxScroll,
                  duration: const Duration(milliseconds: 500), // 원하는 애니메이션 시간
                  curve: Curves.fastOutSlowIn,                        // 원하는 애니메이션 커브
                );
                if(controller.selectedTR.value == 9999 && !controller.recommendation.value){
                  if(!Get.isSnackbarOpen){
                    Get.snackbar('신청 실패', '트레이너를 선택해주세요.',backgroundColor: Colors.white,colorText:Colors.red,borderRadius:16,borderColor: gray700,borderWidth: 1);
                  }
                  return;
                }
                if(myInfo.otCount <= 0){
                  if(!Get.isSnackbarOpen){
                    Get.snackbar('신청 실패', 'OT 수업 신청 가능 횟수를 초과했습니다.',backgroundColor: Colors.white,colorText:Colors.red,borderRadius:16,borderColor: gray700,borderWidth: 1);
                  }
                  return;
                }
                if(controller.selectedMap.values.every((v) => v == false)){
                  if(!Get.isSnackbarOpen){
                    Get.snackbar('신청 실패', '운동 목적을 선택해주세요',backgroundColor: Colors.white,colorText:Colors.red,borderRadius:16,borderColor: gray700,borderWidth: 1);
                  }
                  return;
                }
                if(controller.isRequiredCheck.contains(false.obs)){
                  if(!Get.isSnackbarOpen){
                    Get.snackbar('신청 실패', '모든 유의사항에 동의해주세요.',backgroundColor: Colors.white,colorText:Colors.red,borderRadius:16,borderColor: gray700,borderWidth: 1);
                  }
                  return;
                }
                return;
                // saving(context);
                // if(await SendEmail().sendEmail(controller.selectedSpot.value, controller.selectedIndex, controller.selectedTime)){
                //   Get.back();
                //   if(!Get.isSnackbarOpen) {
                //     controller.userDataRepository.updateOtCount(myInfo.otCount - 1);
                //     Get.offAllNamed(Routes.OT_SUCCESS);
                //     Get.snackbar(
                //         '신청 완료', '신청이 완료되었습니다.', backgroundColor: Colors.white,
                //         colorText: Colors.black,
                //         borderRadius: 16,
                //         borderColor: gray700,
                //         borderWidth: 1);
                //   }
                // }
                // else{
                //   Get.back();
                //   if(!Get.isSnackbarOpen) {
                //     Get.snackbar(
                //         '신청 실패', '인포에 문의해주세요.', backgroundColor: Colors.white,
                //         colorText: Colors.red,
                //         borderRadius: 16,
                //         borderColor: gray700,
                //         borderWidth: 1);
                //   }
                //   return;
                // }
              },
              child: Text('신청하기', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)),
        ),
      ),
    );
  }
}
