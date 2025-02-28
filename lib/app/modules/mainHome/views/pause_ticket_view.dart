import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:white_gym/app/modules/mainHome/controllers/pause_ticket_controller.dart';
import 'package:white_gym/component/main_box.dart';
import 'package:white_gym/global.dart';

import '../../../../component/customCheckBox.dart';

class PauseTicketView extends GetView<PauseTicketController> {
  const PauseTicketView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Image(
          image: const AssetImage('image/logo_text.png'),
          width: 175,
        ),
        centerTitle: true,
        leading:IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios_new,color: gray700,)),
      ),
      body: GetBuilder<PauseTicketController>(
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40,),
                      Text('나의 이용권',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                      SizedBox(height: 40,),
                      Container(
                        padding: EdgeInsets.all(20),
                        width: size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: myInfo.ticket.status || myInfo.ticket.subscribe?mainColor:gray500,width: 2),
                          borderRadius: BorderRadius.circular(16),
                          color: myInfo.ticket.status || myInfo.ticket.subscribe?Colors.white:Color(0xffF2F2F2)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.subscribe.value ?
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(controller.ticket.spotItem.name,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22)),
                                SizedBox(height: 4,),
                                Text('${controller.ticket.paymentBranch}만 이용',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: text7D),),
                              ],
                            )
                                :Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(controller.ticket.spotItem.name,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22)),
                                    SizedBox(height: 4,),
                                    Text(controller.ticket.passTicket? '전지점 이용가능':'${myInfo.ticket.paymentBranch}점만 이용',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: text7D),),
                                  ],
                                ),
                                myInfo.ticket.status || myInfo.ticket.subscribe?Text('${controller.endDate.value}일',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: mainColor),):
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('${controller.ticket.pauseStartDate.last.year}년${controller.ticket.pauseStartDate.last.month}월${controller.ticket.pauseStartDate.last.day}일',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22)),
                                    SizedBox(height: 4,),
                                    Text('일시정지 시작',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: text7D),),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16,),
                            controller.ticket.spotItem.descriptions1 != ''?SizedBox(
                              height: 34,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.circle,color: text7D,size: 4,),
                                  SizedBox(width: 8,),
                                  Text(controller.ticket.spotItem.descriptions1,style: TextStyle(fontSize: 16,color: text7D),)
                                ],
                              ),
                            ):Container(),
                            controller.ticket.spotItem.descriptions2 != ''?SizedBox(
                              height: 34,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.circle,color: text7D,size: 4,),
                                  SizedBox(width: 8,),
                                  Text(controller.ticket.spotItem.descriptions2,style: TextStyle(fontSize: 16,color: text7D),)
                                ],
                              ),
                            ):Container(),
                            SizedBox(height: 20,),
                            Obx(()=>
                              SizedBox(
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
                                        color: text22,
                                        fontWeight: FontWeight.w600,
                                            fontSize: 16
                                        ),
                                        ),
                                      ],
                                    ),
                                    Text(controller.check1.value?formatNumber(controller.ticket.spotItem.locker):formatNumber(0), style: TextStyle(
                                        color: text22,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                            Obx(()=>
                                SizedBox(
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
                                            color: text22,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16
                                        ),)
                                      ],
                                    ),
                                   Text(controller.check2.value?formatNumber(controller.ticket.spotItem.sportswear):formatNumber(0), style: TextStyle(
                                       color: text22,
                                       fontWeight: FontWeight.w600,
                                       fontSize: 16
                                   ),)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 26,),
                           Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                controller.subscribe.value?Container():Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                  decoration: BoxDecoration(
                                    color: gray500,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child:Text('일시정지 가능 횟수 : ${controller.ticket.pause}회',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    controller.ticket.spotItem.discountCheck? Text(formatNumber(controller.ticket.spotItem.beforeDiscount),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffA5ADBE),decoration: TextDecoration.lineThrough,),):Container(),
                                    Text(formatNumber(controller.ticket.spotItem.price),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: mainColor),),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Obx(()=> Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: (){
                          if(controller.ticket.pause == 0 && controller.ticket.status && !controller.subscribe.value){
                            Get.snackbar('일시정지 불가','일시정지 가능 횟수를 초과하였습니다.',backgroundColor: Colors.white,colorText: Colors.red);
                            return;
                          }
                          if(!controller.cancelCheck.value) {
                            if (controller.subscribe.value) {
                              controller.cancel();
                            } else {
                              controller.pause();
                            }
                          } else {
                            if(controller.subscribe.value){
                              if(controller.ticket.status){
                                controller.cancel();
                              }
                            } else {
                              controller.play();
                            }
                          }
                        },
                          child: controller.subscribe.value?MainBox(text:'이용권 구독 해지', color:controller.ticket.status?mainColor:gray500, textColor: Colors.white):
                          MainBox(text: myInfo.ticket.status ? '이용권 일시 정지':'이용권 일시 정지 해제', color:mainColor, textColor: Colors.white)
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }
}
