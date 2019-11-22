import 'dart:convert';

import 'package:auth_app/models/loginResponse.dart';
import 'package:auth_app/models/signupResponse.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = '';
  static const signupUrl = baseUrl + '/signup';
  static const loginUrl = baseUrl + '/login';

  Future<SignupResponse> createUser(
      String name, String email, String password) async {
    try {
      final body =
          json.encode({'name': name, 'email': email, 'password': password});

      var signupResponse = await http.post(signupUrl, body: body);
      if (signupResponse.statusCode == 201) {
        return SignupResponse.fromJson(json.decode(signupResponse.body));
      } else {
        return SignupResponse.fromJson(json.decode(signupResponse.body));
      }
    } catch (e) {
      return SignupResponse.fromJson(json.decode(e));
    }
  }

  Future<LoginResponse> getUser(String email, String password) async {
    try {
      final body = json.encode({'email': email, 'password': password});

      var loginResponse = await http.post(signupUrl, body: body);
      if (loginResponse.statusCode == 200) {
        return LoginResponse.fromJson(json.decode(loginResponse.body));
      } else {
        return LoginResponse.fromJson(json.decode(loginResponse.body));
      }
    } catch (e) {
      return LoginResponse.fromJson(json.decode(e));
    }
  }
}
