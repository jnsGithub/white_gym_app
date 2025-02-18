import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:white_gym/app/model/billingInfo.dart';
import 'package:white_gym/app/modules/myPage/controllers/card_list_controller.dart';

import '../../../../component/main_box.dart';
import '../../../../global.dart';

class CardListView extends GetView<CardListController> {
  const CardListView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
          centerTitle: true,
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new,color: gray700,)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.only(left: 16),
              child: Text('결제 카드 관리',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
            ),
            SizedBox(height: 47,),
            Obx(()=>
              controller.loading.value? Container():
              controller.billingInfo[controller.sliderIndex.value].documentId != ''?Container(
                width: size.width,
                height: 34,
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    controller.removeCard();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: size.width*0.1413),
                    width: 81,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffFFE5E6),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Text('카드 삭제',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xffFF3C3C)),),
                  ),
                ),
              ):Container(height: 34,),
            ),
            SizedBox(height: 26,),
            Obx(()=>
            controller.loading.value? Container():
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
                          controller.bootpay('카드등록');
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
                                        myInfo.paymentCard == billingInfo.documentId ?  Container(
                                            width: 21,
                                            height: 21,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: mainColor,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: Icon(Icons.check_outlined,color: Colors.white,size: 18,)
                                        ):Container(),
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
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,color: text7D,size: 4,),
                      SizedBox(width: 8,),
                      Text('구독권 구매 시, 해당 결제 카드로 매월 결제됩니다.',style: TextStyle(fontSize: 13,color: text7D),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,color: text7D,size: 4,),
                      SizedBox(width: 8,),
                      Text('결제 카드 변경 시, 아래 변경 버튼을 눌러주세요.',style: TextStyle(fontSize: 13,color: text7D),)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child:
        GestureDetector(
          onTap: (){
            controller.changePaymentCard();
          },
          child: Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
            child: MainBox(text: '변경', color: mainColor, textColor: Colors.white),
          ),
        ),
      ),
    );
  }
}
