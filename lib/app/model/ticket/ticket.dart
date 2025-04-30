import 'package:freezed_annotation/freezed_annotation.dart';

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
    required List<DateTime> pauseStartDate,
    required List<DateTime> pauseEndDate,
    required DateTime endDate,
    required final DateTime createDate,
    required final SpotItem spotItem,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}