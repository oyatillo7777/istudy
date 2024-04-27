// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';

import 'appConstants.dart';


class DioConfig {
  static Dio? _dio;

  static Dio getDio() {
    _dio ??= Dio()
      ..options = BaseOptions(
        baseUrl: AppConstants.BASE_URL,
        connectTimeout: const Duration(seconds: 60), // 60 seconds
        receiveTimeout: const Duration(seconds: 300), // 300 seconds
      )
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          // Update the 'Authorization' header with the latest token
          return handler.next(options);
        },
        onError: (DioError e, handler) {
          handler.next(e);
        },
      ));
    return _dio!;
  }
}
