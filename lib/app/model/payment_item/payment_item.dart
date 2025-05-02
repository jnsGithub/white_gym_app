import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:white_gym/app/data/util/converter.dart';

import '../receipt/receipt.dart';

part 'payment_item.freezed.dart';
part 'payment_item.g.dart';

@freezed
abstract class PaymentItem with _$PaymentItem {
  const factory PaymentItem({
    required final String documentId,
    required final String userDocumentId,
    required final String userPhone,
    required final String userName,
    required final String spotDocumentId,
    required final String paymentBranch,
    required final bool subscribe,
    required final int sportswear,
    required final int locker,
    required final int ticketPrice,
    @DateTimeConverter() required final DateTime crateDate,
    @ReceiptConverter() required Receipt receipt,

  }) = _PaymentItem;

  factory PaymentItem.fromJson(Map<String, dynamic> json) => _$PaymentItemFromJson(json);
}

class ReceiptConverter extends ModelConverter<Receipt> {
  const ReceiptConverter();

  @override
  Receipt fromJson(Map<String, dynamic> json) {
    return Receipt.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Receipt object) => object.toJson();
}
