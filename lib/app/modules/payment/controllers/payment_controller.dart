import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:white_gym/component/main_box.dart';

import '../../../../global.dart';
import '../../../model/spot.dart';
import '../../../model/spotItem.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController
  RxBool check1 = false.obs; // 락커
  RxBool check1_2 = false.obs; // 락커2
  RxBool check2 = false.obs; // 회원복
  RxBool check2_2 = false.obs; // 회원복2
  RxBool ready = false.obs;
  RxBool isExtend = false.obs;
  RxBool isAddLocker = false.obs;
  RxBool isAddSportswear = false.obs;
  RxBool isAddLocker2 = false.obs;
  RxBool isAddSportswear2 = false.obs;
  RxInt ticketIndex = 99999.obs;
  RxList<SpotItem> spotItemList = Get.arguments['spotItemList'];
  Spot spot = Get.arguments['spot'];
  @override
  void onInit() {
    super.onInit();
    isExtend.value = Get.arguments['extend'] ?? false;
    if(isExtend.value){
      DateTime lockerEndDate = DateTime(myInfo.ticket.lockerEndDate.year, myInfo.ticket.lockerEndDate.month, myInfo.ticket.lockerEndDate.day);
      DateTime sportswearEndDate = DateTime(myInfo.ticket.sportswearEndDate.year, myInfo.ticket.sportswearEndDate.month, myInfo.ticket.sportswearEndDate.day);
      DateTime endDate = DateTime(myInfo.ticket.endDate.year, myInfo.ticket.endDate.month, myInfo.ticket.endDate.day);
      check1_2.value = lockerEndDate.isAtSameMomentAs(endDate);
      check2_2.value = sportswearEndDate.isAtSameMomentAs(endDate);
    } else {
      check1_2.value = true;
      check2_2.value = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  checkTicket(index) {
    ticketIndex.value = index;
    ready.value = true;
    check1.value = false;
    check2.value = false;
  }
  showDialog(size){
    int endDate;
    DateTime now = DateTime.now();
    DateTime now2 = DateTime(now.year, now.month, now.day);

    Duration diff;
    if(!myInfo.ticket.status){
      DateTime now3 =DateTime(myInfo.ticket.pauseStartDate.last.year, myInfo.ticket.pauseStartDate.last.month, myInfo.ticket.pauseStartDate.last.day);
      diff = myInfo.ticket.endDate.difference(now3);
      endDate = diff.inDays + 1;
    } else {
      diff = myInfo.ticket.endDate.difference(now2);
      endDate = diff.inDays + 1;
    }
    isAddSportswear.value = false;
    isAddSportswear2.value = false;
    isAddLocker.value = false;
    isAddLocker2.value = false;
    DateTime endDateTime = now2.add(Duration(days:diff.inDays + spotItemList[ticketIndex.value].daily));

    Get.dialog(
        useSafeArea: false,
        AlertDialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          contentPadding: EdgeInsets.zero,
          scrollable: true,
          content:  Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AppBar(
                        title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
                        centerTitle: true,
                        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new,color: gray700,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('이용권 연장일',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),),
                                Text('은',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                              ],
                            ),
                            Text('다음과 같아요',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                            SizedBox(height: 38,),
                            Row(
                              spacing: 24,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text('남은 일수',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: gray900,height: 1.4),),
                                    Text('$endDate일',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),)
                                  ],
                                ),
                                Icon(Icons.add_circle),
                                Column(
                                  children: [
                                    Text('추가 이용 일수',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: gray900,height: 1.4),),
                                    Text('${spotItemList[ticketIndex.value].daily}일',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),)
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 38,
                            ),
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 26,horizontal: 30),
                                width: size.width,
                                height: size.width*0.4267,
                                decoration: BoxDecoration(
                                  color: blue700,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('총 남은 일수 ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white,height: 1.4),),
                                        Row(
                                          children: [
                                            Obx(() => Text('${endDate + spotItemList[ticketIndex.value].daily}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xffC8FF00)),)),
                                            Text(' 일',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xffC8FF00)),),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text('${formatExpiryDate(endDateTime)} 까지 이용 가능해요',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,height: 1.4,color: Colors.white),)
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed('/payment-detail',arguments: {'locker':check1.value,'sportswear':check2.value,'item':1,'spotItem':spotItemList[ticketIndex.value],'spot':spot, 'extendDays':diff.inDays + spotItemList[ticketIndex.value].daily});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MainBox(text: '다음', color: mainColor, textColor: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
