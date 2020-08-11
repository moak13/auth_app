import '../../core/error/exceptions.dart';
import '../../core/network/network_handler.dart';
import '../../locator.dart';
import '../../models/auth_model.dart';

const String url = 'https://lmu-dj-api.herokuapp.com/rest-auth/registration/';

/// This handles the connection of the application to API's.
abstract class SignupRemoteDataSource {
  /// This invokes the signup request.
  Future<AuthModel> createUser({
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
  Future<AuthModel> createUser(
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

    final response = await client.handlePost(
      url: url,
      body: body,
    );

    if (response.statusCode == 200) {
      return AuthModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
