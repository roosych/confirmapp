import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/data/models/env_config.dart';
import 'package:test_app/data/models/user.dart';

import 'pref_repository.dart';

abstract class AuthRepository {
  Future<User?> signIn({
    required String username,
    required String password,
    required String deviceId,
  });
}

@Injectable(as: AuthRepository)
class ApiAuthRepository implements AuthRepository {
  final Dio _dio;
  final Config _config;
  final PreferencesRepository _preferencesRepository;

  ApiAuthRepository(this._dio, this._preferencesRepository, this._config);

  @override
  Future<User?> signIn({
    required String username,
    required String password,
    required String deviceId,
  }) async {
    final params = {
      'username': username,
      'password': password,
      'deviceid': deviceId,
    };
    var response = await _dio.post(
      '${_config.serverUrl}/ConfirmationApp/Login/',
      data: params,
    );
    User? user = response.data != null ? User.fromJson(jsonDecode(response.data)) : null;
    if (user != null) {
      await _preferencesRepository.saveToken(user.TransactionId);
    }
    return user;
  }
}
