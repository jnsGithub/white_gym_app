// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardData _$CardDataFromJson(Map<String, dynamic> json) => _CardData(
      tid: json['tid'] as String,
      cardApproveNo: json['cardApproveNo'] as String,
      cardNo: json['cardNo'] as String,
      cardQuota: json['cardQuota'] as String,
      cardCompanyCode: json['cardCompanyCode'] as String,
      cardCompany: json['cardCompany'] as String,
      cardType: json['cardType'] as String,
    );

Map<String, dynamic> _$CardDataToJson(_CardData instance) => <String, dynamic>{
      'tid': instance.tid,
      'cardApproveNo': instance.cardApproveNo,
      'cardNo': instance.cardNo,
      'cardQuota': instance.cardQuota,
      'cardCompanyCode': instance.cardCompanyCode,
      'cardCompany': instance.cardCompany,
      'cardType': instance.cardType,
    };
