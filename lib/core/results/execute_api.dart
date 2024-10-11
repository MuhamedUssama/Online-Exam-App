import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../errors/exceptions.dart';
import 'result.dart';

Future<Result<T>> executeApi<T>(Future<Result<T>> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return result;
  } on DioError catch (ex) {
    ServerException serverException = ServerException(
        ex.response?.data['message'] ?? 'An unknown error occurred');
    return Fail(serverException);
  } on TimeoutException {
    return Fail(const NoInternetConnectionException());
  } on IOException {
    return Fail(const NoInternetConnectionException());
  }
}
