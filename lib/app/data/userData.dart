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
import 'package:intl/intl.dart';
import 'package:white_gym/app/model/staff.dart';
import 'package:white_gym/app/model/visitHistory.dart';
import '../../component/main_box.dart';
import '../../global.dart';
import '../model/ptItem.dart';
import '../model/ptTicket.dart';
import '../model/review/review.dart';
import '../model/ticket.dart';
import '../model/userData.dart';
import '../routes/app_pages.dart';


class UserDataRepository {
  FirebaseStorage storage = FirebaseStorage.instance;

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
        documentRef.update({
          "fcmToken":  await FirebaseMessaging.instance.getToken(),
        });
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
      DocumentSnapshot documentSnapshot = await userCollection.doc(box.read('documentId')).get();
      if(documentSnapshot.exists){
        DocumentReference documentRef = userCollection.doc(documentSnapshot.id);
        documentRef.update({
          "fcmToken":  await FirebaseMessaging.instance.getToken(),
        });
        myInfo = UserData.fromJson(documentSnapshot);
        box.write('documentId', myInfo.documentId);
        loginState = true;
        return true;
      } else {
        return false;
      }
    } catch(e){
      print(e);
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
  updatePtTicket(PtTicket ptTicket) async {
    try {
      await userCollection.doc(myInfo.documentId).update({
        'ptTicket': ptTicket.toJson(),
      });
      myInfo.ptTicket = ptTicket;
      return true;
    } catch (e) {
      print(e);
      return false;
    }

  }
  getPtTicketHistory() async {
    try {
      List ptTicketList = [];
      QuerySnapshot querySnapshot = await ptTicketHistory
          .where('userDocumentId', isEqualTo: myInfo.documentId)
          .orderBy('paymentDate', descending: true)
          .get();
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        data['documentId'] = document.id;
        DocumentSnapshot documentSnapshot = await staffCollection.doc(data['ptTicket']['trainerDocumentId']).get();
        if (documentSnapshot.exists) {
          data['profile'] = Staff.fromJson(documentSnapshot).profileImageUrl;
        } else {
          data['profile'] = 'https://firebasestorage.googleapis.com/v0/b/white-gym.firebasestorage.app/o/basic_profile_icon.png?alt=media&token=db9600cc-8176-4571-80a2-ed5d8e75c0e0';
        }
        ptTicketList.add(data);
      }
      DocumentSnapshot documentSnapshot = await staffCollection.doc(myInfo.ptTicket.trainerDocumentId).get();
      if (documentSnapshot.exists) {
        ptTicketList.add(Staff.fromJson(documentSnapshot).profileImageUrl);
      } else {
        ptTicketList.add('https://firebasestorage.googleapis.com/v0/b/white-gym.firebasestorage.app/o/basic_profile_icon.png?alt=media&token=db9600cc-8176-4571-80a2-ed5d8e75c0e0');
      }
      return ptTicketList;
    } catch(e){
      print('PT 티켓 히스토리 가져올때 걸림 : ${e}');
      List ptTicketList = [];
      return ptTicketList;
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
      List<VisitHistory> visitHistoryList = <VisitHistory>[];
      return visitHistoryList;
    }
  }
  Future<List<Staff>> getTR(spotId) async {
    try{
      List<Staff> item = await staffCollection.where('spotIdList', arrayContains: spotId).where('position',isEqualTo: '트레이너').get().then((value) {
        List<Staff> staffList = value.docs.map((doc) => Staff.fromJson(doc)).toList();
        staffList.sort((a, b) => a.name.compareTo(b.name));
        return staffList;
      });
      item.removeWhere((element) => element.imageList.isEmpty);
      item.shuffle();
      return item;
    } catch(e){
      print(e);
      List<Staff> a = <Staff>[];
      return a; 
    }
  }
  getPtGroupList(id) async {
    try {
      final snapshot = await staffCollection.doc(id).collection('pt_group').get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // 문서 ID 추가
        return data;
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
  getPtItem(id,groupId) async {
    final snapshot = await staffCollection.doc(id).collection('pt_item').where('ptGroupId', isEqualTo: groupId).get();
    return snapshot.docs.map((doc) => PtItem.fromJson(doc)).toList();
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
  Future<List<Review>> getReview(String documentId) async {
    try {
      List<Review> reviewList = [];
      final snapshot = await staffCollection.doc(documentId).collection('review').get();
      for (var doc in snapshot.docs) {
        final data = doc.data();
        data['documentId'] = doc.id; // 문서 ID 추가
        reviewList.add(Review.fromJson(data));
      }
      return reviewList;
    } catch (e) {
      print(e);
      return [];
    }
  }
  addRecord (List selectedParts,visits,selectedDay) async {
    try{
      await recordCollection.doc(DateFormat('yyyyMMdd').format(selectedDay)).set({
        'createDate': DateTime.now(),
        'trainingPart':selectedParts,
        'visits':visits,
      });
      return true;
    } catch (e){
      print('addRecord error: $e');
      return false;
    }
  }
  getRecord(DateTime date) async {
    try{
      String dateId = DateFormat('yyyyMMdd').format(date);
      DocumentSnapshot doc = await recordCollection.doc(dateId).get();
      if(!doc.exists) {
        return null; // 문서가 존재하지 않으면 null 반환
      }
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['documentId'] = doc.id; // 문서 ID 추가
      return data;
    } catch (e) {
      print('getRecord error: $e');
      return null;
    }



  }
}