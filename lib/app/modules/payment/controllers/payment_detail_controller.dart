import 'dart:convert';
import 'dart:io';

import 'package:bootpay/bootpay.dart';
import 'package:bootpay/config/bootpay_config.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/payment.dart';
import 'package:white_gym/app/model/billingInfo.dart';
import 'package:http/http.dart' as http;
import '../../../../global.dart';
import '../../../model/paymentItem.dart';
import '../../../model/receipt.dart';
import '../../../model/spot.dart';
import '../../../model/spotItem.dart';
import '../../../model/ticket.dart';
import '../../../routes/app_pages.dart';

class PaymentDetailController extends GetxController {
  //TODO: Implement PaymentDetailController
  ScrollController scrollController = ScrollController();
  late DateTime now;
  var dataJson;
  RxInt sliderIndex = 0.obs;
  RxInt totalPrice = 0.obs;
  RxInt lockerPrice = 0.obs;
  RxInt sportswearPrice = 0.obs;
  RxBool lockerCheck = false.obs;
  RxBool sportswearCheck = false.obs;
  RxBool loading = false.obs;
  RxBool isBottom = false.obs;
  RxList<BillingInfo> billingInfo = <BillingInfo>[].obs;
  CarouselSliderController carouselController = CarouselSliderController();
  PaymentsRepository payments = PaymentsRepository();
  SpotItem spotItem = Get.arguments['spotItem'];
  Spot spot = Get.arguments['spot'];



  @override
  void onInit() {
    super.onInit();
    DateTime nowDate = DateTime.now();
    now = DateTime(nowDate.year, nowDate.month, nowDate.day);
    if(spotItem.isSubscribe){
      getBillingInfo();
    }
    lockerCheck.value = Get.arguments['locker'];
    sportswearCheck.value = Get.arguments['sportswear'];
    lockerPrice.value = spotItem.locker;
    sportswearPrice.value = spotItem.sportswear;

    if(spotItem.isSubscribe){
      totalPrice.value = spotItem.price + (lockerCheck.value?spotItem.locker:0) + (sportswearCheck.value?spotItem.sportswear:0);
    }
    else {
      lockerPrice.value *= spotItem.monthly;
      sportswearPrice.value *= spotItem.monthly;
      totalPrice.value = spotItem.price + (lockerCheck.value?lockerPrice.value:0) + (sportswearCheck.value?sportswearPrice.value:0);
    }
    // totalPrice.value = spotItem.price + (lockerCheck.value?spotItem.locker:0) + (sportswearCheck.value?spotItem.sportswear:0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
  scrollJump()async{
    if(isBottom.value){
      return true;
    } else {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), // 애니메이션 시간
        curve: Curves.easeInOut, // 애니메이션 효과
      );
      isBottom.value = true;
    }
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

  Payload getPayloadAppCard() {
    Payload payload = Payload();
    var total = spotItem.price+ (lockerCheck.value?lockerPrice.value:0) + (sportswearCheck.value?sportswearPrice.value:0);
    List<Item> itemList = [];
    Item item1 = Item();
    item1.name = spotItem.name; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.id = spotItem.documentId; // 해당 상품의 고유 키
    item1.price = spotItem.price.toDouble(); // 상품의 가격
    itemList.add(item1);
    if(lockerCheck.value && spotItem.locker != 0){
      Item item2 = Item();
      item2.name = "개인 락커"; // 주문정보에 담길 상품명
      item2.qty = 1; // 해당 상품의 주문 수량
      item2.id = spotItem.documentId; // 해당 상품의 고유 키
      item2.price = lockerPrice.value.toDouble();//spotItem.locker.toDouble(); // 상품의 가격
      itemList.add(item2);
    }
    if(sportswearCheck.value && spotItem.sportswear != 0){
      Item item3 = Item();
      item3.name = "회원복"; // 주문정보에 담길 상품명
      item3.qty = 1; // 해당 상품의 주문 수량
      item3.id = spotItem.documentId; // 해당 상품의 고유 키
      item3.price = sportswearPrice.value.toDouble();//spotItem.sportswear.toDouble(); // 상품의 가격
      itemList.add(item3);
    }
    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId = androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id


    payload.pg = 'nicepay';
    payload.orderName = spotItem.name; //결제할 상품명
    payload.price = total.toDouble(); //정기결제시 0 혹은 주석
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

  changeSlider(index){
    sliderIndex.value = index;
  }

  void bootpay( String orderName) async {
    print('bootpay');
    if(Platform.isAndroid){
      var a = await _getDeviceInfo();
      print('현재 sdk 버전 : ${a['sdk_version']}');
      print(a['sdk_version'] < 28);
      BootpayConfig.DISPLAY_WITH_HYBRID_COMPOSITION = a['sdk_version'] < 28;
    }

    Payload payload = getPayload(orderName);
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

  bootpayAppCard() async {
    print('bootpayAppCard');
    if(Platform.isAndroid){
      var a = await _getDeviceInfo();
      print('현재 sdk 버전 : ${a['sdk_version']}');
      print(a['sdk_version'] < 28);
      BootpayConfig.DISPLAY_WITH_HYBRID_COMPOSITION = a['sdk_version'] < 28;
    }

    Payload payload = getPayloadAppCard();
    var total = spotItem.price+ (lockerCheck.value?lockerPrice.value:0) + (sportswearCheck.value?sportswearPrice.value:0);
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
              subscribe: false,
              sportswear:sportswearCheck.value?spotItem.sportswear*spotItem.monthly:0,
              locker:lockerCheck.value?spotItem.locker*spotItem.monthly:0,
              ticketPrice: total,
              crateDate: DateTime.now(),
              receipt: receipt,
            );
            DateTime endDate =now.add(Duration(days: (spotItem.monthly*30)-1));
            Ticket ticket = Ticket(
              documentId: '',
              userDocumentId: myInfo.documentId,
              spotDocumentId: spot.documentId,
              paymentBranch:spot.name,
              admission: spotItem.admission,
              subscribe: spotItem.isSubscribe,
              createDate: DateTime(now.year, now.month, now.day),
              locker: lockerCheck.value,
              sportswear: sportswearCheck.value,
              passTicket: spotItem.passTicket,
              status: true,
              endDate: endDate,
              lockerNum: 0,
              pause: spotItem.pause,
              pauseStartDate: [],
              pauseEndDate: [],
              spotItem: spotItem,
            );
            bool check = await payments.createReceipt(payment,ticket,false);
            if (check) {
              Get.back();
              Get.snackbar('알림', '결제가 완료되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
              Get.offAllNamed(Routes.MAIN_HOME);
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

  billingKeyPay() async {
    try {
      /*
      *
      *
      * 패스 가격 가져와야함
      *
      *
      * */

      saving(Get.context!);
      User user = User(); // 구매자 정보
      user.username = myInfo.name;
      user.id = myInfo.documentId;
      user.phone = myInfo.phone;
      int totalPrice = spotItem.price+ (lockerCheck.value?spotItem.locker:0) + (sportswearCheck.value?spotItem.sportswear:0);
      String bootPayUrl = 'https://api.bootpay.co.kr/v2/subscribe/payment';
      String tokenUrl = 'https://api.bootpay.co.kr/v2/request/token';
      Map<String, dynamic> paymentsMap = {
        "billing_key": billingInfo[sliderIndex.value].billingKey,
        "order_id": DateTime
            .now()
            .millisecondsSinceEpoch
            .toString(),
        "order_name": spotItem.name,
        "price": totalPrice,
        "user": {
          "username": myInfo.name,
          "phone": myInfo.phone,
        }
      };
      Map<String, dynamic> tokenMap = {
        'application_id': webApplicationId,
        'private_key': privateKey
      };

      var tokenRespons = await http.post(
        Uri.parse(tokenUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(tokenMap),
      );
      var token = jsonDecode(tokenRespons.body);
      var response = await http.post(
        Uri.parse(bootPayUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token['access_token']}"
        },
        body: jsonEncode(paymentsMap),
      );
      Map<String,dynamic> res = jsonDecode(response.body);
      Receipt receipt = Receipt.fromJson(res);
      if (receipt.statusLocale == '결제완료') {
        PaymentItem payment = PaymentItem(
          documentId: receipt.receiptId,
          userDocumentId: myInfo.documentId,
          userName: myInfo.name,
          userPhone: myInfo.phone,
          spotDocumentId: spot.documentId,
          paymentBranch: spot.name,
          subscribe: true,
          sportswear:sportswearCheck.value ? spotItem.sportswear : 0,
          locker:lockerCheck.value ? spotItem.locker : 0,
          ticketPrice: totalPrice,
          crateDate: DateTime.now(),
          receipt: receipt,
        );
        DateTime endDate = now.add(Duration(days: (30)-1));
        Ticket ticket = Ticket(
          documentId: '',
          userDocumentId: myInfo.documentId,
          spotDocumentId: spot.documentId,
          paymentBranch:spot.name,
          admission: spotItem.admission,
          subscribe: spotItem.isSubscribe,
          createDate: DateTime(now.year, now.month, now.day),
          locker: lockerCheck.value,
          sportswear: sportswearCheck.value,
          passTicket: spotItem.passTicket,
          status: true,
          endDate: endDate,
          lockerNum: 0,
          pause: spotItem.pause,
          pauseStartDate: [],
          pauseEndDate: [],
          spotItem: spotItem,
        );
        bool check = await payments.createReceipt(payment,ticket,true,billingInfo: billingInfo[sliderIndex.value]);
        if (check) {
          Get.back();
          Get.snackbar('알림', '결제가 완료되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
          Get.offAllNamed(Routes.MAIN_HOME);
        } else {
          print('sadasd');
          Get.back();
          Get.snackbar('알림', '결제가 실패되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
        }
      }
    } catch (e) {
      Get.back();
      print('asd');
      print(e);
      Get.snackbar('알림', '결제가 실패되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
    }
  }

  Future<Map<String, dynamic>> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
        deviceData = _readAndroidDeviceInfo(await deviceInfoPlugin.androidInfo);

    } catch(error) {
      deviceData = {
        "Error": "Failed to get platform version."
      };
    }

    return deviceData;
  }

  Map<String, dynamic> _readAndroidDeviceInfo(AndroidDeviceInfo info) {
    var release = info.version.release;
    var sdkInt = info.version.sdkInt;
    var manufacturer = info.manufacturer;
    var model = info.model;

    return {
      "sdk_version": sdkInt,
      "device_model": model
    };
  }
}
