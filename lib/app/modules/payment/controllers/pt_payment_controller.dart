import 'dart:convert';
import 'dart:io';

import 'package:bootpay/bootpay.dart';
import 'package:bootpay/config/bootpay_config.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/payment.dart';
import 'package:white_gym/app/model/ptItem.dart';
import 'package:white_gym/app/model/ptTicket.dart';
import 'package:white_gym/app/model/spot.dart';

import '../../../../global.dart';
import '../../../model/billingInfo.dart';
import '../../../model/paymentItem.dart';
import '../../../model/receipt.dart';
import '../../../model/staff.dart';
import '../../../routes/app_pages.dart';

class PtPaymentController extends GetxController {

  Staff trainer = Get.arguments['trainer'];
  PtItem ptItem = Get.arguments['ptItem'];
  Map ptGroup = Get.arguments['ptGroup'];
  Spot spot = Get.arguments['spot'];
  String date = '';
  List exercisePurpose = ['다이어트', '바디 프로필', '기초 체력 증진', '근력 증가', '운동 방법 학습','기타'];
  var dataJson;

  TextEditingController comment = TextEditingController(); // 코멘트 입력용 컨트롤러
  CarouselSliderController carouselController = CarouselSliderController();
  PaymentsRepository payments = PaymentsRepository();

  RxList<String> selectedParts = <String>[].obs; // 초기 선택된 부위
  RxList<BillingInfo> billingInfo = <BillingInfo>[].obs;
  List<RxBool> isRequiredCheck = <RxBool>[false.obs,false.obs, false.obs, false.obs].obs;
  RxBool isAppCard = false.obs; // 앱카드 결제 여부
  RxBool loading = false.obs; // 로딩 상태
  RxInt sliderIndex = 0.obs;

  DateTime now = DateTime.now();
  @override
  void onInit() {
    super.onInit();
    DateTime now = DateTime.now();
    date = '${formatExpiryDate(now)} ~ ${formatExpiryDate(now.add(Duration(days: ptItem.admission * 3 - 1)))}';
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
  changeSlider(index){
    sliderIndex.value = index;
  }
  getBillingInfo () async {
    billingInfo.value = await payments.getCardInfo();
    billingInfo.add(BillingInfo(billingKey: '', documentId: '', cardCompany: '', cardNo: '', createDate: DateTime.now(), userDocumentId: '', cardCompanyCode: ''));
    if(billingInfo.length != 1 && myInfo.paymentCard != ''){
      int index = billingInfo.indexWhere((billingInfo) => billingInfo.documentId == myInfo.paymentCard);
      sliderIndex.value = index;
      carouselController.animateToPage(index);
    }
    loading.value = true;
  }
  void bootpay() async {
    if(Platform.isAndroid){
      var a = await getDeviceInfo();
      BootpayConfig.DISPLAY_WITH_HYBRID_COMPOSITION = a['sdk_version'] < 28;
    }

    Payload payload = getPayload();
    if(kIsWeb) {
      payload.extra?.openType = "iframe";
    }


    Bootpay().requestSubscription(
      context: Get.context!,
      payload: payload,
      showCloseButton: false,
      onCancel: (String data) {
        print(data);
      },
      onError: (String data) async {
        var data2 = jsonDecode(data);
        Get.snackbar('결제 오류', data2['message'].toString());
      },
      onClose: () async{
        print('onClose');
        try{
          Bootpay().dismiss(Get.context!); //명시적으로 부트페이 뷰 종료 호출
          saving(Get.context!);
          bool check = false;
          await Future.delayed(Duration(seconds: 2), ()async => check = await payments.setBillingKey(dataJson['data']['receipt_id']));
          if(check){
            Get.back();
            getBillingInfo();
            Get.snackbar('알림', '등록이 완료되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
          } else {
            Get.back();
            Get.snackbar('알림', '등록이 실패되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
          }
        } catch (e){
          print(e);
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
  Payload getPayload() {
    Payload payload = Payload();

    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId = androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id


    payload.pg = 'nicepay';
    payload.method = '카드자동';
    payload.orderName = '자동결제 카드등록'; //결제할 상품명
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

  bootpayAppCard() async {
    if(Platform.isAndroid){
      var a = await getDeviceInfo();
      BootpayConfig.DISPLAY_WITH_HYBRID_COMPOSITION = a['sdk_version'] < 28;
    }

    Payload payload = getPayloadAppCard();
    var data2 = null;


    Bootpay().requestPayment(
      context: Get.context!,
      payload: payload,
      showCloseButton: false,
      onCancel: (String data) {
        print(data);
      },
      onError: (String data) {
        print(data);
        data2 = jsonDecode(data);
        // Get.snackbar('결제 오류', data2['message'].toString());
      },
      onClose: () async{
        try{
          Bootpay().dismiss(Get.context!); //명시적으로 부트페이 뷰 종료 호출
          saving(Get.context!);
          Map<String,dynamic> res = dataJson['data'];
          Receipt receipt = Receipt.fromJson(res);
          if (receipt.statusLocale == '결제완료') {
            PaymentItem payment = PaymentItem(
              documentId: receipt.receiptId,
              userDocumentId: myInfo.documentId,
              userName: myInfo.name,
              userPhone: myInfo.phone,
              spotDocumentId: spot.documentId,
              paymentBranch: spot.name,
              ptItemAdmission: ptItem.admission,
              ptItemDocumentId: ptItem.documentId,
              ptItemName: ptItem.name,
              trainerName: trainer.name,
              trainerDocumentId: trainer.documentId,
              subscribe: false,
              sportswear:0,
              locker:0,
              ticketPrice: ptItem.price,
              crateDate: DateTime.now(),
              receipt: receipt,
              newPayment: myInfo.ticket.spotDocumentId == '',
            );
            DateTime endDate = now.add(Duration(days: ptItem.admission * 3 - 1));
            PtTicket ptTicket = PtTicket(
              userDocumentId: myInfo.documentId,
              spotDocumentId: spot.documentId,
              paymentBranch: spot.name,
              paymentDocumentId: payment.documentId,
              trainerDocumentId: trainer.documentId,
              trainerName: trainer.name,
              admission: ptItem.admission,
              currentAdmission: 0,
              comment: comment.text,
              exercisePurpose: selectedParts.toList(),
              endDate: endDate,
              createDate: DateTime.now(),
              ptItem: ptItem,
            );
            bool check = await payments.createPtReceipt(payment,ptTicket,false);
            if (check) {
              Get.back();
              Get.snackbar('알림', '결제가 완료되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
              Get.offAllNamed(Routes.PAYMENT_SUCCESS, arguments: spot.documentId);
            } else {
              Get.back();
              Get.snackbar('알림', '결제가 실패되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
            }
          }
        } catch (e){
          print(e);
          Get.back();
          Get.snackbar('결제 오류', data2['message'].toString());

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
  Payload getPayloadAppCard() {
    Payload payload = Payload();
    List<Item> itemList = [];
    Item item1 = Item();
    item1.name = ptItem.name; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.id = ptItem.documentId; // 해당 상품의 고유 키
    item1.price = ptItem.price.toDouble(); // 상품의 가격
    itemList.add(item1);
    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId = androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id


    payload.pg = 'nicepay';
    payload.orderName = ptItem.name; //결제할 상품명
    payload.price = ptItem.price.toDouble(); //정기결제시 0 혹은 주석
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    payload.methods = ['card'];
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
    extra.cardQuota = '0,2,3';
    payload.items = itemList; // 상품정보 배열
    payload.user = user;
    payload.extra = extra;
    return payload;
  }
  Widget requiredCheck(int index, String text, double fontSize){
    return Obx(() => GestureDetector(
      onTap: (){
        isRequiredCheck[index].value = !isRequiredCheck[index].value;
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, color: isRequiredCheck[index].value ? mainColor : gray100, size: 20,),
          SizedBox(width: 8,),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  height: 1.4,
                  fontSize: fontSize,
                  color: isRequiredCheck[index].value
                      ? mainColor
                      : Colors.black,
                  fontWeight: isRequiredCheck[index].value
                      ? FontWeight.w600
                      : FontWeight.w400
              ),
              maxLines: 3,
              softWrap: true,
            ),
          )
        ],
      ),
    ),
    );
  }
}
