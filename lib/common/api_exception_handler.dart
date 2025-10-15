import 'package:dio/dio.dart';
import 'api_exceptions.dart';

class ApiExceptionHandler {
  static ApiException handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return NetworkException('Koneksi timeout, periksa jaringan Anda');

      case DioExceptionType.cancel:
        return NetworkException('Request dibatalkan');

      case DioExceptionType.badResponse:
        final status = e.response?.statusCode ?? 500;
        final msg = e.response?.data['message'] ?? 'Terjadi kesalahan';
        if (status == 401) {
          return UnauthorizedException(msg);
        } else if (status == 422) {
          return ApiFormatException(msg);
        } else {
          return ServerException(msg);
        }

      case DioExceptionType.unknown:
        return NetworkException('Tidak dapat terhubung ke server');

      case DioExceptionType.badCertificate:
        return NetworkException('Sertifikat tidak valid');

      case DioExceptionType.connectionError:
        return NetworkException('Terjadi kesalahan koneksi');
    }
  }
}
