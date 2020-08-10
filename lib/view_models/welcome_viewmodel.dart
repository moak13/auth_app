import 'package:auth_app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  /// This handles the movement to the login screen
  moveToLogin() {
    navigationService.navigateTo('/login-view');
  }

  /// This handles the movement to the signup screen
  moveToSignup() {
    navigationService.navigateTo('/signup-view');
  }
}
