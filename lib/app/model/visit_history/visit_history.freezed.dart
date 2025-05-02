// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VisitHistory {
  String get documentId;
  String get userDocumentId;
  String get spotDocumentId;
  String get spotName;
  String get userName;
  @TicketConverter()
  Ticket get ticket;
  bool get userSportswear;
  @DateTimeConverter()
  DateTime get createDate;

  /// Create a copy of VisitHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VisitHistoryCopyWith<VisitHistory> get copyWith =>
      _$VisitHistoryCopyWithImpl<VisitHistory>(
          this as VisitHistory, _$identity);

  /// Serializes this VisitHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VisitHistory &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.userDocumentId, userDocumentId) ||
                other.userDocumentId == userDocumentId) &&
            (identical(other.spotDocumentId, spotDocumentId) ||
                other.spotDocumentId == spotDocumentId) &&
            (identical(other.spotName, spotName) ||
                other.spotName == spotName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.userSportswear, userSportswear) ||
                other.userSportswear == userSportswear) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, documentId, userDocumentId,
      spotDocumentId, spotName, userName, ticket, userSportswear, createDate);

  @override
  String toString() {
    return 'VisitHistory(documentId: $documentId, userDocumentId: $userDocumentId, spotDocumentId: $spotDocumentId, spotName: $spotName, userName: $userName, ticket: $ticket, userSportswear: $userSportswear, createDate: $createDate)';
  }
}

/// @nodoc
abstract mixin class $VisitHistoryCopyWith<$Res> {
  factory $VisitHistoryCopyWith(
          VisitHistory value, $Res Function(VisitHistory) _then) =
      _$VisitHistoryCopyWithImpl;
  @useResult
  $Res call(
      {String documentId,
      String userDocumentId,
      String spotDocumentId,
      String spotName,
      String userName,
      @TicketConverter() Ticket ticket,
      bool userSportswear,
      @DateTimeConverter() DateTime createDate});

  $TicketCopyWith<$Res> get ticket;
}

/// @nodoc
class _$VisitHistoryCopyWithImpl<$Res> implements $VisitHistoryCopyWith<$Res> {
  _$VisitHistoryCopyWithImpl(this._self, this._then);

  final VisitHistory _self;
  final $Res Function(VisitHistory) _then;

  /// Create a copy of VisitHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? userDocumentId = null,
    Object? spotDocumentId = null,
    Object? spotName = null,
    Object? userName = null,
    Object? ticket = null,
    Object? userSportswear = null,
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
      spotDocumentId: null == spotDocumentId
          ? _self.spotDocumentId
          : spotDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      spotName: null == spotName
          ? _self.spotName
          : spotName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      ticket: null == ticket
          ? _self.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as Ticket,
      userSportswear: null == userSportswear
          ? _self.userSportswear
          : userSportswear // ignore: cast_nullable_to_non_nullable
              as bool,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of VisitHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketCopyWith<$Res> get ticket {
    return $TicketCopyWith<$Res>(_self.ticket, (value) {
      return _then(_self.copyWith(ticket: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _VisitHistory implements VisitHistory {
  const _VisitHistory(
      {required this.documentId,
      required this.userDocumentId,
      required this.spotDocumentId,
      required this.spotName,
      required this.userName,
      @TicketConverter() required this.ticket,
      required this.userSportswear,
      @DateTimeConverter() required this.createDate});
  factory _VisitHistory.fromJson(Map<String, dynamic> json) =>
      _$VisitHistoryFromJson(json);

  @override
  final String documentId;
  @override
  final String userDocumentId;
  @override
  final String spotDocumentId;
  @override
  final String spotName;
  @override
  final String userName;
  @override
  @TicketConverter()
  final Ticket ticket;
  @override
  final bool userSportswear;
  @override
  @DateTimeConverter()
  final DateTime createDate;

  /// Create a copy of VisitHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VisitHistoryCopyWith<_VisitHistory> get copyWith =>
      __$VisitHistoryCopyWithImpl<_VisitHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VisitHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VisitHistory &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.userDocumentId, userDocumentId) ||
                other.userDocumentId == userDocumentId) &&
            (identical(other.spotDocumentId, spotDocumentId) ||
                other.spotDocumentId == spotDocumentId) &&
            (identical(other.spotName, spotName) ||
                other.spotName == spotName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.userSportswear, userSportswear) ||
                other.userSportswear == userSportswear) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, documentId, userDocumentId,
      spotDocumentId, spotName, userName, ticket, userSportswear, createDate);

  @override
  String toString() {
    return 'VisitHistory(documentId: $documentId, userDocumentId: $userDocumentId, spotDocumentId: $spotDocumentId, spotName: $spotName, userName: $userName, ticket: $ticket, userSportswear: $userSportswear, createDate: $createDate)';
  }
}

/// @nodoc
abstract mixin class _$VisitHistoryCopyWith<$Res>
    implements $VisitHistoryCopyWith<$Res> {
  factory _$VisitHistoryCopyWith(
          _VisitHistory value, $Res Function(_VisitHistory) _then) =
      __$VisitHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String documentId,
      String userDocumentId,
      String spotDocumentId,
      String spotName,
      String userName,
      @TicketConverter() Ticket ticket,
      bool userSportswear,
      @DateTimeConverter() DateTime createDate});

  @override
  $TicketCopyWith<$Res> get ticket;
}

/// @nodoc
class __$VisitHistoryCopyWithImpl<$Res>
    implements _$VisitHistoryCopyWith<$Res> {
  __$VisitHistoryCopyWithImpl(this._self, this._then);

  final _VisitHistory _self;
  final $Res Function(_VisitHistory) _then;

  /// Create a copy of VisitHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documentId = null,
    Object? userDocumentId = null,
    Object? spotDocumentId = null,
    Object? spotName = null,
    Object? userName = null,
    Object? ticket = null,
    Object? userSportswear = null,
    Object? createDate = null,
  }) {
    return _then(_VisitHistory(
      documentId: null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      userDocumentId: null == userDocumentId
          ? _self.userDocumentId
          : userDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      spotDocumentId: null == spotDocumentId
          ? _self.spotDocumentId
          : spotDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      spotName: null == spotName
          ? _self.spotName
          : spotName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      ticket: null == ticket
          ? _self.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as Ticket,
      userSportswear: null == userSportswear
          ? _self.userSportswear
          : userSportswear // ignore: cast_nullable_to_non_nullable
              as bool,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of VisitHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketCopyWith<$Res> get ticket {
    return $TicketCopyWith<$Res>(_self.ticket, (value) {
      return _then(_self.copyWith(ticket: value));
    });
  }
}

// dart format on
