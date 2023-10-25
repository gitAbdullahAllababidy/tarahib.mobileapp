import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:tarahib_mobile_app/app/app.dart';

final class NetworkService {
  final _dio = Dio();

  NetworkService() {
    _dio
      ..interceptors.addAll([
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: true,
          ),
        ),
      ])
      ..options = BaseOptions(
        baseUrl: App.devSettings.$2,
      );
  }

  Future<Response<Map>> getRequest(
    String path, {
    Object? data,
    List<Interceptor>? interceptors,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    try {
      if (interceptors is List<Interceptor>) {
        _dio.interceptors.addAll(interceptors);
      }

      return _dio.get<Map>(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    } on Exception {
      rethrow;
    }
  }

  Future<Response<Map>> postRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    List<Interceptor>? interceptors,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    try {
      if (interceptors is List<Interceptor>) {
        _dio.interceptors.addAll(interceptors);
      }
      return _dio.post<Map>(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onReceiveProgress,
          onReceiveProgress: onReceiveProgress);
    } on Exception {
      rethrow;
    }
  }
}
