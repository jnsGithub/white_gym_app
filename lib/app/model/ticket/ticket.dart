import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:white_gym/app/data/util/converter.dart';

import '../spot_item/spot_item.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
abstract class Ticket with _$Ticket {
  const factory Ticket({
    required final String documentId,
    required final String userDocumentId,
    required final String spotDocumentId,
    required final String paymentBranch,
    required final int admission,
    required final int lockerNum,
    required int pause,
    required final bool locker,
    required final bool sportswear,
    required bool status,
    required final bool subscribe,
    required final bool passTicket,
    @DateTimeListConverter() required List<DateTime> pauseStartDate,
    @DateTimeListConverter() required List<DateTime> pauseEndDate,
    @DateTimeConverter() required DateTime endDate,
    @DateTimeConverter() required final DateTime createDate,
    @SpotItemConverter() required final SpotItem spotItem,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  factory Ticket.empty() {
    return Ticket(
      documentId: '',
      userDocumentId: '',
      spotDocumentId: '',
      paymentBranch: '',
      admission: 0,
      lockerNum: 0,
      pause: 0,
      locker: false,
      sportswear: false,
      status: false,
      subscribe: false,
      passTicket: false,
      pauseStartDate: [],
      endDate: DateTime(1990, 12, 31),
      pauseEndDate: [],
      createDate: DateTime.now(),
      spotItem: SpotItem.empty(),
    );
  }
}

class SpotItemConverter implements ModelConverter<SpotItem> {
  const SpotItemConverter();

  @override
  SpotItem fromJson(Map<String, dynamic> json) {
    return SpotItem.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(SpotItem object) => object.toJson();
}