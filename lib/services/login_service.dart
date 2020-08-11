import '../core/error/exceptions.dart';
import '../core/network/network_info.dart';
import '../core/utils/result.dart';
import '../data_source/local/data_local_data_source.dart';
import '../data_source/remote/login_remote_data_source.dart';
import '../locator.dart';
import '../models/auth_model.dart';

abstract class LoginService {
  Future<Result<AuthModel>> performLogin({String email, String password});
}

class LoginServiceImpl implements LoginService {
  final remoteDataSource = locator<LoginRemoteDataSource>();
  final localDataSource = locator<DataLocalDataSource>();
  final networkInfo = locator<NetworkInfo>();
  @override
  Future<Result<AuthModel>> performLogin(
      {String email, String password}) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response =
            await remoteDataSource.getUser(email: email, password: password);
        localDataSource.saveResponse(data: response);
        return Result(success: response);
      } on ServerException catch (err) {
        print('because server error happened: ${err.toString()}');
        return Result(error: ServerError(err.toString()));
      }
    } else {
      return Result(error: NoInternetError('No Internet Connection'));
    }
  }
}
