// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardData {
  String get tid;
  String get cardApproveNo;
  String get cardNo;
  String get cardQuota;
  String get cardCompanyCode;
  String get cardCompany;
  String get cardType;

  /// Create a copy of CardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CardDataCopyWith<CardData> get copyWith =>
      _$CardDataCopyWithImpl<CardData>(this as CardData, _$identity);

  /// Serializes this CardData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardData &&
            (identical(other.tid, tid) || other.tid == tid) &&
            (identical(other.cardApproveNo, cardApproveNo) ||
                other.cardApproveNo == cardApproveNo) &&
            (identical(other.cardNo, cardNo) || other.cardNo == cardNo) &&
            (identical(other.cardQuota, cardQuota) ||
                other.cardQuota == cardQuota) &&
            (identical(other.cardCompanyCode, cardCompanyCode) ||
                other.cardCompanyCode == cardCompanyCode) &&
            (identical(other.cardCompany, cardCompany) ||
                other.cardCompany == cardCompany) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tid, cardApproveNo, cardNo,
      cardQuota, cardCompanyCode, cardCompany, cardType);

  @override
  String toString() {
    return 'CardData(tid: $tid, cardApproveNo: $cardApproveNo, cardNo: $cardNo, cardQuota: $cardQuota, cardCompanyCode: $cardCompanyCode, cardCompany: $cardCompany, cardType: $cardType)';
  }
}

/// @nodoc
abstract mixin class $CardDataCopyWith<$Res> {
  factory $CardDataCopyWith(CardData value, $Res Function(CardData) _then) =
      _$CardDataCopyWithImpl;
  @useResult
  $Res call(
      {String tid,
      String cardApproveNo,
      String cardNo,
      String cardQuota,
      String cardCompanyCode,
      String cardCompany,
      String cardType});
}

/// @nodoc
class _$CardDataCopyWithImpl<$Res> implements $CardDataCopyWith<$Res> {
  _$CardDataCopyWithImpl(this._self, this._then);

  final CardData _self;
  final $Res Function(CardData) _then;

  /// Create a copy of CardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tid = null,
    Object? cardApproveNo = null,
    Object? cardNo = null,
    Object? cardQuota = null,
    Object? cardCompanyCode = null,
    Object? cardCompany = null,
    Object? cardType = null,
  }) {
    return _then(_self.copyWith(
      tid: null == tid
          ? _self.tid
          : tid // ignore: cast_nullable_to_non_nullable
              as String,
      cardApproveNo: null == cardApproveNo
          ? _self.cardApproveNo
          : cardApproveNo // ignore: cast_nullable_to_non_nullable
              as String,
      cardNo: null == cardNo
          ? _self.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String,
      cardQuota: null == cardQuota
          ? _self.cardQuota
          : cardQuota // ignore: cast_nullable_to_non_nullable
              as String,
      cardCompanyCode: null == cardCompanyCode
          ? _self.cardCompanyCode
          : cardCompanyCode // ignore: cast_nullable_to_non_nullable
              as String,
      cardCompany: null == cardCompany
          ? _self.cardCompany
          : cardCompany // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _self.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CardData implements CardData {
  const _CardData(
      {required this.tid,
      required this.cardApproveNo,
      required this.cardNo,
      required this.cardQuota,
      required this.cardCompanyCode,
      required this.cardCompany,
      required this.cardType});
  factory _CardData.fromJson(Map<String, dynamic> json) =>
      _$CardDataFromJson(json);

  @override
  final String tid;
  @override
  final String cardApproveNo;
  @override
  final String cardNo;
  @override
  final String cardQuota;
  @override
  final String cardCompanyCode;
  @override
  final String cardCompany;
  @override
  final String cardType;

  /// Create a copy of CardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CardDataCopyWith<_CardData> get copyWith =>
      __$CardDataCopyWithImpl<_CardData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CardDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardData &&
            (identical(other.tid, tid) || other.tid == tid) &&
            (identical(other.cardApproveNo, cardApproveNo) ||
                other.cardApproveNo == cardApproveNo) &&
            (identical(other.cardNo, cardNo) || other.cardNo == cardNo) &&
            (identical(other.cardQuota, cardQuota) ||
                other.cardQuota == cardQuota) &&
            (identical(other.cardCompanyCode, cardCompanyCode) ||
                other.cardCompanyCode == cardCompanyCode) &&
            (identical(other.cardCompany, cardCompany) ||
                other.cardCompany == cardCompany) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tid, cardApproveNo, cardNo,
      cardQuota, cardCompanyCode, cardCompany, cardType);

  @override
  String toString() {
    return 'CardData(tid: $tid, cardApproveNo: $cardApproveNo, cardNo: $cardNo, cardQuota: $cardQuota, cardCompanyCode: $cardCompanyCode, cardCompany: $cardCompany, cardType: $cardType)';
  }
}

/// @nodoc
abstract mixin class _$CardDataCopyWith<$Res>
    implements $CardDataCopyWith<$Res> {
  factory _$CardDataCopyWith(_CardData value, $Res Function(_CardData) _then) =
      __$CardDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String tid,
      String cardApproveNo,
      String cardNo,
      String cardQuota,
      String cardCompanyCode,
      String cardCompany,
      String cardType});
}

/// @nodoc
class __$CardDataCopyWithImpl<$Res> implements _$CardDataCopyWith<$Res> {
  __$CardDataCopyWithImpl(this._self, this._then);

  final _CardData _self;
  final $Res Function(_CardData) _then;

  /// Create a copy of CardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tid = null,
    Object? cardApproveNo = null,
    Object? cardNo = null,
    Object? cardQuota = null,
    Object? cardCompanyCode = null,
    Object? cardCompany = null,
    Object? cardType = null,
  }) {
    return _then(_CardData(
      tid: null == tid
          ? _self.tid
          : tid // ignore: cast_nullable_to_non_nullable
              as String,
      cardApproveNo: null == cardApproveNo
          ? _self.cardApproveNo
          : cardApproveNo // ignore: cast_nullable_to_non_nullable
              as String,
      cardNo: null == cardNo
          ? _self.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String,
      cardQuota: null == cardQuota
          ? _self.cardQuota
          : cardQuota // ignore: cast_nullable_to_non_nullable
              as String,
      cardCompanyCode: null == cardCompanyCode
          ? _self.cardCompanyCode
          : cardCompanyCode // ignore: cast_nullable_to_non_nullable
              as String,
      cardCompany: null == cardCompany
          ? _self.cardCompany
          : cardCompany // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _self.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
