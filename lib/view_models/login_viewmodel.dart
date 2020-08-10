import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/login_model.dart';
import '../services/login_service.dart';

class LoginViewModel extends BaseViewModel {
  final loginService = locator<LoginService>();
  final navigationService = locator<NavigationService>();

  bool _isPassword = true;
  bool get isPassword => _isPassword;

  void popPage() {
    navigationService.back();
  }

  void toggle() {
    _isPassword = !_isPassword;
    notifyListeners();
  }

  Future<Result<LoginModel>> login({String email, String password}) async {
    final response =
        await loginService.performLogin(email: email, password: password);
    print(response);
    return response;
  }
}
