import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../../component/main_box.dart';
import '../../global.dart';
import '../model/spot.dart';
import '../model/spotItem.dart';
import '../model/userData.dart';
import '../routes/app_pages.dart';


class SpotDataRepository {
  FirebaseStorage storage = FirebaseStorage.instance;
  final spotCollection = FirebaseFirestore.instance.collection('spot');
  final spotItemCollection = FirebaseFirestore.instance.collection('spotItem');

  getSpot() async {
    try{
      final snapshot = await spotCollection.get();
      RxList<Spot> list = <Spot>[].obs;
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data();
        data['documentId'] = doc.id;
        list.add(Spot.fromMap(data));
      }
      return list;
    } catch(e){
      RxList<Spot> list = <Spot>[].obs;
      print(e);
      return list;
    }
  }
  getSpotItem(id) async {
    try {
      final snapshot =
          await spotItemCollection.where('spotDocumentId', isEqualTo: id).get();
      RxList<SpotItem> list = <SpotItem>[].obs;
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data();
        data['documentId'] = doc.id;
        list.add(SpotItem.fromJson(data));
      }
      return list;
    } catch(e){
      RxList<SpotItem> list = <SpotItem>[].obs;
      print(e);
      return list;
    }
  }
}