// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentItem {
  String get documentId;
  String get userDocumentId;
  String get userPhone;
  String get userName;
  String get spotDocumentId;
  String get paymentBranch;
  bool get subscribe;
  int get sportswear;
  int get locker;
  int get ticketPrice;
  @DateTimeConverter()
  DateTime get crateDate;
  @ReceiptConverter()
  Receipt get receipt;

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentItemCopyWith<PaymentItem> get copyWith =>
      _$PaymentItemCopyWithImpl<PaymentItem>(this as PaymentItem, _$identity);

  /// Serializes this PaymentItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentItem &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.userDocumentId, userDocumentId) ||
                other.userDocumentId == userDocumentId) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.spotDocumentId, spotDocumentId) ||
                other.spotDocumentId == spotDocumentId) &&
            (identical(other.paymentBranch, paymentBranch) ||
                other.paymentBranch == paymentBranch) &&
            (identical(other.subscribe, subscribe) ||
                other.subscribe == subscribe) &&
            (identical(other.sportswear, sportswear) ||
                other.sportswear == sportswear) &&
            (identical(other.locker, locker) || other.locker == locker) &&
            (identical(other.ticketPrice, ticketPrice) ||
                other.ticketPrice == ticketPrice) &&
            (identical(other.crateDate, crateDate) ||
                other.crateDate == crateDate) &&
            (identical(other.receipt, receipt) || other.receipt == receipt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentId,
      userDocumentId,
      userPhone,
      userName,
      spotDocumentId,
      paymentBranch,
      subscribe,
      sportswear,
      locker,
      ticketPrice,
      crateDate,
      receipt);

  @override
  String toString() {
    return 'PaymentItem(documentId: $documentId, userDocumentId: $userDocumentId, userPhone: $userPhone, userName: $userName, spotDocumentId: $spotDocumentId, paymentBranch: $paymentBranch, subscribe: $subscribe, sportswear: $sportswear, locker: $locker, ticketPrice: $ticketPrice, crateDate: $crateDate, receipt: $receipt)';
  }
}

/// @nodoc
abstract mixin class $PaymentItemCopyWith<$Res> {
  factory $PaymentItemCopyWith(
          PaymentItem value, $Res Function(PaymentItem) _then) =
      _$PaymentItemCopyWithImpl;
  @useResult
  $Res call(
      {String documentId,
      String userDocumentId,
      String userPhone,
      String userName,
      String spotDocumentId,
      String paymentBranch,
      bool subscribe,
      int sportswear,
      int locker,
      int ticketPrice,
      @DateTimeConverter() DateTime crateDate,
      @ReceiptConverter() Receipt receipt});

  $ReceiptCopyWith<$Res> get receipt;
}

/// @nodoc
class _$PaymentItemCopyWithImpl<$Res> implements $PaymentItemCopyWith<$Res> {
  _$PaymentItemCopyWithImpl(this._self, this._then);

  final PaymentItem _self;
  final $Res Function(PaymentItem) _then;

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? userDocumentId = null,
    Object? userPhone = null,
    Object? userName = null,
    Object? spotDocumentId = null,
    Object? paymentBranch = null,
    Object? subscribe = null,
    Object? sportswear = null,
    Object? locker = null,
    Object? ticketPrice = null,
    Object? crateDate = null,
    Object? receipt = null,
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
      userPhone: null == userPhone
          ? _self.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      spotDocumentId: null == spotDocumentId
          ? _self.spotDocumentId
          : spotDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBranch: null == paymentBranch
          ? _self.paymentBranch
          : paymentBranch // ignore: cast_nullable_to_non_nullable
              as String,
      subscribe: null == subscribe
          ? _self.subscribe
          : subscribe // ignore: cast_nullable_to_non_nullable
              as bool,
      sportswear: null == sportswear
          ? _self.sportswear
          : sportswear // ignore: cast_nullable_to_non_nullable
              as int,
      locker: null == locker
          ? _self.locker
          : locker // ignore: cast_nullable_to_non_nullable
              as int,
      ticketPrice: null == ticketPrice
          ? _self.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int,
      crateDate: null == crateDate
          ? _self.crateDate
          : crateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receipt: null == receipt
          ? _self.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as Receipt,
    ));
  }

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReceiptCopyWith<$Res> get receipt {
    return $ReceiptCopyWith<$Res>(_self.receipt, (value) {
      return _then(_self.copyWith(receipt: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentItem implements PaymentItem {
  const _PaymentItem(
      {required this.documentId,
      required this.userDocumentId,
      required this.userPhone,
      required this.userName,
      required this.spotDocumentId,
      required this.paymentBranch,
      required this.subscribe,
      required this.sportswear,
      required this.locker,
      required this.ticketPrice,
      @DateTimeConverter() required this.crateDate,
      @ReceiptConverter() required this.receipt});
  factory _PaymentItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentItemFromJson(json);

  @override
  final String documentId;
  @override
  final String userDocumentId;
  @override
  final String userPhone;
  @override
  final String userName;
  @override
  final String spotDocumentId;
  @override
  final String paymentBranch;
  @override
  final bool subscribe;
  @override
  final int sportswear;
  @override
  final int locker;
  @override
  final int ticketPrice;
  @override
  @DateTimeConverter()
  final DateTime crateDate;
  @override
  @ReceiptConverter()
  final Receipt receipt;

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentItemCopyWith<_PaymentItem> get copyWith =>
      __$PaymentItemCopyWithImpl<_PaymentItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentItem &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.userDocumentId, userDocumentId) ||
                other.userDocumentId == userDocumentId) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.spotDocumentId, spotDocumentId) ||
                other.spotDocumentId == spotDocumentId) &&
            (identical(other.paymentBranch, paymentBranch) ||
                other.paymentBranch == paymentBranch) &&
            (identical(other.subscribe, subscribe) ||
                other.subscribe == subscribe) &&
            (identical(other.sportswear, sportswear) ||
                other.sportswear == sportswear) &&
            (identical(other.locker, locker) || other.locker == locker) &&
            (identical(other.ticketPrice, ticketPrice) ||
                other.ticketPrice == ticketPrice) &&
            (identical(other.crateDate, crateDate) ||
                other.crateDate == crateDate) &&
            (identical(other.receipt, receipt) || other.receipt == receipt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentId,
      userDocumentId,
      userPhone,
      userName,
      spotDocumentId,
      paymentBranch,
      subscribe,
      sportswear,
      locker,
      ticketPrice,
      crateDate,
      receipt);

  @override
  String toString() {
    return 'PaymentItem(documentId: $documentId, userDocumentId: $userDocumentId, userPhone: $userPhone, userName: $userName, spotDocumentId: $spotDocumentId, paymentBranch: $paymentBranch, subscribe: $subscribe, sportswear: $sportswear, locker: $locker, ticketPrice: $ticketPrice, crateDate: $crateDate, receipt: $receipt)';
  }
}

/// @nodoc
abstract mixin class _$PaymentItemCopyWith<$Res>
    implements $PaymentItemCopyWith<$Res> {
  factory _$PaymentItemCopyWith(
          _PaymentItem value, $Res Function(_PaymentItem) _then) =
      __$PaymentItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String documentId,
      String userDocumentId,
      String userPhone,
      String userName,
      String spotDocumentId,
      String paymentBranch,
      bool subscribe,
      int sportswear,
      int locker,
      int ticketPrice,
      @DateTimeConverter() DateTime crateDate,
      @ReceiptConverter() Receipt receipt});

  @override
  $ReceiptCopyWith<$Res> get receipt;
}

/// @nodoc
class __$PaymentItemCopyWithImpl<$Res> implements _$PaymentItemCopyWith<$Res> {
  __$PaymentItemCopyWithImpl(this._self, this._then);

  final _PaymentItem _self;
  final $Res Function(_PaymentItem) _then;

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documentId = null,
    Object? userDocumentId = null,
    Object? userPhone = null,
    Object? userName = null,
    Object? spotDocumentId = null,
    Object? paymentBranch = null,
    Object? subscribe = null,
    Object? sportswear = null,
    Object? locker = null,
    Object? ticketPrice = null,
    Object? crateDate = null,
    Object? receipt = null,
  }) {
    return _then(_PaymentItem(
      documentId: null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      userDocumentId: null == userDocumentId
          ? _self.userDocumentId
          : userDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: null == userPhone
          ? _self.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      spotDocumentId: null == spotDocumentId
          ? _self.spotDocumentId
          : spotDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBranch: null == paymentBranch
          ? _self.paymentBranch
          : paymentBranch // ignore: cast_nullable_to_non_nullable
              as String,
      subscribe: null == subscribe
          ? _self.subscribe
          : subscribe // ignore: cast_nullable_to_non_nullable
              as bool,
      sportswear: null == sportswear
          ? _self.sportswear
          : sportswear // ignore: cast_nullable_to_non_nullable
              as int,
      locker: null == locker
          ? _self.locker
          : locker // ignore: cast_nullable_to_non_nullable
              as int,
      ticketPrice: null == ticketPrice
          ? _self.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int,
      crateDate: null == crateDate
          ? _self.crateDate
          : crateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receipt: null == receipt
          ? _self.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as Receipt,
    ));
  }

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReceiptCopyWith<$Res> get receipt {
    return $ReceiptCopyWith<$Res>(_self.receipt, (value) {
      return _then(_self.copyWith(receipt: value));
    });
  }
}

// dart format on
