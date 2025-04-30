import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:white_gym/app/model/userData.dart';

import '../../../../global.dart';
import '../../../model/ticket.dart';

class PauseTicketController extends GetxController {
  RxBool check1 = myInfo.ticket.locker.obs;
  RxBool check2 = myInfo.ticket.sportswear.obs;
  RxBool subscribe = myInfo.ticket.subscribe.obs;
  RxBool cancelCheck = false.obs;
  Ticket ticket = myInfo.ticket;
  RxInt endDate = 0.obs;
  UserDataRepository userDataRepository = UserDataRepository();
  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  init() async {
    DateTime now = DateTime.now();
    cancelCheck.value = ticket.pause == 0 || !ticket.status;
    if(!ticket.status){
    } else {
      DateTime now2 = DateTime(now.year, now.month, now.day);
      Duration diff = ticket.endDate.difference(now2);
      endDate.value = diff.inDays + 1;
    }
    update();
  }
  check(index){
    if(index == 1){
      check1.value = !check1.value;
    } else {
      check2.value = !check2.value;
    }
  }
  cancel(){
    Size size = MediaQuery.of(Get.context!).size;
    Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          actionsPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.only(top: 8, bottom: 20),
          title: const Text(
            '사용중인 이용권을\n구독 해지 하시겠습니까?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,height: 1.5,color: text22),
          ),
          actions: [
            Container(
              width: size.width,
              height: 48.1,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffe0e0e0),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffe0e0e0),
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Text(
                          '취소',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff303030),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        cancel2();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
  cancel2(){
    Size size = MediaQuery.of(Get.context!).size;
    Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          actionsPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.only(top: 8, bottom: 20),
          title: const Text(
            '구독 해지 시 다음 결제일 전까지\n이용이 가능하며,\n더 이상 결제되지 않고 멤버쉽이 만료됩니다.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,height: 1.5,color: text22),
          ),
          actions: [
            Container(
              width: size.width,
              height: 48.1,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffe0e0e0),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffe0e0e0),
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Text(
                          '취소',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff303030),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Ticket beforeTicket = ticket.copyWith(
                          status: ticket.status
                        );
                        Get.back();
                        cancelCheck.value = true;
                        print('구독 해지');
                        print(myInfo.ticket.status);
                        ticket.status = false;
                        print(myInfo.ticket.status);
                        userDataRepository.updateTicket(beforeTicket: beforeTicket, ticket);
                        myInfo.ticket = ticket;
                        update();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
  play(){
    Size size = MediaQuery.of(Get.context!).size;
    Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          actionsPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.only(top: 8, bottom: 20),
          title: const Text(
            '일시정지를 해제하시겠습니까?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,height: 1.5,color: text22),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '( 일시정지 중도 해제 시 ,\n남은 일시정지 일 수 는 반환되지 않습니다.)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffFF3C3C),fontSize: 13,fontWeight: FontWeight.w500),
              ),
            ],
          ),
          actions: [
            Container(
              width: size.width,
              height: 48.1,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffe0e0e0),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffe0e0e0),
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Text(
                          '취소',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff303030),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        Get.back();
                        saving(Get.context!);
                        Ticket beforeTicket = ticket.copyWith(
                          pauseStartDate: List.from(ticket.pauseStartDate),
                          pauseEndDate: List.from(ticket.pauseEndDate),
                          status: ticket.status,
                        );
                        DateTime now = DateTime.now();
                        DateTime now2 = DateTime(ticket.pauseStartDate.last.year, ticket.pauseStartDate.last.month, ticket.pauseStartDate.last.day);
                        Duration diff =  ticket.endDate.difference(now2);
                        DateTime now3 = DateTime(now.year, now.month, now.day + diff.inDays);
                        ticket.pauseEndDate.last = now;
                        ticket.endDate = now3;
                        ticket.status = true ;
                        await userDataRepository.updateTicket(beforeTicket: beforeTicket, ticket);
                        myInfo.ticket = ticket;
                        init();
                        Get.back();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
  pause(){
    Size size = MediaQuery.of(Get.context!).size;
    Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          actionsPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.only(top: 8, bottom: 20),
          title: const Text(
            '사용중인 이용권을\n일시정지 하시겠습니까?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,height: 1.5,color: text22),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '( 일시정지 1회 = 30일이며, 31일부터 자동 사용됩니다 )',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffFF3C3C),fontSize: 13,fontWeight: FontWeight.w500),
              ),
            ],
          ),
          actions: [
            Container(
              width: size.width,
              height: 48.1,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffe0e0e0),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffe0e0e0),
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Text(
                          '취소',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff303030),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        Get.back();
                        saving(Get.context!);
                        Ticket beforeTicket = ticket.copyWith(
                          pauseStartDate: List.from(ticket.pauseStartDate),
                          pauseEndDate: List.from(ticket.pauseEndDate),
                          pause: ticket.pause,
                          status: ticket.status,
                        );
                        ticket.pause--;
                        print(ticket.pause);
                        DateTime now = DateTime.now();
                        ticket.pauseStartDate.add(DateTime.now());//(DateTime(now.year, now.month, now.day));
                        ticket.pauseEndDate.add(DateTime(now.year, now.month, now.day + 29));
                        print(beforeTicket.pauseStartDate);
                        print(beforeTicket.pauseEndDate);
                        print(ticket.pauseStartDate);
                        print(ticket.pauseEndDate);
                        ticket.status = false ;
                        cancelCheck.value = ticket.pause <= 0;
                        await userDataRepository.updateTicket(beforeTicket: beforeTicket, ticket);
                        myInfo.ticket = ticket;
                        init();
                        Get.back();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
