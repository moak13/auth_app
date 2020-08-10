import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class UserModel extends Equatable {
  @primaryKey
  final int id;
  final String name;
  final String email;
  final String username;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
  });
  @override
  List<Object> get props => [id, name, email, username];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
