import 'dart:convert';

import '../../core/persist/pref/pref_handler.dart';
import '../../locator.dart';
import '../../models/login_model.dart';
import '../../models/merged_model.dart';
import '../../models/signup_model.dart';

/// This handles the storing and retriving of token
abstract class DataLocalDataSource {
  /// This gets the stored token
  Future<MergedModel> getResponse();

  /// This saves the retrived token
  Future<MergedModel> saveResponse({MergedModel data});

  /// This clears the stored token
  Future<MergedModel> deleteResponse();
}

final String key = 'data';

/// This is an implemetation of [LoginLocalDataSource] abstract class
class DataLocalDataSourceImpl implements DataLocalDataSource {
  final pref = locator<PrefHandler>();
  @override
  Future<MergedModel> getResponse() {
    final data = pref.getData(key: key);
    print(data.toString());
    if (data != null) {
      final value = MergedModel.fromJson(json.encode(data));
      return Future.value(value);
    } else {
      return Future.value(
        MergedModel(
          loginModel: LoginModel(id: null, token: '', message: ''),
          signupModel: SignupModel(id: null, token: '', message: ''),
        ),
      );
    }
  }

  @override
  Future<MergedModel> saveResponse({MergedModel data}) {
    print(data.toJson());
    final value = json.decode(data.toJson());
    pref.saveData(key: key, value: value);
    return Future.value(data);
  }

  @override
  Future<MergedModel> deleteResponse() {
    return pref.deleteData(key: key);
  }
}
