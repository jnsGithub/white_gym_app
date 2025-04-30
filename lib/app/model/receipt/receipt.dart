import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    required final DateTime purchasedAt,
    required final DateTime requestedAt,
    required final String statusLocale,
    required final String currency,
    required final String receiptUrl,
    required final int status,
    required final CardData cardData,
  }) = _Receipt;

  factory Receipt.fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);

}

