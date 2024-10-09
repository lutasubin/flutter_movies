import 'package:dio/dio.dart';
import 'package:flutter_firebase/core/services/logger_services.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Xử lý lỗi
    printF('Request failed: ${err.message}');
    if (err.response != null) {
      printF('Error response data: ${err.response?.data}');
    }
    return handler.next(err); // tiếp tục thực thi lỗi
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final data = response.data;
    printF('thhhh');
    // print('datarespon:$data');
    final requestOptions = response.requestOptions;
    // printS('thang');
    printF(
      "[RESPONSE][Code: $statusCode] Api: ${requestOptions.path} | Method: ${requestOptions.method} | Query parameter: ${requestOptions.queryParameters} | Body request data: ${requestOptions.data} | Data response: $data",
    );
    return handler.next(response); // tiếp tục thực thi phản hồi
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    printF(
        "[REQUEST] Api: ${options.path} | Method: ${options.method} | \nQuery parameter: ${options.queryParameters} | Body request data: ${options.data}");
    super.onRequest(options, handler);
  }
}
