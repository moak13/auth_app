import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String username;
  UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.username,
  });
  @override
  List<Object> get props => [id, firstname, lastname, email, username];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      firstname: map['first_name'],
      lastname: map['last_name'],
      email: map['email'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
