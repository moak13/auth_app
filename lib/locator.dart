import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/network/network_handler.dart';
import 'core/network/network_info.dart';
import 'core/persist/pref/pref_handler.dart';
import 'data_source/local/data_local_data_source.dart';
import 'data_source/local/user_local_data_source.dart';
import 'data_source/remote/login_remote_data_source.dart';
import 'data_source/remote/signup_remote_data_source.dart';
import 'data_source/remote/user_remote_data_source.dart';
import 'services/login_service.dart';
import 'services/signup_service.dart';
import 'services/user_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => pref);
  locator.registerLazySingleton<PrefHandler>(() => PrefHandlerImpl());
  locator.registerLazySingleton<DataLocalDataSource>(
      () => DataLocalDataSourceImpl());
  locator.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl());
  locator.registerLazySingleton(() => DataConnectionChecker());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  locator.registerLazySingleton<NetworkHandler>(() => NetworkHandlerImpl());
  locator.registerLazySingleton<LoginService>(() => LoginServiceImpl());
  locator.registerLazySingleton<SignupService>(() => SignupServiceImpl());
  locator.registerLazySingleton<UserService>(() => UserServiceImpl());
  locator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());
  locator.registerLazySingleton<SignupRemoteDataSource>(
      () => SignupRemoteDataSourceImpl());
  locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());
}
