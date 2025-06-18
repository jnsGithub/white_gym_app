// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Review {
  String get documentId;
  String get userDocumentId;
  String get userName;
  String get programName;
  String get trainerName;
  String get trainerDocumentId;
  String get content;
  @DateTimeConverter()
  DateTime get createDate;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewCopyWith<Review> get copyWith =>
      _$ReviewCopyWithImpl<Review>(this as Review, _$identity);

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Review &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.userDocumentId, userDocumentId) ||
                other.userDocumentId == userDocumentId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.programName, programName) ||
                other.programName == programName) &&
            (identical(other.trainerName, trainerName) ||
                other.trainerName == trainerName) &&
            (identical(other.trainerDocumentId, trainerDocumentId) ||
                other.trainerDocumentId == trainerDocumentId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentId,
      userDocumentId,
      userName,
      programName,
      trainerName,
      trainerDocumentId,
      content,
      createDate);

  @override
  String toString() {
    return 'Review(documentId: $documentId, userDocumentId: $userDocumentId, userName: $userName, programName: $programName, trainerName: $trainerName, trainerDocumentId: $trainerDocumentId, content: $content, createDate: $createDate)';
  }
}

/// @nodoc
abstract mixin class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) _then) =
      _$ReviewCopyWithImpl;
  @useResult
  $Res call(
      {String documentId,
      String userDocumentId,
      String userName,
      String programName,
      String trainerName,
      String trainerDocumentId,
      String content,
      @DateTimeConverter() DateTime createDate});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res> implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._self, this._then);

  final Review _self;
  final $Res Function(Review) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? userDocumentId = null,
    Object? userName = null,
    Object? programName = null,
    Object? trainerName = null,
    Object? trainerDocumentId = null,
    Object? content = null,
    Object? createDate = null,
  }) {
    return _then(_self.copyWith(
      documentId: null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      userDocumentId: null == userDocumentId
          ? _self.userDocumentId
          : userDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      programName: null == programName
          ? _self.programName
          : programName // ignore: cast_nullable_to_non_nullable
              as String,
      trainerName: null == trainerName
          ? _self.trainerName
          : trainerName // ignore: cast_nullable_to_non_nullable
              as String,
      trainerDocumentId: null == trainerDocumentId
          ? _self.trainerDocumentId
          : trainerDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Review implements Review {
  const _Review(
      {required this.documentId,
      required this.userDocumentId,
      required this.userName,
      required this.programName,
      required this.trainerName,
      required this.trainerDocumentId,
      required this.content,
      @DateTimeConverter() required this.createDate});
  factory _Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  @override
  final String documentId;
  @override
  final String userDocumentId;
  @override
  final String userName;
  @override
  final String programName;
  @override
  final String trainerName;
  @override
  final String trainerDocumentId;
  @override
  final String content;
  @override
  @DateTimeConverter()
  final DateTime createDate;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewCopyWith<_Review> get copyWith =>
      __$ReviewCopyWithImpl<_Review>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Review &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.userDocumentId, userDocumentId) ||
                other.userDocumentId == userDocumentId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.programName, programName) ||
                other.programName == programName) &&
            (identical(other.trainerName, trainerName) ||
                other.trainerName == trainerName) &&
            (identical(other.trainerDocumentId, trainerDocumentId) ||
                other.trainerDocumentId == trainerDocumentId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentId,
      userDocumentId,
      userName,
      programName,
      trainerName,
      trainerDocumentId,
      content,
      createDate);

  @override
  String toString() {
    return 'Review(documentId: $documentId, userDocumentId: $userDocumentId, userName: $userName, programName: $programName, trainerName: $trainerName, trainerDocumentId: $trainerDocumentId, content: $content, createDate: $createDate)';
  }
}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) =
      __$ReviewCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String documentId,
      String userDocumentId,
      String userName,
      String programName,
      String trainerName,
      String trainerDocumentId,
      String content,
      @DateTimeConverter() DateTime createDate});
}

/// @nodoc
class __$ReviewCopyWithImpl<$Res> implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documentId = null,
    Object? userDocumentId = null,
    Object? userName = null,
    Object? programName = null,
    Object? trainerName = null,
    Object? trainerDocumentId = null,
    Object? content = null,
    Object? createDate = null,
  }) {
    return _then(_Review(
      documentId: null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      userDocumentId: null == userDocumentId
          ? _self.userDocumentId
          : userDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      programName: null == programName
          ? _self.programName
          : programName // ignore: cast_nullable_to_non_nullable
              as String,
      trainerName: null == trainerName
          ? _self.trainerName
          : trainerName // ignore: cast_nullable_to_non_nullable
              as String,
      trainerDocumentId: null == trainerDocumentId
          ? _self.trainerDocumentId
          : trainerDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
