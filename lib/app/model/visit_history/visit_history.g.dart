// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VisitHistory _$VisitHistoryFromJson(Map<String, dynamic> json) =>
    _VisitHistory(
      documentId: json['documentId'] as String,
      userDocumentId: json['userDocumentId'] as String,
      spotDocumentId: json['spotDocumentId'] as String,
      spotName: json['spotName'] as String,
      userName: json['userName'] as String,
      ticket: const TicketConverter()
          .fromJson(json['ticket'] as Map<String, dynamic>),
      userSportswear: json['userSportswear'] as bool,
      createDate:
          const DateTimeConverter().fromJson(json['createDate'] as Timestamp),
    );

Map<String, dynamic> _$VisitHistoryToJson(_VisitHistory instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'userDocumentId': instance.userDocumentId,
      'spotDocumentId': instance.spotDocumentId,
      'spotName': instance.spotName,
      'userName': instance.userName,
      'ticket': const TicketConverter().toJson(instance.ticket),
      'userSportswear': instance.userSportswear,
      'createDate': const DateTimeConverter().toJson(instance.createDate),
    };
