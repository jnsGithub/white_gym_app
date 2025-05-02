// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpotItem {
  String get documentId;
  String get name;
  String get descriptions1;
  String get descriptions2;
  String get spotDocumentId;
  bool get isSubscribe;
  bool get passTicket;
  bool get discountCheck;
  int get index;
  int get admission;
  int get locker;
  int get monthly;
  int get pause;
  int get beforeDiscount;
  int get price;
  int get sportswear;
  @DateTimeConverter()
  DateTime get createDate;

  /// Create a copy of SpotItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpotItemCopyWith<SpotItem> get copyWith =>
      _$SpotItemCopyWithImpl<SpotItem>(this as SpotItem, _$identity);

  /// Serializes this SpotItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpotItem &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.descriptions1, descriptions1) ||
                other.descriptions1 == descriptions1) &&
            (identical(other.descriptions2, descriptions2) ||
                other.descriptions2 == descriptions2) &&
            (identical(other.spotDocumentId, spotDocumentId) ||
                other.spotDocumentId == spotDocumentId) &&
            (identical(other.isSubscribe, isSubscribe) ||
                other.isSubscribe == isSubscribe) &&
            (identical(other.passTicket, passTicket) ||
                other.passTicket == passTicket) &&
            (identical(other.discountCheck, discountCheck) ||
                other.discountCheck == discountCheck) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.admission, admission) ||
                other.admission == admission) &&
            (identical(other.locker, locker) || other.locker == locker) &&
            (identical(other.monthly, monthly) || other.monthly == monthly) &&
            (identical(other.pause, pause) || other.pause == pause) &&
            (identical(other.beforeDiscount, beforeDiscount) ||
                other.beforeDiscount == beforeDiscount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.sportswear, sportswear) ||
                other.sportswear == sportswear) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentId,
      name,
      descriptions1,
      descriptions2,
      spotDocumentId,
      isSubscribe,
      passTicket,
      discountCheck,
      index,
      admission,
      locker,
      monthly,
      pause,
      beforeDiscount,
      price,
      sportswear,
      createDate);

  @override
  String toString() {
    return 'SpotItem(documentId: $documentId, name: $name, descriptions1: $descriptions1, descriptions2: $descriptions2, spotDocumentId: $spotDocumentId, isSubscribe: $isSubscribe, passTicket: $passTicket, discountCheck: $discountCheck, index: $index, admission: $admission, locker: $locker, monthly: $monthly, pause: $pause, beforeDiscount: $beforeDiscount, price: $price, sportswear: $sportswear, createDate: $createDate)';
  }
}

/// @nodoc
abstract mixin class $SpotItemCopyWith<$Res> {
  factory $SpotItemCopyWith(SpotItem value, $Res Function(SpotItem) _then) =
      _$SpotItemCopyWithImpl;
  @useResult
  $Res call(
      {String documentId,
      String name,
      String descriptions1,
      String descriptions2,
      String spotDocumentId,
      bool isSubscribe,
      bool passTicket,
      bool discountCheck,
      int index,
      int admission,
      int locker,
      int monthly,
      int pause,
      int beforeDiscount,
      int price,
      int sportswear,
      @DateTimeConverter() DateTime createDate});
}

/// @nodoc
class _$SpotItemCopyWithImpl<$Res> implements $SpotItemCopyWith<$Res> {
  _$SpotItemCopyWithImpl(this._self, this._then);

  final SpotItem _self;
  final $Res Function(SpotItem) _then;

  /// Create a copy of SpotItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? name = null,
    Object? descriptions1 = null,
    Object? descriptions2 = null,
    Object? spotDocumentId = null,
    Object? isSubscribe = null,
    Object? passTicket = null,
    Object? discountCheck = null,
    Object? index = null,
    Object? admission = null,
    Object? locker = null,
    Object? monthly = null,
    Object? pause = null,
    Object? beforeDiscount = null,
    Object? price = null,
    Object? sportswear = null,
    Object? createDate = null,
  }) {
    return _then(_self.copyWith(
      documentId: null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions1: null == descriptions1
          ? _self.descriptions1
          : descriptions1 // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions2: null == descriptions2
          ? _self.descriptions2
          : descriptions2 // ignore: cast_nullable_to_non_nullable
              as String,
      spotDocumentId: null == spotDocumentId
          ? _self.spotDocumentId
          : spotDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribe: null == isSubscribe
          ? _self.isSubscribe
          : isSubscribe // ignore: cast_nullable_to_non_nullable
              as bool,
      passTicket: null == passTicket
          ? _self.passTicket
          : passTicket // ignore: cast_nullable_to_non_nullable
              as bool,
      discountCheck: null == discountCheck
          ? _self.discountCheck
          : discountCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      admission: null == admission
          ? _self.admission
          : admission // ignore: cast_nullable_to_non_nullable
              as int,
      locker: null == locker
          ? _self.locker
          : locker // ignore: cast_nullable_to_non_nullable
              as int,
      monthly: null == monthly
          ? _self.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int,
      pause: null == pause
          ? _self.pause
          : pause // ignore: cast_nullable_to_non_nullable
              as int,
      beforeDiscount: null == beforeDiscount
          ? _self.beforeDiscount
          : beforeDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      sportswear: null == sportswear
          ? _self.sportswear
          : sportswear // ignore: cast_nullable_to_non_nullable
              as int,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SpotItem implements SpotItem {
  const _SpotItem(
      {required this.documentId,
      required this.name,
      required this.descriptions1,
      required this.descriptions2,
      required this.spotDocumentId,
      required this.isSubscribe,
      required this.passTicket,
      required this.discountCheck,
      required this.index,
      required this.admission,
      required this.locker,
      required this.monthly,
      required this.pause,
      required this.beforeDiscount,
      required this.price,
      required this.sportswear,
      @DateTimeConverter() required this.createDate});
  factory _SpotItem.fromJson(Map<String, dynamic> json) =>
      _$SpotItemFromJson(json);

  @override
  final String documentId;
  @override
  final String name;
  @override
  final String descriptions1;
  @override
  final String descriptions2;
  @override
  final String spotDocumentId;
  @override
  final bool isSubscribe;
  @override
  final bool passTicket;
  @override
  final bool discountCheck;
  @override
  final int index;
  @override
  final int admission;
  @override
  final int locker;
  @override
  final int monthly;
  @override
  final int pause;
  @override
  final int beforeDiscount;
  @override
  final int price;
  @override
  final int sportswear;
  @override
  @DateTimeConverter()
  final DateTime createDate;

  /// Create a copy of SpotItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpotItemCopyWith<_SpotItem> get copyWith =>
      __$SpotItemCopyWithImpl<_SpotItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SpotItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpotItem &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.descriptions1, descriptions1) ||
                other.descriptions1 == descriptions1) &&
            (identical(other.descriptions2, descriptions2) ||
                other.descriptions2 == descriptions2) &&
            (identical(other.spotDocumentId, spotDocumentId) ||
                other.spotDocumentId == spotDocumentId) &&
            (identical(other.isSubscribe, isSubscribe) ||
                other.isSubscribe == isSubscribe) &&
            (identical(other.passTicket, passTicket) ||
                other.passTicket == passTicket) &&
            (identical(other.discountCheck, discountCheck) ||
                other.discountCheck == discountCheck) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.admission, admission) ||
                other.admission == admission) &&
            (identical(other.locker, locker) || other.locker == locker) &&
            (identical(other.monthly, monthly) || other.monthly == monthly) &&
            (identical(other.pause, pause) || other.pause == pause) &&
            (identical(other.beforeDiscount, beforeDiscount) ||
                other.beforeDiscount == beforeDiscount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.sportswear, sportswear) ||
                other.sportswear == sportswear) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentId,
      name,
      descriptions1,
      descriptions2,
      spotDocumentId,
      isSubscribe,
      passTicket,
      discountCheck,
      index,
      admission,
      locker,
      monthly,
      pause,
      beforeDiscount,
      price,
      sportswear,
      createDate);

  @override
  String toString() {
    return 'SpotItem(documentId: $documentId, name: $name, descriptions1: $descriptions1, descriptions2: $descriptions2, spotDocumentId: $spotDocumentId, isSubscribe: $isSubscribe, passTicket: $passTicket, discountCheck: $discountCheck, index: $index, admission: $admission, locker: $locker, monthly: $monthly, pause: $pause, beforeDiscount: $beforeDiscount, price: $price, sportswear: $sportswear, createDate: $createDate)';
  }
}

/// @nodoc
abstract mixin class _$SpotItemCopyWith<$Res>
    implements $SpotItemCopyWith<$Res> {
  factory _$SpotItemCopyWith(_SpotItem value, $Res Function(_SpotItem) _then) =
      __$SpotItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String documentId,
      String name,
      String descriptions1,
      String descriptions2,
      String spotDocumentId,
      bool isSubscribe,
      bool passTicket,
      bool discountCheck,
      int index,
      int admission,
      int locker,
      int monthly,
      int pause,
      int beforeDiscount,
      int price,
      int sportswear,
      @DateTimeConverter() DateTime createDate});
}

/// @nodoc
class __$SpotItemCopyWithImpl<$Res> implements _$SpotItemCopyWith<$Res> {
  __$SpotItemCopyWithImpl(this._self, this._then);

  final _SpotItem _self;
  final $Res Function(_SpotItem) _then;

  /// Create a copy of SpotItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documentId = null,
    Object? name = null,
    Object? descriptions1 = null,
    Object? descriptions2 = null,
    Object? spotDocumentId = null,
    Object? isSubscribe = null,
    Object? passTicket = null,
    Object? discountCheck = null,
    Object? index = null,
    Object? admission = null,
    Object? locker = null,
    Object? monthly = null,
    Object? pause = null,
    Object? beforeDiscount = null,
    Object? price = null,
    Object? sportswear = null,
    Object? createDate = null,
  }) {
    return _then(_SpotItem(
      documentId: null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions1: null == descriptions1
          ? _self.descriptions1
          : descriptions1 // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions2: null == descriptions2
          ? _self.descriptions2
          : descriptions2 // ignore: cast_nullable_to_non_nullable
              as String,
      spotDocumentId: null == spotDocumentId
          ? _self.spotDocumentId
          : spotDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribe: null == isSubscribe
          ? _self.isSubscribe
          : isSubscribe // ignore: cast_nullable_to_non_nullable
              as bool,
      passTicket: null == passTicket
          ? _self.passTicket
          : passTicket // ignore: cast_nullable_to_non_nullable
              as bool,
      discountCheck: null == discountCheck
          ? _self.discountCheck
          : discountCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      admission: null == admission
          ? _self.admission
          : admission // ignore: cast_nullable_to_non_nullable
              as int,
      locker: null == locker
          ? _self.locker
          : locker // ignore: cast_nullable_to_non_nullable
              as int,
      monthly: null == monthly
          ? _self.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int,
      pause: null == pause
          ? _self.pause
          : pause // ignore: cast_nullable_to_non_nullable
              as int,
      beforeDiscount: null == beforeDiscount
          ? _self.beforeDiscount
          : beforeDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      sportswear: null == sportswear
          ? _self.sportswear
          : sportswear // ignore: cast_nullable_to_non_nullable
              as int,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
