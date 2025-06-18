import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:white_gym/app/model/ptItem.dart';

class PtTicket {
  final String userDocumentId;
  final String spotDocumentId;
  final String paymentBranch;
  final String paymentDocumentId;
  final String trainerDocumentId;
  final String trainerName;
  final String comment;
  final int admission;
  int currentAdmission;
  List exercisePurpose;
  DateTime endDate;
  final DateTime createDate;
  final PtItem ptItem;

  PtTicket({
    required this.userDocumentId,
    required this.spotDocumentId,
    required this.paymentBranch,
    required this.paymentDocumentId,
    required this.trainerDocumentId,
    required this.trainerName,
    this.comment = '',
    required this.admission,
    required this.currentAdmission,
    required this.exercisePurpose,
    required this.endDate,
    required this.createDate,
    required this.ptItem,
  });

  factory PtTicket.empty() {
    return PtTicket(
      userDocumentId: '',
      spotDocumentId: '',
      paymentBranch: '',
      paymentDocumentId: '',
      trainerDocumentId: '',
      trainerName: '',
      comment: '',
      admission: 0,
      currentAdmission: 0,
      exercisePurpose: [],
      endDate: DateTime(1990, 1, 1),
      createDate: DateTime.now(),
      ptItem: PtItem.empty(),
    );
  }

  factory PtTicket.fromJson(Map<String, dynamic> json) {
    return PtTicket(
      userDocumentId: json['userDocumentId'] ?? '',
      spotDocumentId: json['spotDocumentId'] ?? '',
      paymentBranch: json['paymentBranch'] ?? '',
      paymentDocumentId: json['paymentDocumentId'] ?? '',
      trainerDocumentId: json['trainerDocumentId'] ?? '',
      trainerName: json['trainerName'] ?? '',
      comment: json['comment'] ?? '',
      admission: json['admission'] ?? 0,
      currentAdmission: json['currentAdmission'] ?? 0,
      exercisePurpose: json['exercisePurpose'] ?? [],
      endDate: (json['endDate'] as Timestamp).toDate(),
      createDate: (json['createDate'] as Timestamp).toDate(),
      ptItem: PtItem.fromJson2(json['ptItem'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userDocumentId': userDocumentId,
      'spotDocumentId': spotDocumentId,
      'paymentBranch': paymentBranch,
      'paymentDocumentId': paymentDocumentId,
      'trainerDocumentId': trainerDocumentId,
      'trainerName': trainerName,
      'comment': comment,
      'admission': admission,
      'currentAdmission': currentAdmission,
      'exercisePurpose': exercisePurpose,
      'endDate': endDate,
      'createDate': createDate,
      'ptItem': ptItem.toJson(),
    };
  }
}