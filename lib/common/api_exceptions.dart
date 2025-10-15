class ApiException implements Exception {
  final int code;
  final String message;
  const ApiException({required this.code, required this.message});
  @override
  String toString() => 'ApiException($code): $message';
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException(String message)
    : super(code: 401, message: message);
}

class NetworkException extends ApiException {
  const NetworkException(String message) : super(code: 0, message: message);
}

class ServerException extends ApiException {
  const ServerException(String message) : super(code: 500, message: message);
}

class ApiFormatException extends ApiException {
  const ApiFormatException(String message) : super(code: 422, message: message);
}
