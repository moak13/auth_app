import 'package:auth_app/models/user.dart';

class LoginResponse {
  String message;
  List<User> user;

  LoginResponse({this.message, this.user});

  String get msg => message;
  List get you => user;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['user'] != null) {
      user = new List<User>();
      json['user'].forEach((v) {
        user.add(new User.fromJson(v));
      });
    }
  }
}
