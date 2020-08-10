import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignupModel extends Equatable {
  final int id;
  final String token;
  final String message;
  SignupModel({
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

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SignupModel(
      id: map['user_id'],
      token: map['token'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupModel.fromJson(String source) =>
      SignupModel.fromMap(json.decode(source));
}
