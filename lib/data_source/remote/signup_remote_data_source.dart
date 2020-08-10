import 'dart:convert';

import '../../core/error/exceptions.dart';
import '../../core/network/network_handler.dart';
import '../../locator.dart';
import '../../models/signup_model.dart';

const String url = 'https://lmu-dj-api.herokuapp.com/rest-auth/registration/';

/// This handles the connection of the application to API's.
abstract class SignupRemoteDataSource {
  /// This invokes the signup request.
  Future<SignupModel> createUser({
    String firstname,
    String lastname,
    String email,
    String username,
    String password,
  });
}

/// This class tends to implement [SignupRemoteDataSource] abstract class.
class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  final client = locator<NetworkHandler>();

  @override
  Future<SignupModel> createUser(
      {String firstname,
      String lastname,
      String email,
      String username,
      String password}) async {
    Map<String, dynamic> body = {
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'username': username,
      'password': password,
    };

    Map<String, String> headers = {
      'content-type': 'application/json',
    };

    final response =
        await client.handlePost(url: url, body: body, headers: headers);

    if (response.statusCode == 200) {
      return SignupModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
