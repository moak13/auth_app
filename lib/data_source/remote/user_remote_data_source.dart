import '../../core/error/exceptions.dart';
import '../../core/network/network_handler.dart';
import '../../locator.dart';
import '../../models/user_model.dart';
import '../local/data_local_data_source.dart';

const String baseUrl = 'https://lmu-dj-api.herokuapp.com/api/users/';

/// This handles the connection of the application to API's.
abstract class UserRemoteDataSource {
  /// This invokes the user details fetch request.
  Future<UserModel> fetchUser();
}

/// This class tends to implement [UserRemoteDataSource] abstract class.
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final _client = locator<NetworkHandler>();
  final _localData = locator<DataLocalDataSource>();

  @override
  Future<UserModel> fetchUser() async {
    final data = await _localData.getResponse();
    final url = baseUrl + '${data.id}' + '/';
    Map<String, String> headers = {
      'Authorization': 'Token ' + '${data.token}',
    };
    final response = await _client.handleGet(
      url: url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    } else {
      print(response.body);
      throw ServerException(message: response.body);
    }
  }
}
