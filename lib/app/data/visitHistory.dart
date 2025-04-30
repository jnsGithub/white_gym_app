
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../global.dart';
import '../model/visit_history/visit_history.dart';

class VisitRepository {
  FirebaseStorage storage = FirebaseStorage.instance;
  final visitCollection = FirebaseFirestore.instance.collection('visitHistory');


  Future fetchCurrentMonthVisitHistory() async {
    // 현재 날짜를 기준으로 이번 달의 시작과 다음 달의 시작 날짜 계산
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);

    // Firestore 쿼리 작성
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('visitHistory')
        .where('userDocumentId', isEqualTo: myInfo.documentId)
        .where('createDate', isGreaterThanOrEqualTo: firstDayOfMonth)
        .where('createDate', isLessThan: firstDayOfNextMonth)
        .get();

    // 쿼리 결과를 VisitHistory 객체 리스트로 변환
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['documentId'] = doc.id;
      return VisitHistory.fromJson(data);
    }).toList();
  }
}