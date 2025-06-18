import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../component/main_box.dart';
import '../../../../global.dart';
import '../../../model/billingInfo.dart';
import '../controllers/upgrade_membership_controller.dart';

class UpgradeMembershipView extends GetView<UpgradeMembershipController> {
  const UpgradeMembershipView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
        centerTitle: true,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new,color: gray700,)),
      ),
      body: Obx(()=>
        controller.goPayment.value?
            SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('남은 기간만큼',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                        Text('차액 결제하기',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text('멤버십 금액의 차액(1일) X 남은 일수 = ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,height: 1.5,color: gray500),),
                            Text('결제금액',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,height: 1.5,color: gray900),),
                          ],
                        ),
                        SizedBox(height: 24,),
                        Container(
                            alignment: Alignment.center,
                            width: size.width,
                            height: size.width*0.4267,
                            decoration: BoxDecoration(
                              color: blue700,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('지금 결제할 금액',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white,height: 1.4),),
                                SizedBox(width: 16,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() => Text('${controller.totalPrice.value}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xffC8FF00)),)),
                                    Text(' 원',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xffC8FF00)),),
                                  ],
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 24,),
                      ],
                    ),
                  ),
                  Container(
                      width: size.width,
                      height: 11,
                      decoration: BoxDecoration(
                        color: gray50,
                        border: Border(top: BorderSide(color: gray100, width: 1)
                        ),
                      )
                  ),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              Text('결제 방법',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22),),
                              SizedBox(height: 24,),
                              GestureDetector(
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
                              SizedBox(height: 24),
                            ],
                          ),
                        ),
                        Obx(()=>
                        controller.isAppCard.value ?
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: CarouselSlider(
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
                                      controller.bootpay('자동결제 카드등록');
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
                        ) : Container(),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        )
                      ],
                    ),
                  ),

                ],
              )
            )
            :
        Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('차액만 결제하고',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
              Row(
                children: [
                  Text('모든지점을',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),),
                  Text('을 이용해요',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                ],
              ),
              SizedBox(height: 20,),
              Text('아래 남은 일수 동안\n화이트짐 모든 지점 이용이 가능해요',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,height: 1.5,color: gray500),),
              SizedBox(height: 75,),
              Container(
                alignment: Alignment.center,
                width: size.width,
                height: size.width*0.4267,
                decoration: BoxDecoration(
                  color: blue700,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('이용권 남은 일수 ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white,height: 1.4),),
                    SizedBox(width: 10,),
                    Obx(() => Text('${controller.endDate.value}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xffC8FF00)),)),
                    Text(' 일',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xffC8FF00)),),
                  ],
                )
              ),
              SizedBox(height: 16,),
              Container(
                width: size.width,
                alignment: Alignment.center,
                child: Text('현재 이용권은 ${formatExpiryDate(controller.endDate2)} 종료 돼요.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray500),),
              ),
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
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: GestureDetector(
            onTap: (){
              if(controller.goPayment.value){
                if(controller.isBottom.value){
                  if(controller.isAppCard.value){
                    if(controller.billingInfo[controller.sliderIndex.value].documentId != '') {
                      controller.billingKeyPay();
                      // Get.offAllNamed(Routes.PAYMENT_SUCCESS, arguments: controller.spotItem.passTicket ? '' : controller.spotItem.spotDocumentId);
                    }
                  } else {
                    controller.bootpayAppCard();
                  }
                } else {
                  controller.scrollJump();
                }
              } else {
                controller.goPayment.value = true;
              }
            },
              child: MainBox(text: '결제하고 변경하기', color: mainColor, textColor: Colors.white,)),
        ),
      ),
    );
  }
}
