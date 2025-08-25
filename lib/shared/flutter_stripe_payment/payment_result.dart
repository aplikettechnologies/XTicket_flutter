// payment_result.dart
class PaymentResult {
  final bool success;
  final String message;
  final String? paymentId;
  final String? errorCode;
  final dynamic data;

  PaymentResult({
    required this.success,
    required this.message,
    this.paymentId,
    this.errorCode,
    this.data,
  });

  factory PaymentResult.success({
    required String message,
    String? paymentId,
    dynamic data,
  }) {
    return PaymentResult(
      success: true,
      message: message,
      paymentId: paymentId,
      data: data,
    );
  }

  factory PaymentResult.failure({required String message, String? errorCode}) {
    return PaymentResult(
      success: false,
      message: message,
      errorCode: errorCode,
    );
  }

  @override
  String toString() {
    return 'PaymentResult(success: $success, message: $message, paymentId: $paymentId, errorCode: $errorCode)';
  }
}
