import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../component/converter.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
    required String documentId,
    required String userDocumentId,
    required String userName,
    required String programName,
    required String trainerName,
    required String trainerDocumentId,
    required String content,
    @DateTimeConverter() required DateTime createDate,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  factory Review.empty() {
    return Review(
      documentId: '',
      userDocumentId: '',
      userName: '',
      programName: '',
      trainerName: '',
      trainerDocumentId: '',
      content: '',
      createDate: DateTime.now(),
    );
  }
}