import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../common/api_config.dart';

class AuthRepository {
  final Dio _dio;
  bool _isSuccess(int? code) => code != null && code >= 200 && code < 300;

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
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      debugPrint('response status ${response.statusCode}');
      if (_isSuccess(response.statusCode)) {
        return response.data;
      } else {
        throw Exception('${response.statusCode}: ${response.statusMessage} ');
      }
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? e.message;
      final statusCode = e.response?.statusCode;

      throw Exception('Error $statusCode: $message');
    }
  }
}
