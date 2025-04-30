import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:white_gym/global.dart';
import 'package:http/http.dart' as http;
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController authController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  RxBool isSmsSend = false.obs;
  RxBool hpCheck = false.obs;
  RxInt code = 0.obs;
  UserDataRepository userDataRepository = UserDataRepository();
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
  check(v){
    if(!isSmsSend.value){
      hpCheck.value = RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(phoneController.text);
    }
  }

  auth() async {
    saving(Get.context!);
    try{
      if(phoneController.text == '01096005193' || phoneController.text == '01029690622'){
        if(authController.text == '123123'){
          await userDataRepository.testLogin(phoneController.text);
          if(myInfo.ticket.endDate.isBefore(DateTime.now().add(Duration(days: -1)))){
            Get.offAllNamed(Routes.GYM_LIST);
            Get.snackbar('알림', '로그인이 완료되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
            return;
          }
          Get.offAllNamed(Routes.MAIN_HOME);
          return;
        }
        Get.snackbar('알림', '인증번호를 확인해주세요.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      }
      if(code.value == int.parse(authController.text)){
        bool check = await userDataRepository.login(phoneController.text);
        if(check){
          if(myInfo.ticket.endDate.isBefore(DateTime.now().add(Duration(days: -1)))){
            Get.back();
            Get.offAllNamed(Routes.GYM_LIST);
            Get.snackbar('알림', '로그인이 완료되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
            return;
          }
          Get.back();
          Get.offAllNamed(Routes.MAIN_HOME);
          Get.snackbar('알림', '로그인이 완료되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
        } else {
          Get.back();
          Get.snackbar('알림', '가입하지 않은 번호입니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
        }
      } else {
        Get.back();
        Get.snackbar('알림', '인증번호를 확인해주세요.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      }
    } catch (e){
      print(e);
      Get.back();
    }
  }
  sendSms() async {
    if(phoneController.text.isEmpty){
      Get.snackbar('알림', '휴대폰 번호를 입력해주세요.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      return;
    }
    if(!RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(phoneController.text)){
      Get.snackbar('휴대폰 인증','핸드폰 번호를 확인해주세요',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      return;
    }
    saving(Get.context!);
    if(await userDataRepository.signUpCheck(phoneController.text)){
      Get.back();
      Get.snackbar('알림', '가입하지 않은 번호입니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      return;
    }
    Get.back();
    Random random = Random();

    final url = Uri.parse('https://talkapi.lgcns.com/request/sms.json'); // LG CNS SMS API URL
    final headers = {
      'Content-Type': 'application/json',
      'authToken': 'NRrFNYoPGJ+vOUtlCqejFA==',
      'serverName': 'lgcns',
    };
    code.value = (random.nextInt(900000) + 100000);
    final body = jsonEncode({
      "service": 2400105815,
      "message": "[화이트짐] 인증번호는 ${code.value} 입니다.",
      "mobile": phoneController.text,
      "callbackNo" : "025569688"
    });

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        isSmsSend.value = true;
        FocusScope.of(Get.context!).unfocus();

      } else {
        Get.snackbar( '알림', '인증번호 전송에 실패했습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      }
    } catch (e) {
      Get.snackbar( '알림', '인증번호 전송에 실패했습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
    }
    isSmsSend.value = true;
    FocusScope.of(Get.context!).unfocus();
  }
}
