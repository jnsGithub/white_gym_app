import 'package:cloud_firestore/cloud_firestore.dart';

class BillingInfo {
  final String billingKey;
  final String documentId;
  final String cardCompany;
  final String cardNo;
  final DateTime createDate;
  final String userDocumentId;
  final String cardCompanyCode;

  BillingInfo({
    required this.billingKey,
    required this.documentId,
    required this.cardCompany,
    required this.cardNo,
    required this.createDate,
    required this.userDocumentId,
    required this.cardCompanyCode,
  });

  // JSON 데이터를 BillingInfo 객체로 변환하는 factory 메서드
  factory BillingInfo.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BillingInfo(
      billingKey: data['billingKey'],
      documentId: doc.id,
      cardCompany: data['card_company'],
      cardNo: data['card_no'],
      createDate:data['createDate'].toDate(), // 날짜 형식에 맞게 파싱
      userDocumentId: data['userDocumentId'],
      cardCompanyCode: data['card_company_code'],
    );
  }

  // BillingInfo 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'billingKey': billingKey,
      'documentId': documentId,
      'card_company': cardCompany,
      'card_no': cardNo,
      'createDate': createDate.toIso8601String(),
      'userDocumentId': userDocumentId,
      'card_company_code': cardCompanyCode,
    };
  }
}