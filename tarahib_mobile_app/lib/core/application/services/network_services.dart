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

  Future<Response<T>> getRequest<T>(
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

      return _dio.get<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    } on Exception {
      rethrow;
    }
  }
}
