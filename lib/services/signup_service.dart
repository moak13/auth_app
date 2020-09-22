import '../core/error/exceptions.dart';
import '../core/network/network_info.dart';
import '../core/utils/result.dart';
import '../data_source/local/data_local_data_source.dart';
import '../data_source/remote/signup_remote_data_source.dart';
import '../locator.dart';
import '../models/auth_model.dart';

abstract class SignupService {
  Future<Result<AuthModel>> performSignup({
    String firstname,
    String lastname,
    String email,
    String username,
    String password,
  });
}

class SignupServiceImpl implements SignupService {
  final remoteDataSource = locator<SignupRemoteDataSource>();
  final localDataSource = locator<DataLocalDataSource>();
  final networkInfo = locator<NetworkInfo>();
  @override
  Future<Result<AuthModel>> performSignup({
    String firstname,
    String lastname,
    String email,
    String username,
    String password,
  }) async {
    print('service');
    print(firstname);
    print(lastname);
    print(email);
    print(username);
    print(password);
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await remoteDataSource.createUser(
          firstname: firstname,
          lastname: lastname,
          email: email,
          username: username,
          password: password,
        );
        localDataSource.saveResponse(data: response);
        return Result(success: response);
      } on ServerException catch (err) {
        print('because server error happened: ${err.message}');
        return Result(error: ServerError(err.message));
      }
    } else {
      return Result(error: NoInternetError('No Internet Connection'));
    }
  }
}
