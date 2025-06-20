import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:white_gym/app/data/userData.dart';
import 'package:white_gym/app/model/ticket.dart';

import '../../global.dart';
import '../model/billingInfo.dart';
import '../model/paymentItem.dart';

class PaymentsRepository {
  FirebaseStorage storage = FirebaseStorage.instance;
  final ticketHistory = FirebaseFirestore.instance.collection('ticketHistory');
  final billingInfoCollection = FirebaseFirestore.instance.collection('billingInfo');
  final paymentCollection = FirebaseFirestore.instance.collection('payment');
  UserDataRepository userDataRepository = UserDataRepository();
  gg() async {
    RxList<PaymentItem> paymentItem = <PaymentItem>[].obs;
    RxList<PaymentItem> paymentItem1 = <PaymentItem>[].obs;
    QuerySnapshot querySnapshot =  await paymentCollection.where('receipt.method_origin_symbol', isEqualTo: 'card_rebill_rest').get();

    for (QueryDocumentSnapshot document in querySnapshot.docs) {

      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      if(data['receipt']['order_name'].contains('개월')){
        if(data['locker']!= 0 || data['sportswear'] != 0 ){
          paymentItem.add(PaymentItem.fromJson(data));
        }
      }
       else if(data['receipt']['order_name'].toLowerCase().contains('pass')){
        if(data['locker']!= 0 || data['sportswear'] != 0 ){
          paymentItem1.add(PaymentItem.fromJson(data));
        }
      }



    }
    int index = 1;
    for(PaymentItem item in paymentItem){

      print('부트페이 ${item.documentId}');
      print('결제 지점 ${item.paymentBranch}');
      print('상품 이름 ${item.receipt.orderName}');
      print('유저 이름 ${item.userName}');
      print('유저 핸드폰 ${item.userPhone}');
      print('결제 금액 ${item.receipt.price}');
      print('락커 ${item.locker}');
      print('회원복 ${item.sportswear}');
      print('결제 날짜 ${item.crateDate}');
      print('$index-----------------------------------');
      index++;
    }
    for(PaymentItem item in paymentItem1){

      print('부트페이 ${item.documentId}');
      print('결제 지점 ${item.paymentBranch}');
      print('상품 이름 ${item.receipt.orderName}');
      print('유저 이름 ${item.userName}');
      print('유저 핸드폰 ${item.userPhone}');
      print('결제 금액 ${item.receipt.price}');
      print('락커 ${item.locker}');
      print('회원복 ${item.sportswear}');
      print('결제 날짜 ${item.crateDate}');
      print('$index-----------------------------------');
      index++;
    }
    print(querySnapshot.docs.length);
    print(paymentItem.length);
    print(paymentItem1.length);
    return paymentItem;
  }
  Future setBillingKey(String receiptId) async {
    try {
      Map billing = await getBillingKey(receiptId);
      DocumentReference docRef = await billingInfoCollection.add({
        'billingKey': billing['billing_key'],
        'createDate': Timestamp.now(),
        'userDocumentId': myInfo.documentId,
        'card_no': billing['billing_data']['card_no'],
        'card_company': billing['billing_data']['card_company'],
        "card_company_code": billing['billing_data']['card_company_code'],
      });
      await userDataRepository.setPaymentCard(docRef.id);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  removeCard(String documentId,String nextDocumentId) async {
    try {
      bool check = nextDocumentId != '';
      bool status = myInfo.ticket.status && myInfo.ticket.subscribe && !myInfo.ticket.endDate.isBefore(DateTime.now().add(Duration(days: -1)));
      if(!check  && status){
        Get.back();
        Get.snackbar('카드 삭제 오류', '현재 결제 예정인 이용권이 있어, 삭제가 불가능합니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
        return false;
      }
      if(check){
        await userDataRepository.setPaymentCard(nextDocumentId);
      } else {
        await userDataRepository.setPaymentCard('');
      }
      await billingInfoCollection.doc(documentId).delete();
      Get.back();
      Get.snackbar('알림', '카드삭제 성공',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      return true;
    } catch (e) {
      print('2');
      print(e);
      Get.back();
      Get.snackbar('알림', '카드삭제 실패',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      return false;
    }
  }
  getCardInfo() async {
    try {
      RxList<BillingInfo> billingInfo = <BillingInfo>[].obs;
      QuerySnapshot querySnapshot = await billingInfoCollection
          .where('userDocumentId', isEqualTo: myInfo.documentId)
          .orderBy('createDate', descending: true)
          .get();
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        billingInfo.add(BillingInfo.fromJson(document));
      }
      return billingInfo;
    }catch(e){
      print(e);
      RxList<BillingInfo> billingInfo = <BillingInfo>[].obs;
      return billingInfo;
    }
  }
  Future getBillingKey(String receiptId) async {
    try {
      String billingKeyUrl = 'https://api.bootpay.co.kr/v2/subscribe/billing_key/$receiptId';
      String tokenUrl = 'https://api.bootpay.co.kr/v2/request/token';
      Uri buillingKeyUri = Uri.parse(billingKeyUrl);
      Uri tokenUri = Uri.parse(tokenUrl);
      Map<String, dynamic> tokenMap = {
        'application_id': webApplicationId,
        'private_key': privateKey
      };
      var tokenBody = jsonEncode(tokenMap);
      var tokenReponse = await http.post(
        tokenUri,
        headers: {
          "Content-Type": "application/json"
        },
        body: tokenBody,
      );
      var tokenReponseData = jsonDecode(tokenReponse.body);
      var billingKeyReponse = await http.get(buillingKeyUri, headers: {
        'Authorization': 'Bearer ${tokenReponseData['access_token']}'
      });
      var billingKeyResponseData = jsonDecode(billingKeyReponse.body);
      return billingKeyResponseData;
    } catch (e) {
      print(e);
      return '';
    }
  }
  createReceipt(PaymentItem paymentItem,Ticket ticket, isBilling, {BillingInfo? billingInfo}) async {
    try {
      await paymentCollection.doc(paymentItem.documentId).set(paymentItem.toJson());
      if(isBilling){
        await userDataRepository.setPaymentCard(billingInfo!.documentId);
      }
      if(myInfo.ticket.spotDocumentId != ''){
        await ticketHistory.add(myInfo.ticket.toJson());
      }
      await userDataRepository.updateTicket(ticket);
      return true;
    } catch(e) {
      print('createReceipt');
      print(e);
      return false;
    }
  }
  getPayment() async{
    try {
      RxList<PaymentItem> paymentItem = <PaymentItem>[].obs;
      QuerySnapshot querySnapshot = await paymentCollection.where('userDocumentId', isEqualTo: myInfo.documentId).orderBy('crateDate', descending: true).get();
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        paymentItem.add(PaymentItem.fromJson(data));
      }
      return paymentItem;
    } catch(e) {
      print('getPayment');
      print(e);
      RxList<PaymentItem> paymentItem = <PaymentItem>[].obs;
      return paymentItem;
    }
  }
}