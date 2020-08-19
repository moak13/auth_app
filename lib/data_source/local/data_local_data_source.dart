import 'dart:convert';

import '../../core/persist/pref/pref_handler.dart';
import '../../locator.dart';
import '../../models/auth_model.dart';

/// This handles the storing and retriving of data
abstract class DataLocalDataSource {
  /// This gets the stored data
  Future<AuthModel> getResponse();

  /// This saves the retrived data
  Future<AuthModel> saveResponse({AuthModel data});

  /// This clears the stored data
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
      final value = AuthModel.fromJson(json.encode(data));
      return Future.value(value);
    } else {
      final authData = AuthModel.fromJson(data);
      final value = AuthModel(id: authData.id, token: authData.token);
      return Future.value(value);
    }
  }

  @override
  Future<AuthModel> saveResponse({AuthModel data}) {
    print('json printing');
    print(data.toJson());
    Map<String, dynamic> c = {
      'token': data.token,
      'user_id': data.id,
    };
    print(c.toString());
    final value = json.decode(c.toString());
    print('string printing');
    print(value.toString());
    pref.saveData(key: key, value: value.toString());
    return Future.value(data);
  }

  @override
  Future<AuthModel> deleteResponse() {
    return pref.deleteData(key: key);
  }
}
