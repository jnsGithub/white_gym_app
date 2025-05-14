import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:white_gym/app/model/spotItem.dart';
import 'package:white_gym/app/model/ticket.dart';

class UserData {
  final String documentId;
  final String name;
  final String phone;
  final String birth;
  String storeDocumentId;
  String paymentCard;
  String fcmToken;
  final int gender;
  final bool pushAlarm;
  final bool smsAlarm;
  Ticket ticket;
  int otCount;
  final Timestamp createDate;


  UserData({
    required this.documentId,
    required this.name,
    required this.phone,
    required this.birth,
    required this.ticket,
    required this.storeDocumentId,
    required this.paymentCard,
    required this.fcmToken,
    required this.gender,
    required this.pushAlarm,
    required this.smsAlarm,
    required this.otCount,
    required this.createDate,
  });

  /// JSON(맵)으로부터 객체를 생성
  factory UserData.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    if(data['ticket'] == null){
      data['ticket'] = Ticket.empty();
    }
    return UserData(
      documentId: doc.id,
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      birth: data['birth'] ?? '',
      storeDocumentId: data['storeDocumentId'] ?? '',
      paymentCard: data['paymentCard'] ?? '',
      fcmToken: data['fcmToken'] ?? '',
      gender: data['gender'] ?? 0,
      pushAlarm: data['pushAlarm'] ?? false,
      smsAlarm: data['smsAlarm'] ?? false,
      ticket: Ticket.fromJson(data['ticket']),
      otCount: data['otCount'] ?? 2,
      createDate: data['createDate'] ?? Timestamp.now(),
    );
  }

  /// 객체를 JSON(맵)으로 변환
  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'name': name,
      'phone': phone,
      'birth': birth,
      'ticket': ticket,
      'storeDocumentId': storeDocumentId,
      'paymentCard': paymentCard,
      'fcmToken': fcmToken,
      'gender': gender,
      'pushAlarm': pushAlarm,
      'smsAlarm': smsAlarm,
      'otCount': otCount,
      'createDate': createDate,
    };
  }

  /// 수정 가능한 copyWith 메서드 (옵션)
  UserData copyWith({
    String? documentId,
    String? name,
    String? phone,
    String? birth,
    Ticket? ticket,
    String? storeDocumentId,
    String? paymentCard,
    String? fcmToken,
    int? gender,
    bool? pushAlarm,
    bool? smsAlarm,
    int? otCount,
    Timestamp? createDate,
  }) {
    return UserData(
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      birth: birth ?? this.birth,
      ticket: ticket ?? this.ticket.copyWith(),
      storeDocumentId: storeDocumentId ?? this.storeDocumentId,
      paymentCard: paymentCard ?? this.paymentCard,
      fcmToken: fcmToken ?? this.fcmToken,
      gender: gender ?? this.gender,
      pushAlarm: pushAlarm ?? this.pushAlarm,
      smsAlarm: smsAlarm ?? this.smsAlarm,
      otCount: otCount ?? this.otCount,
      createDate: createDate ?? this.createDate,
    );
  }

  @override
  String toString() {
    return 'UserInfo(documentId: $documentId, name: $name, phone: $phone, birth: $birth, ticket: $ticket,paymentCard:$paymentCard, gender: $gender, pushAlarm: $pushAlarm, smsAlarm: $smsAlarm, otCount: $otCount, createDate: $createDate)';
  }
}
