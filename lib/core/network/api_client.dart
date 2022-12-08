// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:mime_type/mime_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:cart_demo/core/config.dart';
import 'package:cart_demo/core/exceptions.dart';
import 'package:cart_demo/injection.dart';

class ApiClient {
  ApiClient() {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 1000 * 60, //60sec
      receiveTimeout: 1000 * 60, //60sec
      contentType: 'application/json',
      validateStatus: _validateStatus,
    );

    _dio ??= Dio(options);

    final token = localStorage.getString('bearerToken') ?? '';

    final presetHeaders = <String, String>{
      if (token.isNotEmpty) HttpHeaders.authorizationHeader: 'Bearer $token',
      Headers.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    _dio!.options.headers = presetHeaders;

    if (kDebugMode) {
      _dio!.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }
  final localStorage = locator<SharedPreferences>();

  void setAuthHeader() {
    final token = localStorage.getString('bearerToken') ?? '';
    _dio!.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
  }

  Dio? _dio;

  static String baseUrl = AppConfig.baseUrl;

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    setAuthHeader();
    try {
      final response = await _dio!.get(
        uri,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e, _) {
      throw ApiException.getException(e);
    }
  }

  Future<Response> post(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      setAuthHeader();
      final response = await _dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e, _) {
      throw ApiException.getException(e);
    }
  }

  Future<Response> formData(String uri, {var data}) async {
    var formData = FormData.fromMap(data);
    try {
      setAuthHeader();
      final response = await _dio!.post(
        uri,
        data: formData,
      );
      return response;
    } catch (e) {
      throw ApiException.getException(e);
    }
  }

  Future<Response> put(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    setAuthHeader();
    try {
      final response = await _dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e, _) {
      throw ApiException.getException(e);
    }
  }

  Future<Response> patch(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio!.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e, _) {
      throw ApiException.getException(e);
    }
  }

  Future<Response> delete(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    setAuthHeader();
    try {
      final response = await _dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e, _) {
      throw ApiException.getException(e);
    }
  }

  Future<Response> putFormData(String url, File requestBody) async {
    Response response;

    try {
      final dio = Dio(
        BaseOptions(
          contentType: mime(requestBody.path.split('/').last),
          connectTimeout: 1000 * 60, //60sec
          receiveTimeout: 1000 * 60, //60sec
          headers: {'Accept': '*/*'},
          validateStatus: (status) {
            return status! < 510;
          },
        ),
      );
      final uu = Uri.parse(url);
      response = await dio.put(
        uu.toString(),
        data:
            Stream.fromIterable(requestBody.readAsBytesSync().map((e) => [e])),
        options: Options(
          headers: {
            'Content-Length': requestBody.lengthSync().toString(),
            'Connection': 'keep-alive',
          },
        ),
      );
    } on DioError catch (e, _) {
      throw e.response?.statusMessage ?? 'connection bad gon';
    }
    return response;
  }

  // validate the status of a request
  bool _validateStatus(int? status) {
    return status! == 200 || status == 201 || status == 202;
  }
}

extension ResponseExtension on Response {
  bool get isSuccess {
    final is200 = statusCode == HttpStatus.ok;
    final is201 = statusCode == HttpStatus.created;
    final is202 = statusCode == HttpStatus.accepted;
    return is200 || is201 || is202;
  }
}
