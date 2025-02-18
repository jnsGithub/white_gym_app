import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../component/customCheckBox.dart';
import '../../../../component/main_box.dart';
import '../../../../global.dart';
import '../../../routes/app_pages.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
        centerTitle: true,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body:SafeArea(
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Text('원하는 ',style: TextStyle(fontSize:24,fontWeight: FontWeight.w600,color: text22),),
                          Text('멤버쉽',style: TextStyle(fontSize:24,fontWeight: FontWeight.w600,color: mainColor),),
                          Text('을',style: TextStyle(fontSize:24,fontWeight: FontWeight.w600,color: text22),),
                        ],
                      ),
                      SizedBox(height: 3,),
                      Text('선택해주세요',style: TextStyle(fontSize:24,fontWeight: FontWeight.w600,color: text22),),
                      SizedBox(height: 16,),
                      SizedBox(
                        width: size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.spotItemList.length,
                            physics:NeverScrollableScrollPhysics(),
                            itemBuilder: (context , index ){
                              return Obx(()=>
                                  GestureDetector(
                                      onTap: (){
                                        if(controller.ticketIndex.value != index){
                                          controller.checkTicket(index);
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 8),
                                        padding: EdgeInsets.all(20),
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            border:controller.ticketIndex.value == index ?  Border.all(color: mainColor):Border.all(color: Color(0xffE2E8F0)),
                                            borderRadius: BorderRadius.circular(16),
                                            color: Colors.white
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(controller.spotItemList[index].name,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22)),
                                                    SizedBox(height: 4,),
                                                    Text(controller.spotItemList[index].passTicket? '화이트짐 모든 지점 이용':'${controller.spot.name}만 이용',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: text7D),),
                                                  ],
                                                ),
                                                controller.spotItemList[index].discountCheck? Container(
                                                    width: 63,
                                                    height: 28,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius: BorderRadius.circular(8)
                                                    ),
                                                    child: Text('EVENT',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),)
                                                ):Container()
                                              ],
                                            ),
                                            SizedBox(height: 16,),
                                            Obx(()=>controller.ticketIndex.value == index?
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 34,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Icon(Icons.circle,color: text7D,size: 4,),
                                                      SizedBox(width: 8,),
                                                      Text(controller.spotItemList[index].descriptions1,style: TextStyle(fontSize: 16,color: text7D),)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 34,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Icon(Icons.circle,color: text7D,size: 4,),
                                                      SizedBox(width: 8,),
                                                      Text(controller.spotItemList[index].descriptions2,style: TextStyle(fontSize: 16,color: text7D),)
                                                    ],
                                                  ),
                                                ),

                                                GestureDetector(
                                                  onTap: (){
                                                    controller.check1.value = !controller.check1.value;
                                                  },
                                                  child: SizedBox(
                                                    height: 42,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            CustomCheckbox(
                                                              allCheck: true,
                                                              isChecked: controller.check1.value,
                                                              borderColor: controller.check1.value ? Colors.blue : Colors.grey,
                                                              fillColor: Colors.blue,
                                                              size: 24,
                                                            ),
                                                            const SizedBox(width: 8),
                                                            Text(
                                                              "개인 락커", style: TextStyle(
                                                              color: controller.check1.value ? text22 : Colors.grey,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16,
                                                            ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            controller.spotItemList[index].isSubscribe && controller.spotItemList[index].locker != 0?
                                                            Text('월 ', style: TextStyle(
                                                            color: controller.check1.value ? text22 : Colors.grey,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16
                                                        ),)
                                                                :Container(),
                                                            Text(formatNumber(controller.spotItemList[index].locker), style: TextStyle(
                                                                color: controller.check1.value ? text22 : Colors.grey,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 16
                                                            ),),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    controller.check2.value = !controller.check2.value;
                                                  },
                                                  child: SizedBox(
                                                    height: 42,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            CustomCheckbox(
                                                              allCheck: true,
                                                              isChecked: controller.check2.value,
                                                              borderColor: controller.check2.value ? Colors.blue : Colors.grey,
                                                              fillColor: Colors.blue,
                                                              size: 24,
                                                            ),
                                                            const SizedBox(width: 8),
                                                            Text(
                                                              "회원복", style: TextStyle(
                                                                color: controller.check2.value ? text22 : Colors.grey,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 16
                                                            ),)
                                                          ],
                                                        ),

                                                        Row(
                                                          children: [
                                                            controller.spotItemList[index].isSubscribe && controller.spotItemList[index].sportswear != 0?
                                                            Text('월 ', style: TextStyle(
                                                                color: controller.check2.value ? text22 : Colors.grey,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 16
                                                            ),)
                                                                :Container(),
                                                            Text(formatNumber(controller.spotItemList[index].sportswear), style: TextStyle(
                                                                color: controller.check2.value ? text22 : Colors.grey,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 16
                                                            ),),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ):Container(),
                                            ),
                                            SizedBox(height: 26,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                controller.ticketIndex.value == index? Icon(Icons.check,color: mainColor,):Container(),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    controller.spotItemList[index].discountCheck?Text(formatNumber(controller.spotItemList[index].beforeDiscount),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffA5ADBE),decoration: TextDecoration.lineThrough,),):Container(),
                                                    Row(
                                                      children: [
                                                        controller.spotItemList[index].isSubscribe?Text('월 ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22),):Container(),
                                                        Text(formatNumber(controller.spotItemList[index].price),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: mainColor),),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                              );
                            }
                        ),
                      )
                    ]
                )
            )
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Obx(()=>controller.ready.value && myInfo.ticket.endDate.isBefore(DateTime.now())?
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: (){
              if(loginState){
                Get.toNamed('/payment-detail',arguments: {'locker':controller.check1.value,'sportswear':controller.check2.value,'item':1,'spotItem':controller.spotItemList[controller.ticketIndex.value],'spot':controller.spot});
              } else {
                Get.snackbar('알림', '회원가입 이후 사용 가능합니다.',backgroundColor: Colors.white,colorText: text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
                Get.toNamed(Routes.SIGN_UP);
              }

            },
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              child: MainBox(text: '결제하기', color: mainColor, textColor: Colors.white),
            ),
          ),
        ):Container(
          width: size.width,height: 1,
        ),
        ),
      ),
    );
  }
}
