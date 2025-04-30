// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentItem _$PaymentItemFromJson(Map<String, dynamic> json) => _PaymentItem(
      documentId: json['documentId'] as String,
      userDocumentId: json['userDocumentId'] as String,
      userPhone: json['userPhone'] as String,
      userName: json['userName'] as String,
      spotDocumentId: json['spotDocumentId'] as String,
      paymentBranch: json['paymentBranch'] as String,
      subscribe: json['subscribe'] as bool,
      sportswear: (json['sportswear'] as num).toInt(),
      locker: (json['locker'] as num).toInt(),
      ticketPrice: (json['ticketPrice'] as num).toInt(),
      crateDate: DateTime.parse(json['crateDate'] as String),
      receipt: Receipt.fromJson(json['receipt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentItemToJson(_PaymentItem instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'userDocumentId': instance.userDocumentId,
      'userPhone': instance.userPhone,
      'userName': instance.userName,
      'spotDocumentId': instance.spotDocumentId,
      'paymentBranch': instance.paymentBranch,
      'subscribe': instance.subscribe,
      'sportswear': instance.sportswear,
      'locker': instance.locker,
      'ticketPrice': instance.ticketPrice,
      'crateDate': instance.crateDate.toIso8601String(),
      'receipt': instance.receipt,
    };
