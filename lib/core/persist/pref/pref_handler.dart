import 'package:shared_preferences/shared_preferences.dart';

import '../../../locator.dart';

/// This handles the storing and retriving of data
abstract class PrefHandler {
  /// This gets the stored data
  Future<String> getData({String key});

  /// This saves the retrived data
  Future<void> saveData({String key, String value});

  /// This clears the stored data
  Future<void> deleteData({String key});
}

/// This is an implemetation of [PrefHandler] abstract class
class PrefHandlerImpl implements PrefHandler {
  final pref = locator<SharedPreferences>();
  @override
  Future<String> getData({String key}) async {
    return pref.getString(key);
  }

  @override
  Future<void> saveData({String key, String value}) {
    return pref.setString(key, value);
  }

  @override
  Future<void> deleteData({String key}) {
    return pref.remove(key);
  }
}
