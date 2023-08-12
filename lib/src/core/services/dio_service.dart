import 'package:blog_app/src/core/constants/end_points.dart';
import 'package:blog_app/src/core/services/dio_interceptor_service.dart';
import 'package:dio/dio.dart';

class DioService {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    _dio.interceptors.add(DioInterceptorService());
  }

  static Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    return _dio.get(
      path,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
