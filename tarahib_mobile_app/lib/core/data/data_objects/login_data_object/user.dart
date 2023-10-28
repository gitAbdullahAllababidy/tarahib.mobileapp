// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:collection/collection.dart';

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  int? isAdmin;
  dynamic pass;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isAdmin,
    this.pass,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromMap(Map data) => User(
        id: data['id'] as int?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        emailVerifiedAt: data['email_verified_at'] as dynamic,
        isAdmin: data['is_admin'] as int?,
        pass: data['pass'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'is_admin': isAdmin,
        'pass': pass,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  User copyWith({
    int? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    int? isAdmin,
    dynamic pass,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      isAdmin: isAdmin ?? this.isAdmin,
      pass: pass ?? this.pass,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      emailVerifiedAt.hashCode ^
      isAdmin.hashCode ^
      pass.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
