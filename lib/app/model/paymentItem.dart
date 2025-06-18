import 'package:white_gym/app/model/receipt.dart';

class PaymentItem {
  final String documentId;
  final String userDocumentId;
  final String userPhone;
  final String userName;
  final String spotDocumentId;
  final String paymentBranch;
  final bool subscribe;
  final bool newPayment;
  final int sportswear;
  final int locker;
  final int ticketPrice;
  final DateTime crateDate;
  final Receipt receipt;
  /// PT 결제
  final String paymentType;
  final String trainerName;
  final String trainerDocumentId;
  final String ptItemName;
  final String ptItemDocumentId;
  final int ptItemAdmission;



  PaymentItem({
    required this.documentId,
    required this.userDocumentId,
    required this.userPhone,
    required this.userName,
    required this.spotDocumentId,
    required this.paymentBranch,
    required this.subscribe,
    required this.newPayment,
    required this.sportswear,
    required this.locker,
    required this.ticketPrice,
    required this.crateDate,
    required this.receipt,
    ///트레이너
    this.paymentType = '',
    this.trainerName = '',
    this.trainerDocumentId = '',
    this.ptItemName = '',
    this.ptItemDocumentId = '',
    this.ptItemAdmission = 0,
  });

  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return PaymentItem(
      documentId: json['documentId'] as String,
      userDocumentId: json['userDocumentId'] as String,
      userPhone: json['userPhone'] as String,
      userName: json['userName'] as String,
      spotDocumentId: json['spotDocumentId'] as String,
      paymentBranch: json['paymentBranch'] as String,
      subscribe: json['subscribe'] as bool,
      newPayment: json['newPayment'] as bool? ?? false,
      sportswear: json['sportswear'] as int,
      locker: json['locker'] as int,
      ticketPrice: json['ticketPrice'] as int,
      crateDate: json['crateDate'].toDate(),
      receipt: Receipt.fromJson(json['receipt'] as Map<String, dynamic>),
      // PT 결제
      paymentType: json['paymentType'] as String? ?? '',
      trainerName: json['trainerName'] as String? ?? '',
      trainerDocumentId: json['trainerDocumentId'] as String? ?? '',
      ptItemName: json['ptItemName'] as String? ?? '',
      ptItemDocumentId: json['ptItemDocumentId'] as String? ?? '',
      ptItemAdmission: json['ptItemAdmission'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'userDocumentId': userDocumentId,
      'userPhone': userPhone,
      'userName': userName,
      'spotDocumentId': spotDocumentId,
      'paymentBranch': paymentBranch,
      'newPayment': newPayment,
      'subscribe': subscribe,
      'sportswear': sportswear,
      'locker': locker,
      'ticketPrice': ticketPrice,
      'crateDate': crateDate,
      'receipt': receipt.toJson(),
      /// PT 결제
      'paymentType': paymentType,
      'trainerName': trainerName,
      'trainerDocumentId': trainerDocumentId,
      'ptItemName': ptItemName,
      'ptItemDocumentId': ptItemDocumentId,
      'ptItemAdmission': ptItemAdmission,
    };
  }
}
