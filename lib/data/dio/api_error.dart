import 'package:dio/dio.dart';

class ApiError extends DioException {
  ApiError({required DioException error, required super.message})
      : super(
          type: error.type,
          error: error.error,
          response: error.response,
          requestOptions: error.requestOptions,
        );

  @override
  String toString() =>
      '$message, ${requestOptions.method}, ${requestOptions.path.toString()}, ${requestOptions.queryParameters}, ${requestOptions.data.toString()}';
}

class ConnectionError extends DioException {
  ConnectionError({required DioException error, required super.message})
      : super(
          type: error.type,
          error: error.error,
          response: error.response,
          requestOptions: error.requestOptions,
        );

  @override
  String toString() => '$message, ${requestOptions.method}, ${requestOptions.path.toString()}';
}
