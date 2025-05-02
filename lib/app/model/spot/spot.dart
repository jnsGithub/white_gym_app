import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/util/converter.dart';

part 'spot.freezed.dart';
part 'spot.g.dart';

@freezed
abstract class Spot with _$Spot {
  const factory Spot({
    required final String documentId,
    required String name,
    required String address,
    required String addressDetail,
    required String descriptions,
    required List imageUrlList,
    required List devSnList,
    required double distanceBetween,
    required double lat,
    required double lon,
    @DateTimeConverter() required final DateTime createDate,
  }) = _Spot;

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);
}
