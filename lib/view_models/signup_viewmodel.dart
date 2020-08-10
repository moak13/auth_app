import 'package:stacked/stacked.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/signup_model.dart';
import '../services/signup_service.dart';

class SignupViewModel extends BaseViewModel {
  final signupService = locator<SignupService>();

  Future<Result<SignupModel>> signup(
      {String firstname,
      String lastname,
      String email,
      String username,
      String password}) async {
    final response = await signupService.performSignup(
        firstname: firstname,
        lastname: lastname,
        email: email,
        username: username,
        password: password);
    print(response.success);
    print(response.error);
    return response;
  }
}
