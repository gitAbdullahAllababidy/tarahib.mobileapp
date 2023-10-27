import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:tarahib_mobile_app/app/app.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/response_data_object/response_data_object.dart';

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

  Future<Either<dynamic, ResponseDataObject>?> postRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    List<Interceptor>? interceptors,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
     ResponseDataObject? responseDataObject;
    try {
      if (interceptors is List<Interceptor>) {
        _dio.interceptors.addAll(interceptors);
      }
      final res = await _dio.post<Map>(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onReceiveProgress,
          onReceiveProgress: onReceiveProgress);
      final resData = res.data as Map<String, dynamic>;
      responseDataObject = ResponseDataObject.fromMap(resData);

      return right(responseDataObject);
    } on Exception catch (e) {
      if (e is DioException) {
        return _dioExceptionHandler(e, responseDataObject);
      }
      return left(e);
    } finally {}
  }

  ///Dio Exception handler
  Either<dynamic, ResponseDataObject<dynamic>> _dioExceptionHandler(
      DioException e, ResponseDataObject<dynamic>? responseDataObject) {
    return switch (e.type) {
      DioExceptionType.badResponse => left(responseDataObject),
      DioExceptionType.connectionTimeout => left(e),
      DioExceptionType.sendTimeout => left(e),
      DioExceptionType.receiveTimeout => left(e),
      DioExceptionType.badCertificate => left(e),
      DioExceptionType.cancel => left(e),
      DioExceptionType.connectionError => left(e),
      DioExceptionType.unknown => left(e),
    };
  }
}
