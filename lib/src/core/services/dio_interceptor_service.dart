import 'dart:developer';

import 'package:dio/dio.dart';

class DioInterceptorService extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("OnRequest Starts ====================", name: "OnRequest");
    log("uri: ${options.uri}", name: "OnRequest");
    log("headers: ${options.headers}", name: "OnRequest");
    log("method: ${options.method}", name: "OnRequest");
    log("queryParameters: ${options.queryParameters}", name: "OnRequest");
    log("data: ${options.data}", name: "OnRequest");
    log("OnRequest Ends ====================", name: "OnRequest");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("onError Starts ====================", name: "onError");
    log("uri: ${err.response?.realUri}", name: "onError");
    log("type: ${err.type}", name: "onError");
    log("response: ${err.response}", name: "onError");
    log("message: ${err.message}", name: "onError");
    log("error: ${err.error}", name: "onError");
    log("stackTrace: ${err.stackTrace}", name: "onError");
    log("onError Ends ====================", name: "onError");
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("onResponse Starts ====================", name: "onResponse");
    log("uri: ${response.realUri}", name: "onResponse");
    log("statusCode: ${response.statusCode}", name: "onResponse");
    log("statusMessage: ${response.statusMessage}", name: "onResponse");
    log("data: ${response.data}", name: "onResponse");
    log("onResponse Ends ====================", name: "onResponse");
    super.onResponse(response, handler);
  }
}
