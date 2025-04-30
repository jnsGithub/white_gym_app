import 'package:freezed_annotation/freezed_annotation.dart';

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
    required final Ticket ticket,
    required final bool userSportswear,
    required final DateTime createDate,
  }) = _VisitHistory;

  factory VisitHistory.fromJson(Map<String, dynamic> json) => _$VisitHistoryFromJson(json);
}