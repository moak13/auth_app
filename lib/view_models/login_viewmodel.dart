import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/auth_model.dart';
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

  Future<Result<AuthModel>> login({String email, String password}) async {
    setBusy(true);
    final response =
        await _loginService.performLogin(email: email, password: password);
    setBusy(false);
    if (response.success != null) {
      _navigationService.pushNamedAndRemoveUntil('/home-view');
      await _dialogService.showDialog(
        title: 'Yea!',
        description: response.success.message,
        buttonTitle: 'OK',
      );
      return response;
    } else {
      await _dialogService.showDialog(
        title: 'Opps!',
        description: response.error.message,
        buttonTitle: 'OK',
      );
      return response;
    }
  }
}
