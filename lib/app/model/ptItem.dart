import 'package:cloud_firestore/cloud_firestore.dart';

class PtItem {
  final int admission;
  final DateTime createDate;
  final String name;
  final int price;
  final String ptGroupId;
  final int sequence;
  final String documentId; // Firestore document ID

  PtItem({
    required this.admission,
    required this.createDate,
    required this.name,
    required this.price,
    required this.ptGroupId,
    required this.sequence,
    required this.documentId,
  });

  factory PtItem.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PtItem(
      admission: data['admission'] ?? 0,
      createDate: data['createDate'].toDate(),
      name: data['name'] ?? '',
      price: data['price'] ?? 0,
      ptGroupId: data['ptGroupId'] ?? '',
      sequence: data['sequence'] ?? 0,
      documentId: doc.id,
    );
  }
  factory PtItem.fromJson2(Map<String, dynamic> data) {
    return PtItem(
      admission: data['admission'] ?? 0,
      createDate: data['createDate'].toDate(),
      name: data['name'] ?? '',
      price: data['price'] ?? 0,
      ptGroupId: data['ptGroupId'] ?? '',
      sequence: data['sequence'] ?? 0,
      documentId: data['documentId'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'admission': admission,
      'createDate': Timestamp.fromDate(createDate),
      'name': name,
      'price': price,
      'ptGroupId': ptGroupId,
      'sequence': sequence,
    };
  }

  factory PtItem.empty() {
    return PtItem(
      admission: 0,
      createDate: DateTime(1990, 1, 1),
      name: '',
      price: 0,
      ptGroupId: '',
      sequence: 0,
      documentId: '',
    );
  }
}
