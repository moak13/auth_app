import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/login_model.dart';
import '../services/login_service.dart';

class LoginViewModel extends BaseViewModel {
  final _loginService = locator<LoginService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  bool _isPassword = true;
  bool get isPassword => _isPassword;

  void popPage() {
    _navigationService.back();
  }

  void toggle() {
    _isPassword = !_isPassword;
    notifyListeners();
  }

  Future<Result<LoginModel>> login({String email, String password}) async {
    setBusy(true);
    final response =
        await _loginService.performLogin(email: email, password: password);
    setBusy(false);
    print('in viewmodel');
    print(response.success.id);
    if (response.success.id != null) {
      print('Login Success!');
      _navigationService.navigateTo('/home-view');
      await _dialogService.showDialog(
        title: 'Yea!',
        description: response.success.message,
        buttonTitle: 'OK',
      );
      return response;
    } else {
      print('Login Error!');
      await _dialogService.showDialog(
        title: 'Opps!',
        description: response.error.message,
        buttonTitle: 'OK',
      );
      return response;
    }
  }
}
