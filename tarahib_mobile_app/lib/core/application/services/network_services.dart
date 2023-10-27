import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:tarahib_mobile_app/app/app.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/response_data_object/response_data_object.dart';
import 'package:tarahib_mobile_app/core/types/types.dart';

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

  Future<AppResponseType<ResponseDataObject>> getRequest(
    String path, {
    Object? data,
    List<Interceptor>? interceptors,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    ResponseDataObject? responseDataObject;
    try {
      if (interceptors is List<Interceptor>) {
        _dio.interceptors.addAll(interceptors);
      }
      final res = await _dio.get<Map>(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      final resData = res.data as Map<String, dynamic>;
      responseDataObject = ResponseDataObject.fromMap(resData);

      return right(responseDataObject);
    } on Exception catch (e) {
      if (e is DioException) {
        return _dioExceptionHandler(e);
      }

      return left(e);
    }
  }

  Future<AppResponseType<ResponseDataObject>> postRequest(
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
        return _dioExceptionHandler(e);
      }

      return left(e);
    }
  }

  ///Dio Exception handler
  Either<dynamic, ResponseDataObject> _dioExceptionHandler(
    DioException e,
  ) {
    return switch (e.type) {
      DioExceptionType.badResponse => _responseDataObjectError(e),
      _ => left(e)
    };
  }

  AppResponseType<ResponseDataObject> _responseDataObjectError(DioException e) {
    final errorResponseDataObject =
        ResponseDataObject.fromMap(e.response?.data ?? {});
    return left(errorResponseDataObject);
  }
}
