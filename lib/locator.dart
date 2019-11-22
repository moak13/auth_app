import 'package:auth_app/data/api.dart';
import 'package:get_it/get_it.dart';

import 'data/authentication_service.dart';

GetIt locator;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
}
