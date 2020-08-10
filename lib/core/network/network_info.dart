import 'package:data_connection_checker/data_connection_checker.dart';

import '../../locator.dart';

/// This checks if the user internet connection is available or not.
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// This is an implementation of the [NetworkInfo] abstract class
class NetworkInfoImpl implements NetworkInfo {
  final connectionChecker = locator<DataConnectionChecker>();
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
