// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillingInfo {
  String get billingKey;
  String get documentId;
  String get cardCompany;
  String get cardNo;
  DateTime get createDate;
  String get userDocumentId;
  String get cardCompanyCode;

  /// Create a copy of BillingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BillingInfoCopyWith<BillingInfo> get copyWith =>
      _$BillingInfoCopyWithImpl<BillingInfo>(this as BillingInfo, _$identity);

  /// Serializes this BillingInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BillingInfo &&
            (identical(other.billingKey, billingKey) ||
                other.billingKey == billingKey) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.cardCompany, cardCompany) ||
                other.cardCompany == cardCompany) &&
            (identical(other.cardNo, cardNo) || other.cardNo == cardNo) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.userDocumentId, userDocumentId) ||
                other.userDocumentId == userDocumentId) &&
            (identical(other.cardCompanyCode, cardCompanyCode) ||
                other.cardCompanyCode == cardCompanyCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, billingKey, documentId,
      cardCompany, cardNo, createDate, userDocumentId, cardCompanyCode);

  @override
  String toString() {
    return 'BillingInfo(billingKey: $billingKey, documentId: $documentId, cardCompany: $cardCompany, cardNo: $cardNo, createDate: $createDate, userDocumentId: $userDocumentId, cardCompanyCode: $cardCompanyCode)';
  }
}

/// @nodoc
abstract mixin class $BillingInfoCopyWith<$Res> {
  factory $BillingInfoCopyWith(
          BillingInfo value, $Res Function(BillingInfo) _then) =
      _$BillingInfoCopyWithImpl;
  @useResult
  $Res call(
      {String billingKey,
      String documentId,
      String cardCompany,
      String cardNo,
      DateTime createDate,
      String userDocumentId,
      String cardCompanyCode});
}

/// @nodoc
class _$BillingInfoCopyWithImpl<$Res> implements $BillingInfoCopyWith<$Res> {
  _$BillingInfoCopyWithImpl(this._self, this._then);

  final BillingInfo _self;
  final $Res Function(BillingInfo) _then;

  /// Create a copy of BillingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billingKey = null,
    Object? documentId = null,
    Object? cardCompany = null,
    Object? cardNo = null,
    Object? createDate = null,
    Object? userDocumentId = null,
    Object? cardCompanyCode = null,
  }) {
    return _then(_self.copyWith(
      billingKey: null == billingKey
          ? _self.billingKey
          : billingKey // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      cardCompany: null == cardCompany
          ? _self.cardCompany
          : cardCompany // ignore: cast_nullable_to_non_nullable
              as String,
      cardNo: null == cardNo
          ? _self.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userDocumentId: null == userDocumentId
          ? _self.userDocumentId
          : userDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      cardCompanyCode: null == cardCompanyCode
          ? _self.cardCompanyCode
          : cardCompanyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BillingInfo implements BillingInfo {
  const _BillingInfo(
      {required this.billingKey,
      required this.documentId,
      required this.cardCompany,
      required this.cardNo,
      required this.createDate,
      required this.userDocumentId,
      required this.cardCompanyCode});
  factory _BillingInfo.fromJson(Map<String, dynamic> json) =>
      _$BillingInfoFromJson(json);

  @override
  final String billingKey;
  @override
  final String documentId;
  @override
  final String cardCompany;
  @override
  final String cardNo;
  @override
  final DateTime createDate;
  @override
  final String userDocumentId;
  @override
  final String cardCompanyCode;

  /// Create a copy of BillingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BillingInfoCopyWith<_BillingInfo> get copyWith =>
      __$BillingInfoCopyWithImpl<_BillingInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BillingInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BillingInfo &&
            (identical(other.billingKey, billingKey) ||
                other.billingKey == billingKey) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.cardCompany, cardCompany) ||
                other.cardCompany == cardCompany) &&
            (identical(other.cardNo, cardNo) || other.cardNo == cardNo) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.userDocumentId, userDocumentId) ||
                other.userDocumentId == userDocumentId) &&
            (identical(other.cardCompanyCode, cardCompanyCode) ||
                other.cardCompanyCode == cardCompanyCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, billingKey, documentId,
      cardCompany, cardNo, createDate, userDocumentId, cardCompanyCode);

  @override
  String toString() {
    return 'BillingInfo(billingKey: $billingKey, documentId: $documentId, cardCompany: $cardCompany, cardNo: $cardNo, createDate: $createDate, userDocumentId: $userDocumentId, cardCompanyCode: $cardCompanyCode)';
  }
}

/// @nodoc
abstract mixin class _$BillingInfoCopyWith<$Res>
    implements $BillingInfoCopyWith<$Res> {
  factory _$BillingInfoCopyWith(
          _BillingInfo value, $Res Function(_BillingInfo) _then) =
      __$BillingInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String billingKey,
      String documentId,
      String cardCompany,
      String cardNo,
      DateTime createDate,
      String userDocumentId,
      String cardCompanyCode});
}

/// @nodoc
class __$BillingInfoCopyWithImpl<$Res> implements _$BillingInfoCopyWith<$Res> {
  __$BillingInfoCopyWithImpl(this._self, this._then);

  final _BillingInfo _self;
  final $Res Function(_BillingInfo) _then;

  /// Create a copy of BillingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? billingKey = null,
    Object? documentId = null,
    Object? cardCompany = null,
    Object? cardNo = null,
    Object? createDate = null,
    Object? userDocumentId = null,
    Object? cardCompanyCode = null,
  }) {
    return _then(_BillingInfo(
      billingKey: null == billingKey
          ? _self.billingKey
          : billingKey // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      cardCompany: null == cardCompany
          ? _self.cardCompany
          : cardCompany // ignore: cast_nullable_to_non_nullable
              as String,
      cardNo: null == cardNo
          ? _self.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userDocumentId: null == userDocumentId
          ? _self.userDocumentId
          : userDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      cardCompanyCode: null == cardCompanyCode
          ? _self.cardCompanyCode
          : cardCompanyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
