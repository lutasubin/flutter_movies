import 'package:dio/dio.dart';
import 'package:flutter_firebase/core/apis/dio_interceptors/logging_interceptor.dart';
import 'package:flutter_firebase/core/apis/dio_interceptors/token_interceptor.dart';
import 'package:flutter_firebase/core/utils/dot_env_until.dart';

class DioClient {
  late Dio dio;
  final baseUrl = DotEnvUtil.hostApi + DotEnvUtil.apiVesion;
  DioClient() {
    initDio();
  }

  void initDio() {
    dio = Dio();
//! cau hinh global
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 8),
      connectTimeout: const Duration(seconds: 3),
    );
    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(TokenInterceptor());
  }
}
