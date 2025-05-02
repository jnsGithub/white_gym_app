import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:white_gym/app/data/util/converter.dart';
import 'package:white_gym/app/model/card_data/card_data.dart';

part 'receipt.freezed.dart';
part 'receipt.g.dart';

@freezed
abstract class Receipt with _$Receipt {
  const factory Receipt({
    required final String receiptId,
    required final String orderId,
    required final int price,
    required final int taxFree,
    required final int cancelledPrice,
    required final int cancelledTaxFree,
    required final String orderName,
    required final String companyName,
    required final bool sandbox,
    required final String pg,
    required final String method,
    required final String methodOriginSymbol,
    @DateTimeConverter() required final DateTime purchasedAt,
    @DateTimeConverter() required final DateTime requestedAt,
    required final String statusLocale,
    required final String currency,
    required final String receiptUrl,
    required final int status,
    @CardDataConverter() required final CardData cardData,
  }) = _Receipt;

  factory Receipt.fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);
}

class CardDataConverter implements ModelConverter<CardData> {
  const CardDataConverter();

  @override
  CardData fromJson(Map<String, dynamic> json) {
    return CardData.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CardData object) => object.toJson();
}

