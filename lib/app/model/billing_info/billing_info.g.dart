// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillingInfo _$BillingInfoFromJson(Map<String, dynamic> json) => _BillingInfo(
      billingKey: json['billingKey'] as String,
      documentId: json['documentId'] as String,
      cardCompany: json['cardCompany'] as String,
      cardNo: json['cardNo'] as String,
      createDate: DateTime.parse(json['createDate'] as String),
      userDocumentId: json['userDocumentId'] as String,
      cardCompanyCode: json['cardCompanyCode'] as String,
    );

Map<String, dynamic> _$BillingInfoToJson(_BillingInfo instance) =>
    <String, dynamic>{
      'billingKey': instance.billingKey,
      'documentId': instance.documentId,
      'cardCompany': instance.cardCompany,
      'cardNo': instance.cardNo,
      'createDate': instance.createDate.toIso8601String(),
      'userDocumentId': instance.userDocumentId,
      'cardCompanyCode': instance.cardCompanyCode,
    };
