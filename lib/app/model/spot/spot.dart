import 'package:freezed_annotation/freezed_annotation.dart';

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
    required final DateTime createDate,
  }) = _Spot;

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);
}