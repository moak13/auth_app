import 'package:auth_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  final String userID= 'id';
  final String userNAME = 'name';
  final String userEMAIL = 'email';
  appPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  saveUser(User user) async {
    SharedPreferences preferences = appPrefs();
    preferences.setInt(userID, user.id ?? 0);
    preferences.setString(userNAME, user.name ?? '');
    preferences.setString(userEMAIL, user.email ?? '');
  }

  getUser() async {
    SharedPreferences preferences = appPrefs();
    preferences.getKeys();
  }

  getUserId() async {
    SharedPreferences preferences = appPrefs();
    preferences.getInt(userID);
  }

  deleteUser() async {
    SharedPreferences preferences = appPrefs();
    preferences.remove(userID);
  }
}
