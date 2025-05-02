// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Spot _$SpotFromJson(Map<String, dynamic> json) => _Spot(
      documentId: json['documentId'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      addressDetail: json['addressDetail'] as String,
      descriptions: json['descriptions'] as String,
      imageUrlList: json['imageUrlList'] as List<dynamic>,
      devSnList: json['devSnList'] as List<dynamic>,
      distanceBetween: (json['distanceBetween'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      createDate:
          const DateTimeConverter().fromJson(json['createDate'] as Timestamp),
    );

Map<String, dynamic> _$SpotToJson(_Spot instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
      'address': instance.address,
      'addressDetail': instance.addressDetail,
      'descriptions': instance.descriptions,
      'imageUrlList': instance.imageUrlList,
      'devSnList': instance.devSnList,
      'distanceBetween': instance.distanceBetween,
      'lat': instance.lat,
      'lon': instance.lon,
      'createDate': const DateTimeConverter().toJson(instance.createDate),
    };
