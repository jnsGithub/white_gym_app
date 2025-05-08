import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:white_gym/app/model/billingInfo.dart';
import 'package:white_gym/app/modules/payment/controllers/payment_detail_controller.dart';
import 'package:white_gym/component/main_box.dart';

import '../../../../global.dart';

class PaymentDetailView extends GetView<PaymentDetailController> {
  const PaymentDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
          centerTitle: true,
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body:SafeArea(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24,),
                  Text('멤버쉽 결제',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                  Container(
                    margin: EdgeInsets.only(top: 21),
                    width: size.width,
                    height: 1,
                    color: text22,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 46,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.spotItem.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: mainColor),),
                        Row(
                          children: [
                            controller.spotItem.isSubscribe?Text('월 ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: text22),):Container(),
                            Text(formatNumber(controller.spotItem.price),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: text22),),
                          ],
                        )
                      ],
                    ),
                  ),
                  controller.lockerCheck.value?SizedBox(
                    width: size.width,
                    height: 46,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('개인 락커',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: text7D),),
                        Row(
                          children: [
                            controller.spotItem.isSubscribe?Text('월 ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: text22),):Container(),
                            Text(formatNumber(controller.lockerPrice.value),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: text22),),
                          ],
                        )
                      ],
                    ),
                  ):SizedBox(
                    width: size.width,
                    height: 46,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('개인 락커',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: text7D),),
                        Row(
                          children: [
                            controller.spotItem.isSubscribe?Text('월 ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: text7D),):Container(),
                            Text(formatNumber(0),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: text7D),),
                          ],
                        )
                      ],
                    ),
                  ),
                  controller.sportswearCheck.value ? SizedBox(
                    width: size.width,
                    height: 46,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('회원복',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: text7D),),
                        Row(
                          children: [
                            controller.spotItem.isSubscribe?Text('월 ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: text22),):Container(),
                            Text(formatNumber(controller.sportswearPrice.value),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: text22),),
                          ],
                        )
                      ],
                    ),
                  ): SizedBox(
                    width: size.width,
                    height: 46,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('회원복',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: text7D),),
                        Row(
                          children: [
                            controller.spotItem.isSubscribe?Text('월 ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: text7D),):Container(),
                            Text(formatNumber(0),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: text7D),),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 46,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('결제지점',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: text7D),),
                        Text(controller.spot.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: mainColor),)
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 1,
                    color: text7D,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 55,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('총 결제 금액',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: text22),),
                        Row(
                          children: [
                            controller.spotItem.isSubscribe?Text('월 ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22),):Container(),
                            Text(formatNumber(controller.totalPrice.value),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: mainColor),),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 28,),
                  Column(
                    children: [
                      Text('결제 방법',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22),),
                      SizedBox(height: 24,),
                    ],
                  ),
                  !controller.spotItem.isSubscribe ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
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
                        SizedBox(height: 25,),
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
                        )
                      ],
                    ) : SizedBox(),
                  SizedBox(height: controller.spotItem.isSubscribe ? 0 : 24,),
                  Obx(()=>
                  controller.isAppCard.value ?
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
                    ) : Container(),
                  ),

                  controller.spotItem.isSubscribe?Column(
                    children: [
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('매월 자동으로 결제가 이루어집니다',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: text7D),),
                          Text('다음 결제일 ${DateFormat('yyyy.MM.dd', 'ko_KR').format(controller.now.add(Duration(days: 29)))}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: text7D),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text('구독 정지 시 다음 결제일 전까지 이용이 가능하며, 더이상 결제되지 않고 멤버쉽이 만료됩니다. 자세한 규정은 아래에서 확인할 수 있으며, 화이트짐 앱 내 마이페이지에서 확인하실 수 있습니다.',style: TextStyle(color: text7D,fontSize: 13,fontWeight: FontWeight.w400),),
                    ],
                  ):Container(),
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
        ),
      bottomNavigationBar:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: controller.spotItem.isSubscribe ?
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Obx(()=>controller.loading.value?
            GestureDetector(
                onTap: (){
                  if(controller.isBottom.value){
                    if(controller.billingInfo[controller.sliderIndex.value].documentId != '') {
                      controller.billingKeyPay();
                    }
                  } else {
                    controller.scrollJump();
                  }
                },
                child: MainBox(
                    text: '결제하기',
                    color: controller.billingInfo[controller.sliderIndex.value].documentId != ''?mainColor:Color(0xffEEF1F7),
                    textColor: controller.billingInfo[controller.sliderIndex.value].documentId != ''?Colors.white:Color(0xffA5ADBE)
                )
            ):Container()
            ),
          ):Container(
            margin: EdgeInsets.only(bottom: 20),
            child:
            GestureDetector(
                onTap: (){
                    controller.bootpayAppCard();
                },
                child: MainBox(
                    text: '결제하기',
                    color: mainColor,
                    textColor:Colors.white
                )
            ),
          ),
        ),
      )
    );
  }
}
