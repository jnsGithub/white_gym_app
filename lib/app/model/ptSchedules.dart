import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:white_gym/app/model/userData.dart';

class PtSchedule {
  final String documentId;
  final bool isOT;
  final int? wishTimeValue;
  final String? trainingType;
  final List<String>? trainingPart;
  final List<String>? attendanceTimeList;
  final List<String>? exercisePurpose; // 유저 데이터 추가
  final int status;
  final DateTime createDate;
  final DateTime? reservationDate;
  final DateTime? noShowConfirmDate;
  final String? noShowConfirmMangerName;
  final String? noShowConfirmManagerId;
  final bool isNoShowConfirmed;
  final String notice;
  final String comment;


  // 추가 필드
  final String trainerName;
  final String trainerDocumentId;
  final String ptTicketId;

  PtSchedule({
    required this.documentId,
    this.isOT = false,
    required this.wishTimeValue,
    required this.trainingType,
    this.trainingPart,
    required this.attendanceTimeList,
    this.exercisePurpose,
    required this.status,
    required this.createDate,
    this.reservationDate,
    this.noShowConfirmDate,
    required this.noShowConfirmMangerName,
    required this.noShowConfirmManagerId,
    this.isNoShowConfirmed = false,
    required this.notice,
    required this.comment,
    required this.trainerName,
    required this.trainerDocumentId,
    required this.ptTicketId,
  });

  factory PtSchedule.fromMap(Map<String, dynamic> map) {
    return PtSchedule(
      documentId: map['documentId'],
      isOT: map['isOT'] ?? false,
      wishTimeValue: map['wishTimeValue'],
      trainingType: map['trainingType'],
      trainingPart: List<String>.from(map['trainingPart'] ?? []),
      attendanceTimeList: List<String>.from(map['attendanceTimeList'] ?? []),
      exercisePurpose: List<String>.from(map['exercisePurpose'] ?? []),
      status: map['status'],
      createDate: (map['createDate'] as Timestamp).toDate(),
      reservationDate: map['reservationDate'] != null
          ? (map['reservationDate'] as Timestamp).toDate()
          : null,
      noShowConfirmDate: map['noShowConfirmDate'] != null
          ? (map['noShowConfirmDate'] as Timestamp).toDate()
          : null,
      noShowConfirmMangerName: map['noShowConfirmMangerName'],
      noShowConfirmManagerId: map['noShowConfirmManagerId'],
      isNoShowConfirmed: map['isNoShowConfirmed'] ?? false,
      notice: map['notice'] ?? '',
      comment: map['comment'] ?? '',
      trainerName: map['trainerName'] ?? '',
      trainerDocumentId: map['trainerDocumentId'] ?? '',
      ptTicketId: map['ptTicketId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'documentId': documentId,
      'isOT': isOT,
      'wishTimeValue': wishTimeValue,
      'trainingType': trainingType,
      'trainingPart': trainingPart,
      'attendanceTimeList': attendanceTimeList,
      'status': status,
      'createDate': Timestamp.fromDate(createDate),
      'reservationDate':
      reservationDate != null ? Timestamp.fromDate(reservationDate!) : null,
      'noShowConfirmDate': noShowConfirmDate != null
          ? Timestamp.fromDate(noShowConfirmDate!)
          : null,
      'noShowConfirmMangerName': noShowConfirmMangerName,
      'noShowConfirmManagerId': noShowConfirmManagerId,
      'isNoShowConfirmed': isNoShowConfirmed,
      'notice': notice,
      'comment': comment,
      'trainerName': trainerName,
      'trainerDocumentId': trainerDocumentId,
      'ptTicketId': ptTicketId,
    };
  }
}
