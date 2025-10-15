import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../common/api_config.dart';
import '../common/api_exception_handler.dart';
import '../common/api_exceptions.dart';
import '../common/endpoints.dart';
import '../common/http_utils.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiConfig.baseUrl,
              connectTimeout: ApiConfig.connectTimeout,
              receiveTimeout: ApiConfig.receiveTimeout,
              headers: {'Content-Type': 'application/json'},
            ),
          ) {
    if (!kReleaseMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
        ),
      );
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        Endpoints.login,
        data: {'email': email, 'password': password},
      );

      if (isSuccessStatusCode(response.statusCode)) {
        return response.data;
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('Email atau password salah');
      } else {
        throw ServerException(
          'Terjadi kesalahan server. Code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw ApiExceptionHandler.handleDioException(e);
    }
  }

  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String noTelepon,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        Endpoints.register,
        data: {
          'username': username,
          'email': email,
          'no_telepon_pribadi': noTelepon,
          'password': password,
        },
      );
      if (isSuccessStatusCode(response.statusCode)) {
        return response.data;
      } else {
        throw ServerException(
          'Terjadi kesalahan server. Code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw ApiExceptionHandler.handleDioException(e);
    }
  }
}
