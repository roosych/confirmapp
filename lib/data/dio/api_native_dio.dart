import 'package:dio/io.dart';

import 'dio_interceptors.dart';

class ApiDio extends DioForNative {
  ApiDio() : super() {
    interceptors.addAll(DioInterceptors().interceptors);
  }
}
