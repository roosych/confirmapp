// ignore_for_file: depend_on_referenced_packages

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/main_config.dart';

abstract class PreferencesRepository {
  Future<String?> getToken();

  Future<void> saveToken(String token);

  Future<void> deleteToken();
}

@Injectable(as: PreferencesRepository)
class SharedPreferencesRepository extends PreferencesRepository {
  @override
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(MainConfig.tokenKey);
    return value;
  }

  @override
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MainConfig.tokenKey, token);
  }

  @override
  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(MainConfig.tokenKey);
  }
}
