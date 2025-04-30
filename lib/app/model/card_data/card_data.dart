import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'card_data.freezed.dart';
part 'card_data.g.dart';

@freezed
abstract class CardData with _$CardData {
  const factory CardData({
    required final String tid,
    required final String cardApproveNo,
    required final String cardNo,
    required final String cardQuota,
    required final String cardCompanyCode,
    required final String cardCompany,
    required final String cardType,
  }) = _CardData;

  factory CardData.fromJson(Map<String, dynamic> json) => _$CardDataFromJson(json);
}