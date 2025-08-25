class PaymentException implements Exception {
  final String message;
  final String code;
  const PaymentException(this.message, this.code);

  @override
  String toString() => 'PaymentException: $message (Code: $code)';
}

class ValidationException extends PaymentException {
  const ValidationException(String message) : super(message, 'VALIDATION_ERROR');
}

class NetworkException extends PaymentException {
  const NetworkException(String message) : super(message, 'NETWORK_ERROR');
}

class InitializationException extends PaymentException {
  const InitializationException(String message)
      : super(message, 'INITIALIZATION_ERROR');
}
