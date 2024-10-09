import 'package:dio/dio.dart';
import 'package:flutter_firebase/core/utils/dot_env_until.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Thêm header Authorization cho mỗi yêu cầu
    final apiKey = DotEnvUtil.apiKey;
    options.headers["Authorization"] = "Bearer $apiKey";
    return handler.next(options); // tiếp tục thực thi yêu cầu
  }
}