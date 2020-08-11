import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final int id;
  final String token;
  final String message;
  AuthModel({
    this.id,
    this.token,
    this.message,
  });

  @override
  List<Object> get props => [id, token, message];

  Map<String, dynamic> toMap() {
    return {
      'user_id': id,
      'token': token,
      'message': message,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthModel(
      id: map['user_id'],
      token: map['token'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));
}
