import '../core/error/exceptions.dart';
import '../core/network/network_info.dart';
import '../core/utils/result.dart';
import '../data_source/local/user_local_data_source.dart';
import '../data_source/remote/user_remote_data_source.dart';
import '../locator.dart';
import '../models/user_model.dart';

abstract class UserService {
  Future<Result<UserModel>> performUserFetch();
}

class UserServiceImpl implements UserService {
  final _remoteData = locator<UserRemoteDataSource>();
  final _localData = locator<UserLocalDataSource>();
  final _networkInfo = locator<NetworkInfo>();
  @override
  Future<Result<UserModel>> performUserFetch() async {
    bool networkInfo = await _networkInfo.isConnected;
    if (networkInfo) {
      try {
        final response = await _remoteData.fetchUser();
        _localData.saveUser(data: response);
        return Result(success: response);
      } on ServerException catch (e) {
        return Result(error: ServerError(e.message));
      }
    } else {
      try {
        final response = await _localData.getUser();
        return Result(
            success: response,
            error: NoInternetError('No Internet Connection'));
      } on CacheException catch (e) {
        return Result(error: CacheError(e.message));
      }
    }
  }
}
