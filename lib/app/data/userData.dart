import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:white_gym/app/model/visitHistory.dart';
import '../../component/main_box.dart';
import '../../global.dart';
import '../model/ticket.dart';
import '../model/userData.dart';
import '../routes/app_pages.dart';


class UserDataRepository {
  FirebaseStorage storage = FirebaseStorage.instance;
  final userCollection = FirebaseFirestore.instance.collection('user');
  final visitHistory = FirebaseFirestore.instance.collection('visitHistory');
  final statusHistory = FirebaseFirestore.instance.collection('statusHistory');
  final ticketHistory = FirebaseFirestore.instance.collection('ticketHistory');

  signUp(Map<String,dynamic> v) async {
    try{
      if(!await signUpCheck(v['phone'])){
        Navigator.pop(Get.context!);
        Get.dialog(
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // 원하는 Border Radius 설정
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 16),
            actionsPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            contentPadding: EdgeInsets.only(left: 16,right:16,top: 40,bottom: 24),
            content: Text('이미 가입을 했어요.\n휴대폰 번호로 로그인을 해주세요.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22,height: 1.4),textAlign: TextAlign.center,),
            actions: [
              GestureDetector(
                  onTap: (){
                    Get.offAllNamed(Routes.HOME);
                  },
                  child: MainBox(text: '확인', color: mainColor, textColor: Colors.white)
              )
            ],
          ),
        );
        return false;
      }
      DocumentReference docRef = await userCollection.add(v);
      DocumentSnapshot addedUser = await docRef.get();
      myInfo = UserData.fromJson(addedUser);
      loginState = true;
      box.write('documentId', docRef.id);
      return true;
    } catch(e){
      print('123');
      print(e);
      Navigator.pop(Get.context!);
      Get.snackbar('알림', '회원가입 실패',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      return false;
    }
  }
  editHp(hp) async{
    try{
      await userCollection.doc(myInfo.documentId).update({
        'phone': hp,
      });
      return true;
    } catch(e){
      print(e);
      return false;
    }
  }
  testLogin(id) async {
    String doc = '';
    if(id == '01096005193'){
      doc = 'wJcH7E4kyQTdE15BfXEm';
    } else if(id == '01029690622'){
      doc = 'QRh1ep3lw4zkHrvSwQtc';
    }
    DocumentSnapshot documentSnapshot = await userCollection.doc(doc).get();
    myInfo = UserData.fromJson(documentSnapshot);
    box.write('documentId', myInfo.documentId);
    loginState = true;
    return true;
  }
  login(hp) async {
    try{
      QuerySnapshot querySnapshot = await userCollection.where('phone',isEqualTo: hp).get();
      if(querySnapshot.docs.isNotEmpty){
        DocumentReference documentRef = userCollection.doc(querySnapshot.docs[0].id);
        // documentRef.update({
        //   "fcmToken":  await FirebaseMessaging.instance.getToken(),
        // });

        myInfo = UserData.fromJson(querySnapshot.docs[0]);
        box.write('documentId', myInfo.documentId);
        loginState = true;
        return true;
      } else {
        return false;
      }
    } catch(e){
      print(e);
      Get.snackbar('알림', '로그인 실패',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
      return false;
    }
  }
  autoLogin()async {
    try{
      print('a');
      DocumentSnapshot documentSnapshot = await userCollection.doc(box.read('documentId')).get();
      print('b');
      if(documentSnapshot.exists){
        DocumentReference documentRef = userCollection.doc(documentSnapshot.id);
        // documentRef.update({
        //   "fcmToken":  await FirebaseMessaging.instance.getToken(),
        // });
        myInfo = UserData.fromJson(documentSnapshot);
        box.write('documentId', myInfo.documentId);
        loginState = true;
        return true;
      } else {
        return false;
      }
    } catch(e){
      print(e);
      print(2);
      return false;
    }
  }
  signUpCheck(phone) async {
    QuerySnapshot querySnapshot = await userCollection.where('phone', isEqualTo: phone).get();
    if(querySnapshot.docs.isNotEmpty){
      return false;
    } else {
      return true;
    }
  }
  setPaymentCard(String documentId) async {
    try {
      await userCollection.doc(myInfo.documentId).update({
        'paymentCard': documentId,
      });
      myInfo.paymentCard = documentId;
      return true;
    } catch (e) {
      print('1');
      print(e);
      return false;
    }
  }
  updateTicket(Ticket afterTicket, {Ticket? beforeTicket}) async {
    try {
      if(beforeTicket != null){
        var statusHistoryData = {
          'createDate': DateTime.now(),
          'beforeTicket': beforeTicket.toJson(),
          'afterTicket': afterTicket.toJson(),
          'userDocumentId': myInfo.documentId,
        };
        await statusHistory.add(statusHistoryData);
      }
      else{
        var ticketHistoryData = {
          'paymentDate': DateTime.now(),
          'ticket': afterTicket.toJson(),
          'userDocumentId': myInfo.documentId,
        };
        await ticketHistory.add(ticketHistoryData);
      }
      await userCollection.doc(myInfo.documentId).update({
        'ticket': afterTicket.toJson(),
      });

      myInfo.ticket = afterTicket;
      return true;
    } catch (e) {
      print('1');
      print(e);
      return false;
    }
  }
  deleteUserData() async {
    try {
      await userCollection.doc(myInfo.documentId).delete();
      return true;
    } catch (e) {
      print('1');
      print(e);
      return false;
    }
  }
  getVisitHistory () async {
    try{
      List<VisitHistory> visitHistoryList = <VisitHistory>[];

      DateTime nowUtc = DateTime.now().toUtc();
      DateTime nowKST = nowUtc.add(Duration(hours: 9));
      DateTime startOfDayKST = DateTime(nowKST.year, nowKST.month, nowKST.day, 0, 0, 0);
      DateTime endOfDayKST = DateTime(nowKST.year, nowKST.month, nowKST.day, 23, 59, 59, 999);

      QuerySnapshot snapshot = await visitHistory
          .where('userDocumentId', isEqualTo: myInfo.documentId)
          .where('createDate', isGreaterThanOrEqualTo: startOfDayKST)
          .where('createDate', isLessThanOrEqualTo: endOfDayKST)
          .get();
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['documentId'] = doc.id;
        visitHistoryList.add(VisitHistory.fromJson(data));
      }
      return visitHistoryList;
    }catch(e){
      print(e);
      print(e);
      List<VisitHistory> visitHistoryList = <VisitHistory>[];
      return visitHistoryList;
    }
  }

  Future<void> updateOtCount(int count) async {
    try {
      await userCollection.doc(myInfo.documentId).update({
        'otCount': count,
      });
      myInfo.otCount = count;
    } catch (e) {
      print('1');
      print(e);
    }
  }
}