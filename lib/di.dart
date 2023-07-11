import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'data/dio/api_native_dio.dart';
import 'data/models/env_config.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies({String env = Environment.dev, required Config config}) {
  getIt.init(environment: env);
  getIt.registerSingleton<Dio>(ApiDio());
  getIt.registerSingleton<Config>(config);
}
