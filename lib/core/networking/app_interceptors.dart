import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../cache/shared_preferences.dart';
import '../constants/app_constants.dart';
import 'api_constants.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token =
        await SharedPreferencesHelper.getSecuredString(key: AppConstants.token);
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers[ApiConstants.contentType] = ApiConstants.applicationJson;
    options.headers[AppConstants.token] = token;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
