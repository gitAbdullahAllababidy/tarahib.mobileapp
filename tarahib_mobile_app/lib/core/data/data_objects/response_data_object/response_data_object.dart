// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:collection/collection.dart';

class ResponseDataObject<D> {
  bool? success;
  String? message;
  D? data;

  ResponseDataObject({this.success, this.message, this.data});

  factory ResponseDataObject.fromMap(Map<String, dynamic> data) {
    return ResponseDataObject(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        data: data['data']);
  }

  Map<String, dynamic> toMap() =>
      {'success': success, 'message': message, 'data': data};

  factory ResponseDataObject.fromJson(String data) {
    return ResponseDataObject.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseDataObject) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}
