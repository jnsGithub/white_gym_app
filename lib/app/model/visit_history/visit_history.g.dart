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
      ticket: Ticket.fromJson(json['ticket'] as Map<String, dynamic>),
      userSportswear: json['userSportswear'] as bool,
      createDate: DateTime.parse(json['createDate'] as String),
    );

Map<String, dynamic> _$VisitHistoryToJson(_VisitHistory instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'userDocumentId': instance.userDocumentId,
      'spotDocumentId': instance.spotDocumentId,
      'spotName': instance.spotName,
      'userName': instance.userName,
      'ticket': instance.ticket,
      'userSportswear': instance.userSportswear,
      'createDate': instance.createDate.toIso8601String(),
    };
