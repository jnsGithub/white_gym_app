import 'dart:convert';

import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/payload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:white_gym/component/main_box.dart';
import 'package:white_gym/global.dart';

import '../../../data/userData.dart';
import '../../../model/ticket.dart';


class SignUpController extends GetxController {
  RxBool allCheck = false.obs;
  RxBool check1 = false.obs;
  RxBool check2 = false.obs;
  RxBool check3 = false.obs;
  UserDataRepository userinfoData = UserDataRepository();
  var authenticateData;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  check(index){
    if(index == 1){
      check1.value = !check1.value;
    } else if(index == 2){
      check2.value = !check2.value;
    } else if(index == 3){
      check3.value = !check3.value;
    }
    if(check1.value && check2.value && check3.value){
      allCheck.value = true;
    } else {
      allCheck.value = false;
    }
    if(index == 4) {
      allCheck.value = !allCheck.value;
      check1.value = allCheck.value;
      check2.value = allCheck.value;
      check3.value = allCheck.value;
    }
  }
  void bootpayTest() {
    Payload payload = getPayload();
    if(kIsWeb) {
      payload.extra?.openType = "iframe";
    }
    Bootpay().requestAuthentication(
      context: Get.context!,
      payload: payload,
      showCloseButton: false,
      // closeButton: Icon(Icons.close, size: 35.0, color: Colors.black54),
      onCancel: (String data) {
        print('------- onCancel: $data');
      },
      onError: (String data) {
        print('------- onCancel: $data');
      },
      onClose: () async {
        print('------- onClose');
        Bootpay().dismiss( Get.context!); //명시적으로 부트페이 뷰 종료 호출
        try{
          saving(Get.context!);
          await Future.delayed(Duration(seconds: 1));
          Map<String,dynamic> v = {
            'name': authenticateData['name'],
            'ticket': Ticket.empty().toJson(),
            'phone': authenticateData['phone'],
            'birth': authenticateData['birth'],
            'gender': authenticateData['gender'],
            'pushAlarm':check3.value,
            'smsAlarm':check3.value,
            'createDate': Timestamp.now(),
          };
          bool a = await userinfoData.signUp(v);
          if(a) {
            Navigator.of(Get.context!).pop();
            Get.toNamed('/sign-up-completed');
          }
        } catch (e){
          Navigator.of(Get.context!).pop();
        }
      },
      onIssued: (String data) {
        print('------- onIssued: $data');
      },
      onConfirm: (String data) {
        /**
            1. 바로 승인하고자 할 때
            return true;
         **/
        /***
            2. 비동기 승인 하고자 할 때
            checkQtyFromServer(data);
            return false;
         ***/
        /***
            3. 서버승인을 하고자 하실 때 (클라이언트 승인 X)
            return false; 후에 서버에서 결제승인 수행
         */
        // checkQtyFromServer(data);
        return true;
      },
      onDone: (String data) async {
        http.Response response = await http.post(
          Uri.parse('https://api.bootpay.co.kr/v2/request/token'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            "application_id":webApplicationId,
            "private_key": privateKey
          }),
        );
        var responseData = jsonDecode(response.body);
        var dataJson = jsonDecode(data) ;
        http.Response response2 = await http.get(
          Uri.parse('https://api.bootpay.co.kr/v2/certificate/${dataJson['data']['receipt_id']}'),
          headers: <String, String>{
            "Content-Type" : "application/json",
            'Authorization': "Bearer ${responseData['access_token']}",
          },
        );
        var responseData2 = jsonDecode(response2.body);
        authenticateData = responseData2['authenticate_data'];

        },
    );
  }
  Payload getPayload() {
    Payload payload = Payload();
    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId = androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id
    payload.pg = 'kcp';
    payload.method = '본인인증';
    payload.orderName = "본인인증"; //결제할 상품명
    payload.price = 1000.0; //정기결제시 0 혹은 주석

    payload.authenticationId = DateTime.now().millisecondsSinceEpoch.toString(); //주문번호, 개발사에서 고유값으로 지정해야함
    payload.metadata = {
      "callbackParam1" : "value12",
      "callbackParam2" : "value34",
      "callbackParam3" : "value56",
      "callbackParam4" : "value78",
    }; // 전달할 파라미터, 결제 후 되돌려 주는 값
    Extra extra = Extra(); // 결제 옵션
    extra.appScheme = 'test';
    payload.extra = extra;
    return payload;
  }
}
