import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:white_gym/app/modules/payment/controllers/pt_payment_controller.dart';
import 'package:white_gym/component/main_box.dart';

import '../../../../component/customCheckBox.dart';
import '../../../../global.dart';
import '../../../model/billingInfo.dart';

class PtPaymentView extends GetView<PtPaymentController> {
  const PtPaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus(); // 화면을 클릭하면 키보드 내리기
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('PT 신청하기',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: gray900,height: 1.4),),
          centerTitle: true,
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.width * 0.64,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.trainer.imageList[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.ptGroup['name'],style: TextStyle(fontSize:22,fontWeight: FontWeight.w600,height: 1.4,color: gray900)),
                    SizedBox(height: 4),
                    Text(controller.ptGroup['description'],style: TextStyle(fontSize:16,fontWeight: FontWeight.w400,height: 1.4,color: gray700)),
                    SizedBox(height: 28),
                    Text('이용권 정보',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                    SizedBox(height: 12,),
                    Container(
                      decoration: BoxDecoration(
                        color: blue700,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(20),
                      width: size.width,
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.ptItem.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white,height: 1.4),),
                          SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('PT 이용 지점',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: gray100,height: 1.4),),
                              Text(controller.spot.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white,height: 1.4),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('총 PT 횟수',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: gray100,height: 1.4),),
                              Text('${controller.ptItem.admission}회',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white,height: 1.4),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('세션 기간',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: gray100,height: 1.4),),
                              Text(controller.date,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white,height: 1.4),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('비용',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: gray100,height: 1.4),),
                              Text(formatNumber(controller.ptItem.price),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.green,height: 1.4),),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: 11,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: gray100, width: 1),),
                  color: gray50
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 26,horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('운동 목적',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: gray900,height: 1.4),),
                        Text('(중복 선택 가능)',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: gray500,height: 1.4),),
                      ],
                    ),
                    SizedBox(height: 21,),
                    Obx(()=>
                        SizedBox(
                          width: size.width,
                          child: Wrap(
                            spacing: size.width*0.1093,
                            runSpacing: 16,
                            children: controller.exercisePurpose.map((part) {
                              bool isSelected = controller.selectedParts.contains(part);
                              return GestureDetector(
                                onTap: () {
                                  if(isSelected){
                                    controller.selectedParts.remove(part);
                                  } else {
                                    controller.selectedParts.add(part);
                                  }
                                },
                                child: SizedBox(
                                  width: size.width*0.3387,
                                  child: Row(
                                    children: [
                                      CustomCheckbox(
                                        allCheck: true,
                                        isChecked: isSelected,
                                        borderColor: isSelected ? Colors.blue : Colors.grey,
                                        fillColor: Colors.blue,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        part, style: TextStyle(
                                          color: gray900,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ),
                    SizedBox(height: 40,),
                    Text('질병 및 기타 사항',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,height: 1.4,color: gray900),),
                    SizedBox(height: 14,),
                    TextField(
                      controller: controller.comment,
                      style: TextStyle(fontSize: 16, color: gray900, height: 1.4),
                      decoration: InputDecoration(
                        hintText: '질병 및 기타 사항을 입력해주세요.',
                        hintStyle: TextStyle(fontSize: 16, color: gray500, height: 1.4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: gray100, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: blue700, width: 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: 11,
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: gray100, width: 1),),
                    color: gray50
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 20),
                child: Container(
                  width: size.width,
                  alignment: Alignment.centerLeft,
                    child: Text('결제 방법',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22))
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: GestureDetector(
                      onTap: (){
                        controller.isAppCard.value = true;
                      },
                      child: Obx(() => Row(
                        spacing: 6,
                        children: [
                          Transform.scale(
                            scale: 1.25,
                            child: Radio(
                              value: true,
                              splashRadius: -2,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // ← 터치영역 축소
                              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                if (!controller.isAppCard.value) {
                                  return gray100; // ✅ 비활성화 시 색상
                                }
                                return mainColor; // ✅ 기본 색상
                              }),

                              // fillColor: WidgetStateProperty.all(gray100),
                              groupValue: controller.isAppCard.value,
                              onChanged: (_){
                                controller.isAppCard.value = true;
                              },
                            ),
                          ),
                          Text('앱 카드 간편결제',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: text22),),
                        ],
                      ),
                      ),
                    ),
                  ),
                  Obx(()=>
                  !controller.loading.value?Container():controller.isAppCard.value ?
                  Column(
                    children: [
                      SizedBox(height: 10,),
                      CarouselSlider(
                        carouselController: controller.carouselController,
                        options: CarouselOptions(
                          viewportFraction: 0.7173,
                          autoPlay: false,
                          // aspectRatio: 3.0,
                          height: size.width*0.4133,
                          enlargeCenterPage: true,
                          enableInfiniteScroll:false,
                          onPageChanged: (index, reason) {
                            controller.changeSlider(index);
                          },
                        ),
                        items: controller.billingInfo.asMap().entries.map((entry) {
                          final index = entry.key;     // 인덱스
                          BillingInfo billingInfo = entry.value;    // 실제 값
                          return Builder(
                            builder: (BuildContext context) {
                              return billingInfo.billingKey == '' ?
                              GestureDetector(
                                onTap: (){
                                  controller.bootpay();
                                },
                                child: Container(
                                  width: size.width,
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: size.width*0.7173,
                                    height: size.width*0.4133,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffF9F9FB),
                                      border: Border.all(color: Color(0xffE2E8F0)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_circle_outline,size: 20,color: Color(0xffA5ADBE),),
                                        SizedBox(height: 24,),
                                        Text('결제하실 카드를 등록해 주세요',style: TextStyle(color: Color(0xffA5ADBE),fontSize: 14,fontWeight: FontWeight.w500),)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                                  :
                              Obx(()=>
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: mainColor),
                                          color: Color(0xffD2E7FF)
                                      ),
                                      child: index == controller.sliderIndex.value ? Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                    width: 21,
                                                    height: 21,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius: BorderRadius.circular(8)
                                                    ),
                                                    child: Icon(Icons.check_outlined,color: Colors.white,size: 18,)
                                                ),
                                                SizedBox(width: 8,),
                                                Text(billingInfo.cardCompany,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22),)
                                              ],
                                            ),
                                          ),
                                          Container(
                                              width: size.width,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.symmetric(vertical: 24),
                                              child: Text('xxxx-xxxx-xxxx-${getDigitsAfterAsterisk(billingInfo.cardNo)}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: gray700,letterSpacing: 2.6),)
                                          )
                                        ],
                                      ):Container()
                                  ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ) : Container(),
                  ),
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: GestureDetector(
                      onTap: (){
                        controller.isAppCard.value = false;
                      },
                      child: Obx(() => Row(
                        spacing: 6,
                        children: [
                          Transform.scale(
                            scale: 1.25,
                            child: Radio(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // ← 터치영역 축소
                              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                              value: false,
                              splashRadius: -2,
                              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                if (controller.isAppCard.value) {
                                  return gray100; // ✅ 비활성화 시 색상
                                }
                                return mainColor; // ✅ 기본 색상
                              }),
                              groupValue: controller.isAppCard.value,
                              onChanged: (_){
                                controller.isAppCard.value = false;
                              },
                            ),
                          ),
                          Text('일반 카드결제',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: text22),),
                        ],
                      ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){
                        launchUrl('https://voltaic-feels-279.notion.site/18f22ae39984807d967ecfc64eb26fda?pvs=4');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('개인정보 제3자 제공 동의 ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff313740)),),
                              Text('보기',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: gray400),),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,size: 17,color: gray500,),
                        ],
                      ),
                    ),
                    SizedBox(height: 19,),
                    GestureDetector(
                      onTap: (){
                        launchUrl('https://voltaic-feels-279.notion.site/18222ae3998480afadd7e211f20d4448?pvs=4');

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('결제 대행 서비스 이용약관 ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff313740)),),
                              Text('보기',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: gray400),),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,size: 17,color: gray500,),
                        ],
                      ),
                    ),
                    SizedBox(height: 23,),
                    Text('위 상품의 구매 조건을 확인하였으며, 결제에 동의합니다.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff313740)),),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: 11,
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: gray100, width: 1),),
                    color: gray50
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 22 ,
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
                          controller.requiredCheck(0, 'PT 수업시간은 회당 50분 입니다.', 16 ),
                          controller.requiredCheck(1, 'PT 예약 취소는 수업 시간으로부터 24시간 이전까지만 가능합니다.', 16 ),
                          controller.requiredCheck(2, '수업 노쇼로 인해 횟수 차감된 것은 복구되지않습니다.', 16 ),
                          controller.requiredCheck(3, '신청 지점에서 트레이너 배정 이후에 연락드립니다.', 16 ),
                        ],
                      )
                    ],
                  ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
                child: GestureDetector(
                  onTap: (){
                    if(!controller.isRequiredCheck.every((element) => element.value)){
                      Get.snackbar('알림', '유희사항을 확인해주세요.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
                      return;
                    }
                    if(controller.isAppCard.value){
                      // controller.billingKeyPay();
                    } else {
                      controller.bootpayAppCard();
                    }
                  },
                    child: MainBox(text: 'PT 결제하기', color: mainColor, textColor: Colors.white)),
              )
            ],
          ),
        )
      ),
    );
  }
}
