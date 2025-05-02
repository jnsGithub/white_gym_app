// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Spot {
  String get documentId;
  String get name;
  String get address;
  String get addressDetail;
  String get descriptions;
  List get imageUrlList;
  List get devSnList;
  double get distanceBetween;
  double get lat;
  double get lon;
  @DateTimeConverter()
  DateTime get createDate;

  /// Create a copy of Spot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpotCopyWith<Spot> get copyWith =>
      _$SpotCopyWithImpl<Spot>(this as Spot, _$identity);

  /// Serializes this Spot to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Spot &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressDetail, addressDetail) ||
                other.addressDetail == addressDetail) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions) &&
            const DeepCollectionEquality()
                .equals(other.imageUrlList, imageUrlList) &&
            const DeepCollectionEquality().equals(other.devSnList, devSnList) &&
            (identical(other.distanceBetween, distanceBetween) ||
                other.distanceBetween == distanceBetween) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentId,
      name,
      address,
      addressDetail,
      descriptions,
      const DeepCollectionEquality().hash(imageUrlList),
      const DeepCollectionEquality().hash(devSnList),
      distanceBetween,
      lat,
      lon,
      createDate);

  @override
  String toString() {
    return 'Spot(documentId: $documentId, name: $name, address: $address, addressDetail: $addressDetail, descriptions: $descriptions, imageUrlList: $imageUrlList, devSnList: $devSnList, distanceBetween: $distanceBetween, lat: $lat, lon: $lon, createDate: $createDate)';
  }
}

/// @nodoc
abstract mixin class $SpotCopyWith<$Res> {
  factory $SpotCopyWith(Spot value, $Res Function(Spot) _then) =
      _$SpotCopyWithImpl;
  @useResult
  $Res call(
      {String documentId,
      String name,
      String address,
      String addressDetail,
      String descriptions,
      List imageUrlList,
      List devSnList,
      double distanceBetween,
      double lat,
      double lon,
      @DateTimeConverter() DateTime createDate});
}

/// @nodoc
class _$SpotCopyWithImpl<$Res> implements $SpotCopyWith<$Res> {
  _$SpotCopyWithImpl(this._self, this._then);

  final Spot _self;
  final $Res Function(Spot) _then;

  /// Create a copy of Spot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? name = null,
    Object? address = null,
    Object? addressDetail = null,
    Object? descriptions = null,
    Object? imageUrlList = null,
    Object? devSnList = null,
    Object? distanceBetween = null,
    Object? lat = null,
    Object? lon = null,
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
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addressDetail: null == addressDetail
          ? _self.addressDetail
          : addressDetail // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _self.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrlList: null == imageUrlList
          ? _self.imageUrlList
          : imageUrlList // ignore: cast_nullable_to_non_nullable
              as List,
      devSnList: null == devSnList
          ? _self.devSnList
          : devSnList // ignore: cast_nullable_to_non_nullable
              as List,
      distanceBetween: null == distanceBetween
          ? _self.distanceBetween
          : distanceBetween // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Spot implements Spot {
  const _Spot(
      {required this.documentId,
      required this.name,
      required this.address,
      required this.addressDetail,
      required this.descriptions,
      required final List imageUrlList,
      required final List devSnList,
      required this.distanceBetween,
      required this.lat,
      required this.lon,
      @DateTimeConverter() required this.createDate})
      : _imageUrlList = imageUrlList,
        _devSnList = devSnList;
  factory _Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);

  @override
  final String documentId;
  @override
  final String name;
  @override
  final String address;
  @override
  final String addressDetail;
  @override
  final String descriptions;
  final List _imageUrlList;
  @override
  List get imageUrlList {
    if (_imageUrlList is EqualUnmodifiableListView) return _imageUrlList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrlList);
  }

  final List _devSnList;
  @override
  List get devSnList {
    if (_devSnList is EqualUnmodifiableListView) return _devSnList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devSnList);
  }

  @override
  final double distanceBetween;
  @override
  final double lat;
  @override
  final double lon;
  @override
  @DateTimeConverter()
  final DateTime createDate;

  /// Create a copy of Spot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpotCopyWith<_Spot> get copyWith =>
      __$SpotCopyWithImpl<_Spot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SpotToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Spot &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressDetail, addressDetail) ||
                other.addressDetail == addressDetail) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions) &&
            const DeepCollectionEquality()
                .equals(other._imageUrlList, _imageUrlList) &&
            const DeepCollectionEquality()
                .equals(other._devSnList, _devSnList) &&
            (identical(other.distanceBetween, distanceBetween) ||
                other.distanceBetween == distanceBetween) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentId,
      name,
      address,
      addressDetail,
      descriptions,
      const DeepCollectionEquality().hash(_imageUrlList),
      const DeepCollectionEquality().hash(_devSnList),
      distanceBetween,
      lat,
      lon,
      createDate);

  @override
  String toString() {
    return 'Spot(documentId: $documentId, name: $name, address: $address, addressDetail: $addressDetail, descriptions: $descriptions, imageUrlList: $imageUrlList, devSnList: $devSnList, distanceBetween: $distanceBetween, lat: $lat, lon: $lon, createDate: $createDate)';
  }
}

/// @nodoc
abstract mixin class _$SpotCopyWith<$Res> implements $SpotCopyWith<$Res> {
  factory _$SpotCopyWith(_Spot value, $Res Function(_Spot) _then) =
      __$SpotCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String documentId,
      String name,
      String address,
      String addressDetail,
      String descriptions,
      List imageUrlList,
      List devSnList,
      double distanceBetween,
      double lat,
      double lon,
      @DateTimeConverter() DateTime createDate});
}

/// @nodoc
class __$SpotCopyWithImpl<$Res> implements _$SpotCopyWith<$Res> {
  __$SpotCopyWithImpl(this._self, this._then);

  final _Spot _self;
  final $Res Function(_Spot) _then;

  /// Create a copy of Spot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documentId = null,
    Object? name = null,
    Object? address = null,
    Object? addressDetail = null,
    Object? descriptions = null,
    Object? imageUrlList = null,
    Object? devSnList = null,
    Object? distanceBetween = null,
    Object? lat = null,
    Object? lon = null,
    Object? createDate = null,
  }) {
    return _then(_Spot(
      documentId: null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addressDetail: null == addressDetail
          ? _self.addressDetail
          : addressDetail // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _self.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrlList: null == imageUrlList
          ? _self._imageUrlList
          : imageUrlList // ignore: cast_nullable_to_non_nullable
              as List,
      devSnList: null == devSnList
          ? _self._devSnList
          : devSnList // ignore: cast_nullable_to_non_nullable
              as List,
      distanceBetween: null == distanceBetween
          ? _self.distanceBetween
          : distanceBetween // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
