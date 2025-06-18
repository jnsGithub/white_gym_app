import 'package:cloud_firestore/cloud_firestore.dart';

class Staff {
  final String documentId;
  final String email;
  final String name;
  List<String> spotIdList;
  String position;
  final String hp;
  final DateTime createDate;
  bool isApproved;
  ///트레이너
  String profileImageUrl;
  List imageList;
  String weekdaysTime;
  String weekendTime;
  String intro;

  Staff({
    required this.documentId,
    required this.email,
    required this.name,
    required this.spotIdList,
    required this.position,
    required this.hp,
    required this.createDate,
    required this.isApproved,
    ///트레이너
    this.imageList = const [],
    this.profileImageUrl = 'https://firebasestorage.googleapis.com/v0/b/white-gym.firebasestorage.app/o/basic_profile_icon.png?alt=media&token=db9600cc-8176-4571-80a2-ed5d8e75c0e0',
    this.weekdaysTime = '',
    this.weekendTime = '',
    this.intro = '',
  });

  factory Staff.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['documentId'] = doc.id;
    data['spotIdList'] = List<String>.from(data['spotIdList']);
    return Staff(
      documentId: data["documentId"],
      email: data["email"],
      name:data["name"],
      spotIdList:data["spotIdList"],
      position:data["position"],
      hp:data["hp"],
      createDate: (data["createDate"] as Timestamp).toDate(),
      isApproved: data["isApproved"],
      ///트레이너
      imageList: data["imageList"] ?? [],
      profileImageUrl: data["profileImageUrl"] ?? 'https://firebasestorage.googleapis.com/v0/b/white-gym.firebasestorage.app/o/basic_profile_icon.png?alt=media&token=db9600cc-8176-4571-80a2-ed5d8e75c0e0',
      weekdaysTime: data["weekdaysTime"] ?? '',
      weekendTime: data["weekendTime"] ?? '',
      intro: data["intro"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name":name,
      "spotIdList":spotIdList,
      "position":position,
      "hp":hp,
      "creatDate": createDate,
      "isApproved": isApproved,
      ///트레이너
      "imageList": imageList,
      "profileImageUrl": profileImageUrl,
      "weekdaysTime": weekdaysTime,
      "weekendTime": weekendTime,
      "intro": intro,
    };
  }
}

