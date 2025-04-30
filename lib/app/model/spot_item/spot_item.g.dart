// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpotItem _$SpotItemFromJson(Map<String, dynamic> json) => _SpotItem(
      documentId: json['documentId'] as String,
      name: json['name'] as String,
      descriptions1: json['descriptions1'] as String,
      descriptions2: json['descriptions2'] as String,
      spotDocumentId: json['spotDocumentId'] as String,
      isSubscribe: json['isSubscribe'] as bool,
      passTicket: json['passTicket'] as bool,
      discountCheck: json['discountCheck'] as bool,
      index: (json['index'] as num).toInt(),
      admission: (json['admission'] as num).toInt(),
      locker: (json['locker'] as num).toInt(),
      monthly: (json['monthly'] as num).toInt(),
      pause: (json['pause'] as num).toInt(),
      beforeDiscount: (json['beforeDiscount'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      sportswear: (json['sportswear'] as num).toInt(),
      createDate: DateTime.parse(json['createDate'] as String),
    );

Map<String, dynamic> _$SpotItemToJson(_SpotItem instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
      'descriptions1': instance.descriptions1,
      'descriptions2': instance.descriptions2,
      'spotDocumentId': instance.spotDocumentId,
      'isSubscribe': instance.isSubscribe,
      'passTicket': instance.passTicket,
      'discountCheck': instance.discountCheck,
      'index': instance.index,
      'admission': instance.admission,
      'locker': instance.locker,
      'monthly': instance.monthly,
      'pause': instance.pause,
      'beforeDiscount': instance.beforeDiscount,
      'price': instance.price,
      'sportswear': instance.sportswear,
      'createDate': instance.createDate.toIso8601String(),
    };
