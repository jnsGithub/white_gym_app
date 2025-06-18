// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
      documentId: json['documentId'] as String,
      userDocumentId: json['userDocumentId'] as String,
      userName: json['userName'] as String,
      programName: json['programName'] as String,
      trainerName: json['trainerName'] as String,
      trainerDocumentId: json['trainerDocumentId'] as String,
      content: json['content'] as String,
      createDate:
          const DateTimeConverter().fromJson(json['createDate'] as Timestamp),
    );

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'userDocumentId': instance.userDocumentId,
      'userName': instance.userName,
      'programName': instance.programName,
      'trainerName': instance.trainerName,
      'trainerDocumentId': instance.trainerDocumentId,
      'content': instance.content,
      'createDate': const DateTimeConverter().toJson(instance.createDate),
    };
