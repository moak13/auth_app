import 'dart:async';

import 'package:auth_app/models/loginResponse.dart';
import 'package:auth_app/models/signupResponse.dart';

import '../locator.dart';
import 'api.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<SignupResponse> streamController =
      StreamController<SignupResponse>();

  StreamController<LoginResponse> streamyController =
      StreamController<LoginResponse>();

  Future<bool> signup(String name, String email, String password) async {
    var response = await _api.createUser(name, email, password);
    var hasData = response != null;
    if (hasData) {
      streamController.add(response);
    }

    return hasData;
  }

  Future<bool> login(String email, String password) async {
    var response = await _api.getUser(email, password);
    var hasData = response != null;
    if (hasData) {
      streamyController.add(response);
    }

    return hasData;
  }
}
