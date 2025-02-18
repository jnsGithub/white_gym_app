import 'dart:convert';

import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/userData.dart';

import '../../../../global.dart';
import '../../../data/payment.dart';
import '../../../model/billingInfo.dart';

class CardListController extends GetxController {
  var dataJson;
  CarouselSliderController carouselController = CarouselSliderController();
  RxInt sliderIndex = 0.obs;
  RxList<BillingInfo> billingInfo = <BillingInfo>[].obs;
  RxBool loading = true.obs;
  PaymentsRepository payments = PaymentsRepository();
  UserDataRepository userDataRepository = UserDataRepository();
  @override
  void onInit() {
    super.onInit();
    getBillingInfo();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getBillingInfo () async {
    billingInfo.value = await payments.getCardInfo();
    billingInfo.add(BillingInfo(billingKey: '', documentId: '', cardCompany: '', cardNo: '', createDate: DateTime.now(), userDocumentId: '', cardCompanyCode: ''));
    if(billingInfo.length != 1 && myInfo.paymentCard != ''){
      int index = billingInfo.indexWhere((billingInfo) => billingInfo.documentId == myInfo.paymentCard);
      sliderIndex.value = index;
      carouselController.animateToPage(index);
    }
    loading.value = false;
  }
  removeCard() async {
    Size size = MediaQuery.of(Get.context!).size;
    Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          actionsPadding: EdgeInsets.zero,
          titlePadding: const EdgeInsets.only(top: 50, bottom: 40),
          title: const Text(
            '카드를 삭제하시겠습니까?',
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
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        bool nextCard = billingInfo[sliderIndex.value+1].documentId != '';
                        bool check = await payments.removeCard(billingInfo[sliderIndex.value].documentId,nextCard?billingInfo[sliderIndex.value+1].documentId:'');
                        if(check){
                          getBillingInfo();
                        }
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
  changePaymentCard() async {
    for(var i in billingInfo){
      print(i.documentId);
      print(i.cardNo);
      print(i.cardCompany);
    }
    myInfo.paymentCard = billingInfo[sliderIndex.value].documentId;
    bool a = await userDataRepository.setPaymentCard(myInfo.paymentCard);
    if(a){
      Get.back();
      Get.snackbar('알림', '변경이 완료되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
    } else {
      Get.snackbar('알림', '변경이 실패되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
    }
  }
  changeSlider(index){
    sliderIndex.value = index;
  }
  Payload getPayload(String orderName) {
    Payload payload = Payload();

    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId = androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id


    payload.pg = 'nicepay';
    payload.method = '카드자동';
    payload.orderName = orderName; //결제할 상품명
    // payload.price = 0; //정기결제시 0 혹은 주석

    String id = DateTime.now().millisecondsSinceEpoch.toString();

    payload.orderId = id; //주문번호, 개발사에서 고유값으로 지정해야함
    payload.subscriptionId = id; //주문번호, 개발사에서 고유값으로 지정해야함

    User user = User(); // 구매자 정보
    user.username = myInfo.name;
    user.id = myInfo.documentId;
    user.email = "";
    user.area = "";
    user.phone = myInfo.phone;
    user.addr = '';

    Extra extra = Extra(); // 결제 옵션
    extra.appScheme = 'white-gym';
    extra.cardQuota = '3';

    payload.user = user;
    payload.extra = extra;
    return payload;
  }
  void bootpay( String orderName) {
    Payload payload = getPayload(orderName);
    if(kIsWeb) {
      payload.extra?.openType = "iframe";
    }

    Bootpay().requestSubscription(
      context: Get.context!,
      payload: payload,
      showCloseButton: false,
      onCancel: (String data) {
      },
      onError: (String data) {
      },
      onClose: () async{
        try{
          Bootpay().dismiss(Get.context!); //명시적으로 부트페이 뷰 종료 호출
          saving(Get.context!);

          bool check = false;

          await Future.delayed(Duration(seconds: 2), ()async => check = await payments.setBillingKey(dataJson['data']['receipt_id']));
          if(check){
            Get.back();
            getBillingInfo();
            Get.snackbar('알림', '카드등록 성공했습니다',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
          } else {
            Get.snackbar('알림', '카드등록 실패했습니다',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
          }
        } catch (e){
          Get.back();
        }
        //TODO - 원하시는 라우터로 페이지 이동
      },
      onIssued: (String data) {
      },
      onConfirm: (String data) {
        return true;
      },
      onDone: (String data) async {
        dataJson = jsonDecode(data);
      },
    );
  }


}
