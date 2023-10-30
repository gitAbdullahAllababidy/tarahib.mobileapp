// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:collection/collection.dart';

class ContactsListObject {
  int? id;
  int? userId;
  String? surname;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  int? companionCount;
  DateTime? createdAt;
  DateTime? updatedAt;
String get fullName => "$firstName $lastName";
  ContactsListObject({
    this.id,
    this.userId,
    this.surname,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.companionCount,
    this.createdAt,
    this.updatedAt,
  });

  factory ContactsListObject.fromMap(Map<String, dynamic> data) {
    return ContactsListObject(
      id: data['id'] as int?,
      userId: data['user_id'] as int?,
      surname: data['surname'] as String?,
      firstName: data['first_name'] as String?,
      lastName: data['last_name'] as String?,
      email: data['email'] as String?,
      mobile: data['mobile'] as String?,
      companionCount: data['companion_count'] as int?,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.parse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'surname': surname,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'mobile': mobile,
        'companion_count': companionCount,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  factory ContactsListObject.fromJson(String data) {
    return ContactsListObject.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  ContactsListObject copyWith({
    int? id,
    int? userId,
    String? surname,
    String? firstName,
    String? lastName,
    String? email,
    String? mobile,
    int? companionCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ContactsListObject(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      surname: surname ?? this.surname,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      companionCount: companionCount ?? this.companionCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ContactsListObject) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      surname.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      mobile.hashCode ^
      companionCount.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
