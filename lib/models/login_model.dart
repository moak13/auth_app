import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final int id;
  final String token;
  final String message;
  LoginModel({
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

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LoginModel(
      id: map['user_id'],
      token: map['token'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
