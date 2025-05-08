import 'package:cloud_firestore/cloud_firestore.dart';

class Spot{
  final String documentId;
  String name;
  String address;
  String addressDetail;
  String descriptions;
  List imageUrlList;
  List devSnList;
  double distanceBetween;
  double lat;
  double lon;
  final DateTime createDate;

  Spot({
    required this.documentId,
    required this.name,
    required this.address,
    required this.addressDetail,
    required this.descriptions,
    required this.imageUrlList,
    required this.devSnList,
    required this.distanceBetween,
    required this.lat,
    required this.lon,
    required this.createDate,
  });

  factory Spot.fromMap(Map<String, dynamic> data){
    Timestamp createDate = data['createDate'];
    return Spot(
      documentId: data['documentId']??'',
      name: data['name']??'',
      address: data['address']??'',
      addressDetail: data['addressDetail']??'',
      descriptions: data['descriptions']??'',
      imageUrlList: data['imageUrlList'] ,
      devSnList: data['devSnList']??[],
      distanceBetween: data['distanceBetween']?? 0.0,
      lat: data['lat'],
      lon: data['lon'],
      createDate: createDate.toDate() ,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'address': address,
      'addressDetail': addressDetail,
      'descriptions': descriptions,
      'imageUrlList': imageUrlList,
      'devSnList': devSnList,
      'distanceBetween':distanceBetween,
      'lat': lat,
      'lon': lon,
      'createDate': createDate,
    };
  }

  factory Spot.empty() {
    return Spot(
      documentId: '',
      name: '',
      address: '',
      addressDetail: '',
      descriptions: '',
      imageUrlList: [],
      devSnList: [],
      distanceBetween: 0.0,
      lat: 0.0,
      lon: 0.0,
      createDate: DateTime.now(),
    );
  }

}