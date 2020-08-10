import '../core/error/exceptions.dart';
import '../core/network/network_info.dart';
import '../core/utils/result.dart';
import '../data_source/local/data_local_data_source.dart';
import '../data_source/remote/signup_remote_data_source.dart';
import '../locator.dart';
import '../models/merged_model.dart';
import '../models/signup_model.dart';

abstract class SignupService {
  Future<Result<SignupModel>> performSignup({
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
  Future<Result<SignupModel>> performSignup({
    String firstname,
    String lastname,
    String email,
    String username,
    String password,
  }) async {
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
        localDataSource.saveResponse(data: MergedModel(signupModel: response));
        return Result(success: response);
      } on ServerException catch (err) {
        return Result(error: ServerError(err.toString()));
      }
    } else {
      return Result(error: NoInternetError('No Internet Connection'));
    }
  }
}
