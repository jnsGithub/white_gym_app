import 'package:white_gym/app/model/ticket.dart';

class VisitHistory{
  final String documentId;
  final String userDocumentId;
  final String spotDocumentId;
  final String spotName;
  final String userName;
  final Ticket ticket;
  final bool userSportswear;
  final DateTime createDate;

  VisitHistory({
    required this.documentId,
    required this.spotDocumentId,
    required this.userDocumentId,
    required this.spotName,
    required this.userName,
    required this.userSportswear,
    required this.ticket,
    required this.createDate,
  });

  factory VisitHistory.fromJson(Map<String, dynamic> data) {
    final ticketData = data['ticket'];
    return VisitHistory(
      documentId: data['documentId'] as String,
      spotDocumentId: data['spotDocumentId'] as String,
      spotName: data['spotName'] as String,
      userName: data['userName'] as String,
      userDocumentId: data['userDocumentId'] as String,
      userSportswear: data['userSportswear'] as bool,
      ticket: ticketData == null
          ? Ticket.empty()
          : Ticket.fromJson(ticketData as Map<String, dynamic>),
      createDate: data['createDate'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'userDocumentId': userDocumentId,
      'spotDocumentId': spotDocumentId,
      'spotName': spotName,
      'userName': userName,
      'userSportswear': userSportswear,
      'ticket': ticket.toJson(),
      'createDate': createDate,
    };
  }

}