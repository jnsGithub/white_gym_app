import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:white_gym/app/model/ptTicket.dart';

import '../../../../global.dart';

class PtController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement PtController
  TabController? tabController;
  RxString profileImage = ''.obs;
  RxInt selectedPageNumber = 0.obs;
  RxBool isExpanded = false.obs;
  RxList ptTicketList = [].obs;
  UserDataRepository userDataRepository = UserDataRepository();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    getPtHistory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getPtHistory() async {
    try {
      ptTicketList.value = await userDataRepository.getPtTicketHistory();
      profileImage.value = ptTicketList[ptTicketList.length-1];
      ptTicketList.removeAt(ptTicketList.length-1);
      print('PT 티켓 가져오기 성공: ${ptTicketList.length}개');
    } catch (e) {
      print('PT 티켓 가져오기 실패: $e');
    }
  }
  showBottomSheet(double scaleHeight, double scaleWidth, String title) {
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(
      horizontal: scaleWidth * 20,
      vertical: scaleHeight * 24,
    );
    Widget divider = Divider(
      color: gray100,
      thickness: 1,
    );
    Get.bottomSheet(
      Container(
        height: 800,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16 * scaleHeight,
            children: [
              Padding(
                  padding: padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  )
              ),
              divider,
              Padding(
                padding: padding,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '출석 날짜',
                          style: TextStyle(
                            fontSize: 16,
                            color: gray500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '2024년 10월 15일',
                          style: TextStyle(
                            fontSize: 16,
                            color: gray900,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '출석 시',
                          style: TextStyle(
                            fontSize: 16,
                            color: gray500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '18:00',
                          style: TextStyle(
                            fontSize: 16,
                            color: gray900,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PT 시작 시간',
                          style: TextStyle(
                            fontSize: 16,
                            color: gray500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '18:30',
                          style: TextStyle(
                            fontSize: 16,
                            color: gray900,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ),
              divider,

            ],
          ),
        ),
      ),
    );
  }
}
