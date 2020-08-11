import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/signup_model.dart';
import '../services/signup_service.dart';

class SignupViewModel extends BaseViewModel {
  final _signupService = locator<SignupService>();
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

  Future<Result<SignupModel>> signup(
      {String firstname,
      String lastname,
      String email,
      String username,
      String password}) async {
    setBusy(true);
    final response = await _signupService.performSignup(
        firstname: firstname,
        lastname: lastname,
        email: email,
        username: username,
        password: password);
    setBusy(false);
    if (response.success.id != null) {
      _navigationService.navigateTo('/home_view');
      // await _dialogService.showDialog(
      //   title: 'Yay!',
      //   description: response.success.message,
      //   buttonTitle: 'OK',
      // );
      await _dialogService.showConfirmationDialog(
        title: 'Yay!',
        description: response.success.message,
        cancelTitle: 'OK',
      );
      return response;
    } else {
      await _dialogService.showDialog(
        title: 'Error!',
        description: response.error.message,
        buttonTitle: 'OK',
      );
      return response;
    }
  }
}
