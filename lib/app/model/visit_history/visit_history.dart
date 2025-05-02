import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:white_gym/app/data/util/converter.dart';

import '../ticket/ticket.dart';

part 'visit_history.freezed.dart';
part 'visit_history.g.dart';

@freezed
abstract class VisitHistory with _$VisitHistory {
  const factory VisitHistory({
    required final String documentId,
    required final String userDocumentId,
    required final String spotDocumentId,
    required final String spotName,
    required final String userName,
    @TicketConverter() required final Ticket ticket,
    required final bool userSportswear,
    @DateTimeConverter() required final DateTime createDate,
  }) = _VisitHistory;

  factory VisitHistory.fromJson(Map<String, dynamic> json) => _$VisitHistoryFromJson(json);
}

class TicketConverter extends ModelConverter<Ticket> {
  const TicketConverter();

  @override
  Ticket fromJson(Map<String, dynamic> json) {
    return Ticket.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Ticket object) => object.toJson();
}