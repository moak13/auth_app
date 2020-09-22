import 'dart:convert';

import '../../core/persist/pref/pref_handler.dart';
import '../../locator.dart';
import '../../models/auth_model.dart';

/// This handles the storing and retriving of auth data
abstract class DataLocalDataSource {
  /// This gets the stored auth data
  Future<AuthModel> getResponse();

  /// This saves the retrived auth data
  Future<AuthModel> saveResponse({AuthModel data});

  /// This clears the stored auth data
  Future<AuthModel> deleteResponse();
}

final String key = 'data';

/// This is an implemetation of [LoginLocalDataSource] abstract class
class DataLocalDataSourceImpl implements DataLocalDataSource {
  final pref = locator<PrefHandler>();
  @override
  Future<AuthModel> getResponse() async {
    final data = await pref.getData(key: key);
    print('figuring out the data from local');
    print(data);
    print(data.toString());
    if (data != null) {
      final value = AuthModel.fromJson(json.decode(data));
      return Future.value(value);
    } else {
      final value = AuthModel(id: 0, token: '');
      return Future.value(value);
    }
  }

  @override
  Future<AuthModel> saveResponse({AuthModel data}) {
    print('json printing');
    print(data.toJson());
    final value = json.encode(data.toJson());
    print('encoded string');
    print(value);
    print('string printing');
    print(value.toString());
    pref.saveData(key: key, value: value);
    return Future.value(data);
  }

  @override
  Future<AuthModel> deleteResponse() {
    return pref.deleteData(key: key);
  }
}
