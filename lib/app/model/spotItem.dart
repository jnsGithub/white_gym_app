import 'package:cloud_firestore/cloud_firestore.dart';

class SpotItem {
  final String documentId;
  String name;
  String descriptions1;
  String descriptions2;
  final String spotDocumentId;
  bool isSubscribe;
  bool passTicket;
  bool discountCheck;
  int index;
  int admission;
  int locker;
  // int? monthly;
  int daily;
  int pause;
  int beforeDiscount;
  int price;
  int sportswear;
  final DateTime createDate;

  SpotItem({
    required this.documentId,
    required this.admission,
    required this.descriptions1,
    required this.descriptions2,
    required this.isSubscribe,
    required this.discountCheck,
    required this.index,
    required this.locker,
    // required this.monthly,
    required this.daily,
    required this.name,
    required this.passTicket,
    required this.pause,
    required this.beforeDiscount,
    required this.price,
    required this.sportswear,
    required this.spotDocumentId,
    required this.createDate,
  });

  // JSON to Model
  factory SpotItem.fromJson(Map<String, dynamic> json) {
    Timestamp createDate = json['createDate'];
    return SpotItem(
      documentId: json['documentId'] as String,
      admission: json['admission'] as int,
      descriptions1: json['descriptions1'] as String,
      descriptions2: json['descriptions2'] as String,
      isSubscribe: json['isSubscribe'] as bool,
      discountCheck: json['discountCheck'] as bool,
      index: json['index'] as int,
      locker: json['locker'] as int,
      // monthly: json['monthly'] as int,
      daily: json['daily'] ?? (json['monthly'] as int) * 30,
      name: json['name'] as String,
      passTicket: json['passTicket'] as bool,
      pause: json['pause'] as int,
      price: json['price'] as int,
      beforeDiscount: json['beforeDiscount'] as int,
      sportswear: json['sportswear'] as int,
      spotDocumentId: json['spotDocumentId'] as String,
      createDate: createDate.toDate(),
    );
  }

  // Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'admission': admission,
      'descriptions1': descriptions1,
      'descriptions2': descriptions2,
      'isSubscribe': isSubscribe,
      'discountCheck': discountCheck,
      'index': index,
      'locker': locker,
      // 'monthly': monthly,
      'daily': daily,
      'name': name,
      'passTicket': passTicket,
      'pause': pause,
      'price': price,
      'beforeDiscount': beforeDiscount,
      'sportswear': sportswear,
      'spotDocumentId': spotDocumentId,
      'createDate': createDate,
    };
  }
  factory SpotItem.empty() {
    return SpotItem(
      documentId: '',
      name: '',
      descriptions1: '',
      descriptions2: '',
      spotDocumentId: '',
      isSubscribe: false,
      passTicket: false,
      discountCheck: false,
      index: 0,
      admission: 0,
      locker: 0,
      // monthly: 0,
      daily: 0,
      pause: 0,
      beforeDiscount: 0,
      price: 0,
      sportswear: 0,
      createDate: DateTime.now(),
    );
  }

  SpotItem copyWith({
    String? documentId,
    int? admission,
    String? descriptions1,
    String? descriptions2,
    bool? isSubscribe,
    bool? passTicket,
    bool? discountCheck,
    int? index,
    int? locker,
    // int? monthly,
    int? daily,
    String? name,
    int? pause,
    int? beforeDiscount,
    int? price,
    int? sportswear,
    String? spotDocumentId,
    DateTime? createDate,
  }) {
    return SpotItem(
      documentId: documentId ?? this.documentId,
      admission: admission ?? this.admission,
      descriptions1: descriptions1 ?? this.descriptions1,
      descriptions2: descriptions2 ?? this.descriptions2,
      isSubscribe: isSubscribe ?? this.isSubscribe,
      discountCheck: discountCheck ?? this.discountCheck,
      index: index ?? this.index,
      locker: locker ?? this.locker,
      // monthly: monthly ?? this.monthly,
      name: name ?? this.name,
      passTicket: passTicket ?? this.passTicket,
      pause: pause ?? this.pause,
      daily: daily ?? this.daily,
      beforeDiscount: beforeDiscount ?? this.beforeDiscount,
      price: price ?? this.price,
      sportswear: sportswear ?? this.sportswear,
      spotDocumentId: spotDocumentId ?? this.spotDocumentId,
      createDate: createDate ?? this.createDate,
    );
  }
}
