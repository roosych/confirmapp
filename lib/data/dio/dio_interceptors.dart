import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/logging.dart';
import 'package:test_app/main_config.dart';

import 'api_error.dart';

class DioInterceptors {
  final _logger = getLogger(DioInterceptors);
  PackageInfo? _packageInfo;
  BaseDeviceInfo? _deviceInfo;
  List<Interceptor> interceptors = [];

  DioInterceptors() {
    interceptors.addAll([
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.request,
          hitCacheOnErrorExcept: [401, 403],
          maxStale: const Duration(days: 1),
          priority: CachePriority.normal,
          cipher: null,
          keyBuilder: CacheOptions.defaultCacheKeyBuilder,
          allowPostMethod: true,
        ),
      ),
      PrettyDioLogger(
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        responseHeader: kDebugMode,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
      InterceptorsWrapper(
        onRequest: (requestOptions, requestHandler) async {
          final localStorage = await SharedPreferences.getInstance();
          if (localStorage.containsKey(MainConfig.tokenKey)) {
            final token = localStorage.getString(MainConfig.tokenKey);
            requestOptions.headers['TransactionId'] = '$token';
          }
          requestOptions.headers['User-Agent'] = await _getUserAgent();
          return requestHandler.next(requestOptions);
        },
        onError: (dioError, errorHandler) {
          if (dioError.type == DioExceptionType.connectionTimeout ||
              dioError.type == DioExceptionType.sendTimeout ||
              dioError.type == DioExceptionType.receiveTimeout ||
              dioError.error?.runtimeType == SocketException) {
            return errorHandler.next(ConnectionError(
              error: dioError,
              message: 'Connection error',
            ));
          }
          final response = dioError.response;
          if (response != null) {
            final statusCode = response.statusCode;
            if (statusCode != null &&
                statusCode >= HttpStatus.badRequest &&
                statusCode <= HttpStatus.internalServerError) {
              if (response.data != null) {
                Map<String, dynamic>? map;
                if (response.data is String) {
                  try {
                    map = json.decode(response.data) as Map<String, dynamic>;
                  } catch (e, st) {
                    _logger.severe(
                      'Error occurred while parsing error response',
                      e,
                      st,
                    );
                  }
                } else {
                  map = response.data as Map<String, dynamic>;
                }
                final message =
                    map?['reason'] ?? map?['message'] ?? 'Unknown error';
                return errorHandler.next(ApiError(
                  error: dioError,
                  message: message,
                ));
              }
            }
          }
          return errorHandler.next(dioError);
        },
      ),
    ]);
  }

  FutureOr<PackageInfo> _getPackageInfo() async {
    if (_packageInfo != null) {
      return _packageInfo!;
    }
    return _packageInfo = await PackageInfo.fromPlatform();
  }

  FutureOr<BaseDeviceInfo> _getDeviceInfo() async {
    if (_deviceInfo != null) {
      return _deviceInfo!;
    }
    return _deviceInfo = await DeviceInfoPlugin().deviceInfo;
  }

  FutureOr<String> _getUserAgent() async {
    final packageInfo = await _getPackageInfo();
    final deviceDetails = await _getDeviceInfo();
    return '${packageInfo.packageName}/${packageInfo.version}'
        '(${packageInfo.buildNumber})/(${deviceDetails.toString()})';
  }
}
