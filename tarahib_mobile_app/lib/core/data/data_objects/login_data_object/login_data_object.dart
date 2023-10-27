import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import 'user.dart';

class LoginDataObject {
  String? token;
  User? user;

  LoginDataObject({this.token, this.user});

  factory LoginDataObject.fromMap(Map<String, dynamic> data) {
    return LoginDataObject(
      token: data['token'] as String?,
      user: data['user'] == null
          ? null
          : User.fromMap(data['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'token': token,
        'user': user?.toMap(),
      };

  factory LoginDataObject.fromJson(String data) {
    return LoginDataObject.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  LoginDataObject copyWith({
    String? token,
    User? user,
  }) {
    return LoginDataObject(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LoginDataObject) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}
