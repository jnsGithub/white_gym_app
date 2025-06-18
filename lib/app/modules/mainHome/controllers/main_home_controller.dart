import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:white_gym/app/data/ptSchedules.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:white_gym/app/model/visitHistory.dart';
import 'package:white_gym/component/dialog.dart';
import 'package:white_gym/component/lineContainer.dart';
import 'package:white_gym/component/main_box.dart';
import 'package:white_gym/global.dart';
import 'package:http/http.dart' as http;

import '../../../data/spot.dart';
import '../../../data/visitHistory.dart';
import '../../../model/spot.dart';

class MainHomeController extends GetxController {
  //TODO: Implement MainHomeController
  SpotDataRepository spotDataRepository = SpotDataRepository();
  UserDataRepository userDataRepository = UserDataRepository();
  VisitRepository visitRepository = VisitRepository();
  PtSchedules ptSchedules = PtSchedules();
  RxBool subscribe = myInfo.ticket.subscribe.obs;
  RxBool status = myInfo.ticket.status.obs;
  RxBool isPass = myInfo.ticket.passTicket.obs;
  RxBool isCancel = false.obs;
  RxBool isLoading = false.obs;
  RxBool isPt = false.obs;
  RxString qrPwd = ''.obs;
  RxString paymentBranch = myInfo.ticket.paymentBranch.obs;
  RxInt selectedIndex = 0.obs;
  RxInt endDate = 0.obs;
  RxList gymList = [].obs;
  RxList<Spot> gymList2 = <Spot>[].obs;
  RxList<VisitHistory> visitHistory = <VisitHistory>[].obs;
  RxList calendarList = [].obs;
  late Timer timer;
  late DateTime focusedDay;
  late DateTime selectedDay;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentStoreVersion('com.white.gym.app.white_gym');
    });
    focusedDay = DateTime.now();
    selectedDay = DateTime.now();
    init();
    timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {

    });
    DateTime now = DateTime.now();
    DateTime now2 = DateTime(now.year, now.month, now.day);
    if(!myInfo.ticket.status){
      DateTime now3 =DateTime(myInfo.ticket.pauseStartDate.last.year, myInfo.ticket.pauseStartDate.last.month, myInfo.ticket.pauseStartDate.last.day);
      Duration diff = myInfo.ticket.endDate.difference(now3);
      endDate.value = diff.inDays + 1;
    } else {
      Duration diff = myInfo.ticket.endDate.difference(now2);
      endDate.value = diff.inDays + 1;
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
  init() async {

    gymList2.value = await spotDataRepository.getSpot();
    selectedIndex.value = 0;
    int j = 0;
    for(var i in gymList2){
      if(i.documentId == myInfo.ticket.spotDocumentId){
        selectedIndex.value = j;
      }
     gymList.add(i.name);
     j++;
    }
    getVisitHistory(a:selectedDay);

  }
  getVisitHistory({DateTime? a}) async {
    DateTime day = a ?? DateTime.now();
    visitHistory.value = await visitRepository.fetchCurrentMonthVisitHistory(day);
    calendarList.clear();
    for (var visit in visitHistory) {
      DateTime visitDate = visit.createDate;
        if(calendarList.any((item) =>
            item['day'].year == visitDate.year &&
            item['day'].month == visitDate.month &&
            item['day'].day == visitDate.day))
        {
          int index = calendarList.indexWhere((item) =>
              item['day'].year == visitDate.year &&
              item['day'].month == visitDate.month &&
              item['day'].day == visitDate.day);
          calendarList[index]['visits'].add(formatTime(visitDate));
        } else {
          calendarList.add({
            'day':  DateTime(visitDate.year, visitDate.month, visitDate.day),
            'visits':[formatTime(visitDate)],
            'pt':'',
            'ptIsDone':false
          });
        }
    }
    List ptScheduleItem = await ptSchedules.getPtSchedules(day);
    for (var pt in ptScheduleItem) {
      DateTime ptDate = pt['reservationDate'].toDate();
      if(calendarList.any((item) =>
          item['day'].year == ptDate.year &&
          item['day'].month == ptDate.month &&
          item['day'].day == ptDate.day))
      {
        int index = calendarList.indexWhere((item) =>
            item['day'].year == ptDate.year &&
            item['day'].month == ptDate.month &&
            item['day'].day == ptDate.day);
        calendarList[index]['pt'] = pt;
        calendarList[index]['ptIsDone'] = pt['status'] == 1;
      } else {
        calendarList.add({
          'day':  DateTime(ptDate.year, ptDate.month, ptDate.day),
          'visits':[],
          'pt':pt,
          'ptIsDone':pt['status'] == 1
        });
      }
    }

    update();
  }
  bool hasVisitOnDay(DateTime day) {
    return calendarList.any((item) {
      return item['day'].year == day.year &&
          item['day'].month == day.month &&
          item['day'].day == day.day;
    });
  }
  changeDays(s,f){
    selectedDay = s;
    focusedDay = f;
    Map? a = calendarList.firstWhere(
          (test) =>
      test['day'].year == selectedDay.year &&
          test['day'].month == selectedDay.month &&
          test['day'].day == selectedDay.day,
      orElse: () => null, // 찾지 못했을 때 null 반환
    );
    if( a != null){
      showBottomSheet(a);
    }

    update();
  }
  changeGym(){
    Get.dialog(
        AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: SizedBox(
                height: 300,
                width: 240,
                child: SizedBox(
                  width: 175,
                  child: Obx(
                      ()=> ListView.builder(
                      shrinkWrap: true,
                        itemCount: gymList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              selectedIndex.value = index;
                              paymentBranch.value = gymList2[index].name;
                              Get.back();
                            },
                            child: Container(
                              height: 50,
                              width: 175,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: selectedIndex.value == index? Color(0xffF6F6F9):null,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Text(gymList[index],style: TextStyle(fontSize: 16,fontWeight: selectedIndex.value==index?FontWeight.w600:FontWeight.w500,color: selectedIndex.value==index?mainColor:gray500),),
                            ),
                          );
                        }
                    ),
                  ),
                )
            )
        )
    );
  }
  changeSubscribe(){
    subscribe.value = !subscribe.value;
  }
  //ios
  void _preventScreenshotOn() async => await ScreenProtector.preventScreenshotOn();
  void _preventScreenshotOff() async => await ScreenProtector.preventScreenshotOff();
  //android
  void _preventScreenshotOn2() async => await ScreenProtector.protectDataLeakageOn();
  void _protectDataLeakageOff2() async => await ScreenProtector.protectDataLeakageOff();

  getHistory() async {
    List<VisitHistory> a = await userDataRepository.getVisitHistory();
    return a.length < myInfo.ticket.admission;
  }
  goToQR() async {
    Size size = MediaQuery.of(Get.context!).size;
    if (Platform.isAndroid) {
      _preventScreenshotOn2();
    } else if (Platform.isIOS) {
      _preventScreenshotOn();
    }
    await Get.bottomSheet(
      isScrollControlled: true,
        Container(
          height: size.height*0.89,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.width*0.2061,),
                    Text("출입 QR 생성",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                    SizedBox(height: 5),
                    Text("하단의 QR코드를 스캔해주세요",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: text7D),),
                    SizedBox(height: 32),
                    Obx(()=>
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          QrImageView(
                            data: qrPwd.value,
                            version: QrVersions.auto,
                            size: 200.0,
                          ),

                          isCancel.value?Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child:Text('QR코드가 만료되었습니다.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: text22),)
                          ):Container()
                        ],
                      ),
                    ),
                    SizedBox(height: 28),
                    GestureDetector(
                      onTap: (){
                        getQrPassWord(true);
                      },
                      child: Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffE2E8F0),width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.refresh,color: text7D,),
                            SizedBox(width: 8,),
                            Text('새로고침',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: text7D),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                      child: MainBox(text: '닫기', color: mainColor, textColor: Colors.white)
                  ),
                )
              ],
            ),
          ),
        )
    );
    getVisitHistory();
    if (Platform.isAndroid) {
      _protectDataLeakageOff2();
    } else if (Platform.isIOS) {
      _preventScreenshotOff();
    }
  }
  void getQrPassWord(isRefresh) async {
    if(isLoading.value){
      return;
    }
    bool check = await getHistory();
    if(!check ){
      if(!Get.isSnackbarOpen){
        Get.snackbar('알림', '일일 입장횟수를 초과 했습니다',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      }
      return;
    }
    saving(Get.context!);
    isLoading.value = true;
    try {
      qrPwd.value = myInfo.documentId;
      Get.back();
      isLoading.value = false;
      isCancel.value = false;
      if(timer.isActive){
        timer.cancel();
      }
      timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
        isCancel.value = true;
        timer.cancel();
      });
      if(!isRefresh){
        goToQR();
      }
    } catch (e) {
      qrPwd.value = '';
      Get.back();
      print(e);
      Get.snackbar('에러', 'QR 생성에 실패했습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
    }
  }

  RxList<String> bodyParts = <String>['가슴', '등', '하체', '유산소', '팔', '어깨', '복부/코어'].obs;
  RxList<String> selectedParts = <String>[].obs; // 초기 선택된 부위
  bool canCancelReservation(DateTime reservationDate) {
    final now = DateTime.now();
    final cancelDeadline = reservationDate.subtract(const Duration(hours: 24));
    return now.isBefore(cancelDeadline);
  }
  bool has50MinutesPassed(DateTime reservationDate) {
    final now = DateTime.now();
    final threshold = reservationDate.add(const Duration(minutes: 50));
    return now.isAfter(threshold);
  }
  showBottomSheet (Map a) async {
    print('a: $a');
    DateTime thisDay = a['day'];
    DateTime now = DateTime.now();
    bool canPt = a['pt'] != '';
    DateTime ptDate = DateTime.now();
    bool canCancel = false;
    if(a['pt'] != ''){
      ptDate = a['pt']['reservationDate'].toDate();
    }
    if(thisDay.isAfter(now)){
      isPt.value = true;
      selectedParts.value = List<String>.from(a['pt']['trainingPart']);
      // ptDate = DateTime.parse("2025-06-20T16:00:00+09:00");
      if (canCancelReservation(ptDate)) {
        canCancel = true;
      } else {
        canCancel = false;
      }
    } else {
      isPt.value = false;
    }
    var record = await userDataRepository.getRecord(selectedDay);
    Size size = MediaQuery.of(Get.context!).size;
    selectedParts.value = []; // 초기 선택된 부위
    if(record != null) {
      selectedParts.value = List<String>.from(record['trainingPart']);
    }
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(()=>
                    !isPt.value?Text('일반 운동',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: gray900),):
                    Row(children: [
                      Text('PT',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: gray900),),
                      SizedBox(width: 8,),
                      GestureDetector(
                        onTap: (){
                          if(!canCancel){
                            Get.snackbar('알림', 'PT 예약 취소는 PT 시작 24시간 전까지 가능합니다.', backgroundColor: Colors.white, colorText: text22, borderRadius: 16, borderColor: gray700, borderWidth: 1);
                            return;
                          }
                          Get.dialog(
                              AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                backgroundColor: Colors.white,
                                actionsPadding: EdgeInsets.zero,
                                content: SizedBox(
                                  height: 119,
                                  child: Center(
                                    child: Text('PT예약을 취소 하시겠습니까?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: text22,
                                      ),),
                                  ),
                                ),
                                actions: [
                                  Container(
                                    width: size.width,
                                    height: 48.1,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          color:  const Color(0xffe0e0e0),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () => {
                                                Get.back()
                                              },
                                              child: Container(
                                                height: 48.1,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                      color: const Color(0xffe0e0e0),
                                                      width: 2,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  '취소',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(0xff303030),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () =>{
                                              ptSchedules.changeStatus(a['pt']['documentId'],3).then((value) {
                                                if(value){
                                                  Get.back();
                                                  Get.back();
                                                  Get.snackbar('알림', 'PT 예약이 취소되었습니다.', backgroundColor: Colors.white, colorText: text22, borderRadius: 16, borderColor: gray700, borderWidth: 1);
                                                  getVisitHistory(a:selectedDay);
                                                } else {
                                                  Get.snackbar('알림', 'PT 예약 취소에 실패했습니다.', backgroundColor: Colors.white, colorText: text22, borderRadius: 16, borderColor: gray700, borderWidth: 1);
                                                }
                                              })
                                            },
                                            child: Container(
                                              height: 48,
                                              alignment: Alignment.center,
                                              child: Text(
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
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                          decoration: BoxDecoration(
                            color: canCancel ? red50:gray400,
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color:canCancel ? red:gray400,width: 1.5),
                          ),
                          child: Text('예약 취소',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color:  canCancel ? red:Colors.white,),)
                        ),
                      )
                    ],),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.close,color: text22,size: 24,),
                  )
                ],
              )
            ),
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: gray100, width: 1.0),
                    top: BorderSide(color: gray100, width: 1.0
                    ),
                  ),
                ),
              child: Column(
                spacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('출석 날짜',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray500),),
                      Text('${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray900),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('출석 시간',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray500),),
                      Text((a['visits'] as List).join(' , '),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray900),),
                    ],
                  ),
                  Obx(()=>
                    !isPt.value?Container():Column(
                      spacing: 16,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('PT 트레이너',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray500),),
                            Text(a['pt']['trainerName'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray900),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('PT 시작시간',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray500),),
                            Text(formatTime(ptDate),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray900),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('운동 종류',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: gray900),),
                  SizedBox(height: 16,),
                  Obx(()=>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(!thisDay.isAfter(now)){
                              isPt.value = false;
                              selectedParts.value = List<String>.from(record['trainingPart']);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width*0.4293,
                            height: 46,
                            decoration: BoxDecoration(
                              border: Border.all(color:isPt.value? gray50:mainColor,width: 1.5),
                              borderRadius: BorderRadius.circular(30),
                              color: isPt.value? gray50: blue50
                            ),
                            child: Text('개인 운동',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:isPt.value? gray300:  mainColor),),
                          ),
                        ),
                        canPt ? GestureDetector(
                          onTap: (){
                            isPt.value = true;
                            selectedParts.value = List<String>.from(a['pt']['trainingPart']);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width*0.4293,
                            height: 46,
                            decoration: BoxDecoration(
                              border: Border.all(color: isPt.value? mainColor:gray50,width: 1.5),
                              borderRadius: BorderRadius.circular(30),
                                color: isPt.value? blue50:gray50
                            ),
                            child: Text('PT',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:isPt.value? mainColor:gray300 ),),
                          ),
                        ):Container()
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text('운동 부위',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: gray900),),
                  SizedBox(height: 16),
                  Obx(()=>
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: bodyParts.map((part) {
                        bool isSelected = selectedParts.contains(part);
                        return GestureDetector(
                          onTap: () {
                            if(isSelected){
                              selectedParts.remove(part);
                            } else {
                              selectedParts.add(part);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? blue50 : gray50,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: isSelected ? mainColor : gray200,
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              part,
                              style: TextStyle(
                                color: isSelected ? mainColor : gray700,
                                fontSize: 16,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Obx(()=>
                    isPt.value?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24,),
                            Text('트레이너 코멘트',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: gray900),),
                            SizedBox(height: 16,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10000),
                                    image: DecorationImage(
                                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/white-gym.firebasestorage.app/o/spot%2F2025-01-31%2013%3A34%3A21.597?alt=media&token=16c90031-1b83-4443-be08-feb9907a9a63'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                  width: size.width*0.76,
                                  decoration: BoxDecoration(
                                    color: gray50,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(a['pt']['comment'],style: TextStyle(fontSize: 16,color: gray900,height: 1.6),)
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                          ],
                        )
                        :SizedBox(height: 36,),
                  ),
                  Obx(()=>
                    GestureDetector(
                      onTap: () async {
                        if(isPt.value){
                          if (has50MinutesPassed(ptDate)) {
                            Get.dialog(
                                AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  backgroundColor: Colors.white,
                                  actionsPadding: EdgeInsets.zero,
                                  content: SizedBox(
                                    height: 119,
                                    child: Center(
                                      child: Text('PT를 완료하시겠습니까?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.5,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: text22,
                                        ),),
                                    ),
                                  ),
                                  actions: [
                                    Container(
                                      width: size.width,
                                      height: 48.1,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color:  const Color(0xffe0e0e0),
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () => {
                                                Get.back()
                                              },
                                              child: Container(
                                                height: 48.1,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                      color: const Color(0xffe0e0e0),
                                                      width: 2,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  '취소',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(0xff303030),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () =>{
                                                review(a['pt'])
                                                // ptSchedules.changeStatus(a['pt']['documentId'], 1).then((value) {
                                                //   if(value){
                                                //     Get.back();
                                                //     Get.back();
                                                //     Get.snackbar('알림', 'PT가 완료되었습니다.', backgroundColor: Colors.white, colorText: text22, borderRadius: 16, borderColor: gray700, borderWidth: 1);
                                                //     getVisitHistory(a:selectedDay);
                                                //   } else {
                                                //     Get.snackbar('알림', 'PT 완료에 실패했습니다.', backgroundColor: Colors.white, colorText: text22, borderRadius: 16, borderColor: gray700, borderWidth: 1);
                                                //   }
                                                // })
                                              },
                                              child: Container(
                                                height: 48,
                                                alignment: Alignment.center,
                                                child: Text(
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
                            print("예약 시간으로부터 50분이 지났습니다.");
                          } else {
                            print("아직 50분이 지나지 않았습니다.");
                          }
                        } else {
                          bool check = await userDataRepository.addRecord(selectedParts,a['visits'], selectedDay);
                          Get.snackbar('알림', check ? '운동 기록이 저장되었습니다.' : '운동 기록 저장에 실패했습니다.', backgroundColor: Colors.white, colorText: text22, borderRadius: 16, borderColor: gray700, borderWidth: 1);
                        }
                      },
                        child: isPt.value? MainBox(text:  'PT 완료', color:  !a['ptIsDone'] && has50MinutesPassed(ptDate)?mainColor:gray100, textColor:!a['ptIsDone'] && has50MinutesPassed(ptDate)? Colors.white:gray400):
                        MainBox(text: '저장', color:  mainColor, textColor: Colors.white)
                    ),
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
  review(pt){
    Get.bottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        GestureDetector(
          onTap: (){
            FocusScope.of(Get.context!).unfocus(); // 키보드 내리기
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('리뷰 작성',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,height: 1.4,color: gray900),),
                    IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.close,color: gray900,size: 24))
                  ],
                ),
                Text('${pt['trainerName']}의 ${myInfo.ptTicket.currentAdmission + 1}회차 운동 후기는 어떠 셨나요?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                Container(
                    width: MediaQuery.of(Get.context!).size.width,
                    child: TextField(
                      maxLines: 6,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,height: 1.6,color: gray900),
                      decoration: InputDecoration(
                        filled: true, // 이걸 true로 해야 배경색이 적용됨
                        fillColor: gray50, // 원하는 배경색
                        hintStyle: TextStyle(fontSize: 16, color: gray500),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color:  Color(0xffDFE2E8), width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color:  Color(0xffDFE2E8), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: mainColor, width: 1),
                        ),
                      ),
                    )
                ),
                Container(
                  width: MediaQuery.of(Get.context!).size.width,
                  margin: EdgeInsets.only(top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(Get.context!).size.width*0.44,
                          height: 50,
                          decoration: BoxDecoration(
                            color: blue50,
                            border: Border.all(color: blue500,width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('건너뛰기',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17,color: blue500,height: 1.4),),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(Get.context!).size.width*0.44,
                        height: 50,
                        decoration: BoxDecoration(
                          color: blue500,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('등록하기',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17,color: Colors.white,height: 1.4),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
