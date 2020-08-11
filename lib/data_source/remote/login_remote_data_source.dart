import '../../core/error/exceptions.dart';
import '../../core/network/network_handler.dart';
import '../../locator.dart';
import '../../models/login_model.dart';

const String url = 'https://lmu-dj-api.herokuapp.com/api/login/';

/// This handles the connection of the application to API's.
abstract class LoginRemoteDataSource {
  /// This invokes the login request.
  Future<LoginModel> getUser({String email, String password});
}

/// This class tends to implement [LoginRemoteDataSource] abstract class.
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final client = locator<NetworkHandler>();
  @override
  Future<LoginModel> getUser({String email, String password}) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    final response = await client.handlePost(
      url: url,
      body: body,
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(response.body);
    } else {
      print('error from login remote');
      print(response.body);
      throw ServerException(message: response.body);
    }
  }
}
