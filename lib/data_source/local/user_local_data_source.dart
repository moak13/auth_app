import 'dart:convert';

import '../../core/persist/pref/pref_handler.dart';
import '../../locator.dart';
import '../../models/user_model.dart';

/// This handles the storing and retriving of user data
abstract class UserLocalDataSource {
  /// This gets the stored user data
  Future<UserModel> getUser();

  /// This saves the retrived user data
  Future<UserModel> saveUser({UserModel data});

  /// This clears the stored user data
  Future<bool> deleteUser();
}

final String key = 'userData';

/// This is an implemetation of [UserLocalDataSource] abstract class
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final pref = locator<PrefHandler>();

  @override
  Future<UserModel> getUser() async {
    final data = await pref.getData(key: key);
    if (data != null) {
      final value = UserModel.fromJson(json.decode(data));
      return Future.value(value);
    } else {
      final value = UserModel(
        id: 0,
        firstname: '',
        lastname: '',
        email: '',
        username: '',
      );
      return Future.value(value);
    }
  }

  @override
  Future<UserModel> saveUser({UserModel data}) {
    final value = json.encode(data.toJson());
    pref.saveData(key: key, value: value);
    return Future.value(data);
  }

  @override
  Future<bool> deleteUser() {
    return pref.deleteData(key: key);
  }
}
