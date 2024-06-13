import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fit_page/helper/strings/api_endpoints.dart';
import 'package:fit_page/helper/strings/app_strings.dart';

class NetworkHandler {
  late Dio _dio; // Declare Dio instance as late

  NetworkHandler() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    initializeInterceptors();
  }

  void initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        log('Error: ${error.message}');
        handler.next(error);
      },
      onRequest: (request, handler) {
        log('Request Path: ${request.path}');
        handler.next(request);
      },
      onResponse: (response, handler) {
        log('Response: ${response.data}');
        handler.next(response);
      },
    ));
  }

  Future<dynamic> getRequest(String url) async {
    try {
      Response response = await _dio.get(url);
      return response.data;
    } on DioExceptionType catch (e) {
      return handleError(e);
    }
  }

  Future<dynamic> postRequest(String url, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response.data;
    } on DioExceptionType catch (e) {
      return handleError(e);
    }
  }

  dynamic handleError(DioExceptionType error) {
    String errorDescription = '';
    if (error == DioExceptionType.cancel) {
      errorDescription = AppStrings.networkError;
    } else if (error == DioExceptionType.connectionTimeout) {
      errorDescription = AppStrings.timeoutError;
    } else if (error == DioExceptionType.receiveTimeout) {
      errorDescription = AppStrings.timeoutError;
    } else if (error == DioExceptionType.unknown) {
      errorDescription = AppStrings.networkError;
    } else {
      errorDescription = AppStrings.unexpectedError;
    }
    log('DioError: $errorDescription');
    return errorDescription;
  }
}
