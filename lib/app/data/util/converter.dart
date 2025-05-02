import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, Timestamp> {
  const DateTimeConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

class DateTimeListConverter implements JsonConverter<List<DateTime>, List<dynamic>> {
  const DateTimeListConverter();

  @override
  List<DateTime> fromJson(List<dynamic> json) =>
      json.map((e) {
        if (e is Timestamp) {
          return e.toDate();
        } else {
          throw FormatException('Expected Timestamp but got ${e.runtimeType}');
        }
      }).toList();

  @override
  List<Timestamp> toJson(List<DateTime> object) =>
      object.map((e) => Timestamp.fromDate(e)).toList();
}

abstract class ModelConverter<T> implements JsonConverter<T, Map<String, dynamic>> {
  const ModelConverter();

  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T object);
}


// class DateTimeListConverter implements JsonConverter<List<DateTime>, List<dynamic>> {
//   const DateTimeListConverter();
//
//   @override
//   List<DateTime> fromJson(List<dynamic> json) => json.map((dynamic e) => (e as Timestamp).toDate()).toList();
//
//   @override
//   List<Timestamp> toJson(List<DateTime> object) => object.map((DateTime e) => Timestamp.fromDate(e)).toList();
// }