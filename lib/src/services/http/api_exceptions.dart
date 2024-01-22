class AppException implements Exception {
  final String message;
  final String prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() => '$prefix : $message';
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, 'Erro durante comunicação');
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message, 'Requisição inválida');
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String message) : super(message, 'Não autorizado');
}

class InvalidInputException extends AppException {
  InvalidInputException(String message) : super(message, 'Entrada inválida');
}
