import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced_template/errors/api.error.dart';
import 'package:flutter_advanced_template/utils/logs.dart' as logger;

abstract class ApiModel {
  static final defaultBaseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    receiveDataWhenStatusError: true,
  );

  late final Dio _dio;

  ApiModel({BaseOptions? options, Map<String, dynamic>? headers}) {
    _dio = Dio();
    _dio.options = options?.copyWith(headers: headers) ?? defaultBaseOptions.copyWith(headers: headers);
  }

  Future<Response> _errorHandler(Future<Response> request) async {
    try {
      final result = await request;
      return result;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionTimeout:
          throw TimeoutException(e.message);
        case DioExceptionType.connectionError:
          throw ConnectionError(e.message);
        case DioExceptionType.badCertificate:
          throw BadCertificateException(e.message);
        case DioExceptionType.badResponse:
          throw BadResponseException(e.message);
        case DioExceptionType.cancel:
          throw FetchCancelledException(e.message);
        case DioExceptionType.unknown:
          rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  @protected
  void logIfDebugging(Object? message) => logger.logIfDebugging("ApiModel => $message");

  @protected
  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _errorHandler(_dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ));

  @protected
  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) =>
      _errorHandler(_dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ));

  @protected
  Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) =>
      _errorHandler(_dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ));

  @protected
  Future<Response> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      _errorHandler(_dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ));

  @protected
  Future<Response> download(
    String path,
    dynamic savePath, {
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) =>
      _errorHandler(_dio.download(
        path,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: options,
      ));
}
