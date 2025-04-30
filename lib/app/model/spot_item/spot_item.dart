import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot_item.freezed.dart';
part 'spot_item.g.dart';

@freezed
abstract class SpotItem with _$SpotItem {
  const factory SpotItem({
    required final String documentId,
    required String name,
    required String descriptions1,
    required String descriptions2,
    required final String spotDocumentId,
    required bool isSubscribe,
    required bool passTicket,
    required bool discountCheck,
    required int index,
    required int admission,
    required int locker,
    required int monthly,
    required int pause,
    required int beforeDiscount,
    required int price,
    required int sportswear,
    required final DateTime createDate,
  }) = _SpotItem;

  factory SpotItem.fromJson(Map<String, dynamic> json) => _$SpotItemFromJson(json);

  factory SpotItem.empty() {
    return SpotItem(
      documentId: '',
      name: '',
      descriptions1: '',
      descriptions2: '',
      spotDocumentId: '',
      isSubscribe: false,
      passTicket: false,
      discountCheck: false,
      index: 0,
      admission: 0,
      locker: 0,
      monthly: 0,
      pause: 0,
      beforeDiscount: 0,
      price: 0,
      sportswear: 0,
      createDate: DateTime.now(),
    );
  }
}