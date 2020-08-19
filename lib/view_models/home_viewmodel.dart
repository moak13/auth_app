import 'package:auth_app/data_source/local/data_local_data_source.dart';
import 'package:auth_app/data_source/local/user_local_data_source.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class HomeViewModel extends FutureViewModel<Result<UserModel>> {
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _dataLocalData = locator<DataLocalDataSource>();
  final _userLocalData = locator<UserLocalDataSource>();
  final _dialogService = locator<DialogService>();
  @override
  Future<Result<UserModel>> futureToRun() {
    final response = _userService.performUserFetch();
    return response;
  }

  logout() async {
    await _userLocalData.deleteUser();
    await _dataLocalData.deleteResponse();
    _navigationService.pushNamedAndRemoveUntil('/login-view');
    _dialogService.showDialog(
      title: 'Info',
      description: 'Logout Successful',
      buttonTitle: 'OK',
    );
  }
}
