import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'billing_info.freezed.dart';
part 'billing_info.g.dart';

@freezed
abstract class BillingInfo with _$BillingInfo {
  const factory BillingInfo({
    required final String billingKey,
    required final String documentId,
    required final String cardCompany,
    required final String cardNo,
    required final DateTime createDate,
    required final String userDocumentId,
    required final String cardCompanyCode,
  }) = _BillingInfo;

  factory BillingInfo.fromJson(Map<String, dynamic> json) => _$BillingInfoFromJson(json);
}
