import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/utils/result.dart';
import '../data_source/local/data_local_data_source.dart';
import '../data_source/local/user_local_data_source.dart';
import '../locator.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class HomeViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _dataLocalData = locator<DataLocalDataSource>();
  final _userLocalData = locator<UserLocalDataSource>();
  final _dialogService = locator<DialogService>();
  UserModel _userModel;
  UserModel get userModel => _userModel;
  String _userError;
  String get userError => _userError;

  Future<Result<UserModel>> fetchUser() async {
    setBusy(true);
    final response = await _userService.performUserFetch();
    setBusy(false);
    print('Checking response data from home view model');
    print(response);
    if (response.success != null) {
      _userModel = response.success;
      notifyListeners();
    } else {
      _userError = response.error.message;
      notifyListeners();
    }

    return response;
  }

  Future<bool> logout() async {
    final authResponse = await _dataLocalData.deleteResponse();
    print(authResponse);
    final userResponse = await _userLocalData.deleteUser();
    print(userResponse);
    _navigationService.pushNamedAndRemoveUntil('/login-view');
    _dialogService.showDialog(
      title: 'Info',
      description: 'Logout Successful',
      buttonTitle: 'OK',
    );
  }
}
