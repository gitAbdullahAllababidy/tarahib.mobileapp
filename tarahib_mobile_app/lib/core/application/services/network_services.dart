import 'package:dio/dio.dart';

final class NetworkService {
  final _dio = Dio();

  NetworkService() {
    _dio.options = BaseOptions();
  }
}
