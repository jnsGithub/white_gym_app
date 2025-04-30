import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:white_gym/app/model/visitHistory.dart';
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
  RxBool subscribe = myInfo.ticket.subscribe.obs;
  RxBool status = myInfo.ticket.status.obs;
  RxBool isPass = myInfo.ticket.passTicket.obs;
  RxBool isCancel = false.obs;
  RxBool isLoading = false.obs;
  RxString qrPwd = ''.obs;
  RxString paymentBranch = myInfo.ticket.paymentBranch.obs;
  RxInt selectedIndex = 0.obs;
  RxList gymList = [].obs;
  RxList<Spot> gymList2 = <Spot>[].obs;
  RxList<VisitHistory> visitHistory = <VisitHistory>[].obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentStoreVersion('com.white.gym.app.white_gym');
    });
    init();
    timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {

    });
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
    getVisitHistory();
  }
  getVisitHistory() async {
    visitHistory.value = await visitRepository.fetchCurrentMonthVisitHistory();
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
    Map<String, dynamic> devSnsList = {
      '용인 동백점': '4289065327',
      '퍼스트짐 수원': '4281682907',
      '동탄 반송': '1628442783',
      '수원영통점': '4283978146',
      '산척점': '4287340812',
      '동백2호점': '4285387246',
      '청계점': '4285329408',
      '영천점': '4280693574',
      '목동점': '4282508314',
      '강남점': '4285872639',
      '역삼점': '4284670952',
      '강남점 후문': '4284103859',
      '수원아주대 정문': '4287340812',
      '수원아주대필라테스': '4288907643',
      '길동점': '4287142806',
      '오산 세교점': '4280749683',
      '양재점': '4280178329',
      '강동점': '4288749026',
      '강동점 (1)': '4284761952',
      '선릉점': '4285892703',
      '강남점 후문 (1)': '4289204351',
      '강남점 후문 (2)': '4287952063',
    };
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
}
