// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Receipt _$ReceiptFromJson(Map<String, dynamic> json) => _Receipt(
      receiptId: json['receiptId'] as String,
      orderId: json['orderId'] as String,
      price: (json['price'] as num).toInt(),
      taxFree: (json['taxFree'] as num).toInt(),
      cancelledPrice: (json['cancelledPrice'] as num).toInt(),
      cancelledTaxFree: (json['cancelledTaxFree'] as num).toInt(),
      orderName: json['orderName'] as String,
      companyName: json['companyName'] as String,
      sandbox: json['sandbox'] as bool,
      pg: json['pg'] as String,
      method: json['method'] as String,
      methodOriginSymbol: json['methodOriginSymbol'] as String,
      purchasedAt: DateTime.parse(json['purchasedAt'] as String),
      requestedAt: DateTime.parse(json['requestedAt'] as String),
      statusLocale: json['statusLocale'] as String,
      currency: json['currency'] as String,
      receiptUrl: json['receiptUrl'] as String,
      status: (json['status'] as num).toInt(),
      cardData: CardData.fromJson(json['cardData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReceiptToJson(_Receipt instance) => <String, dynamic>{
      'receiptId': instance.receiptId,
      'orderId': instance.orderId,
      'price': instance.price,
      'taxFree': instance.taxFree,
      'cancelledPrice': instance.cancelledPrice,
      'cancelledTaxFree': instance.cancelledTaxFree,
      'orderName': instance.orderName,
      'companyName': instance.companyName,
      'sandbox': instance.sandbox,
      'pg': instance.pg,
      'method': instance.method,
      'methodOriginSymbol': instance.methodOriginSymbol,
      'purchasedAt': instance.purchasedAt.toIso8601String(),
      'requestedAt': instance.requestedAt.toIso8601String(),
      'statusLocale': instance.statusLocale,
      'currency': instance.currency,
      'receiptUrl': instance.receiptUrl,
      'status': instance.status,
      'cardData': instance.cardData,
    };
