import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../ticket/ticket.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required final String documentId,
    required final String name,
    required final String phone,
    required final String birth,
    required String storeDocumentId,
    required String paymentCard,
    required String fcmToken,
    required final int gender,
    required final bool pushAlarm,
    required final bool smsAlarm,
    required Ticket ticket,
    required final DateTime createDate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}