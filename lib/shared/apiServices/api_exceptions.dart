import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:xticket/routes/app_routes.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic responseData;

  ApiException(this.message, {this.statusCode, this.responseData});

  factory ApiException.fromDioError(DioException error) {
    final responseData = error.response?.data;
    final statusCode = error.response?.statusCode;

    String errorMessage = 'Server error occurred';
    if (responseData is Map && responseData['message'] != null) {
      errorMessage = responseData['message'];
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException('Please check your internet connection.');
      case DioExceptionType.sendTimeout:
        return ApiException('Request timeout. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ApiException('Response timeout. Please try again.');
      case DioExceptionType.badResponse:
        if (statusCode == 401) {
          Get.offAllNamed(AppRoutes.login);
          return ApiException('Unauthorized. Please login again.');
        } else if (statusCode == 403) {
          return ApiException('Access denied.', statusCode: statusCode);
        } else if (statusCode == 404) {
          return ApiException('Resource not found.', statusCode: statusCode);
        } else if (statusCode == 500) {
          return ApiException('Internal server error.', statusCode: statusCode);
        }
        return ApiException(errorMessage, statusCode: statusCode);
      case DioExceptionType.cancel:
        return ApiException('Request was cancelled.');
      case DioExceptionType.connectionError:
        return ApiException('No internet connection.');
      default:
        return ApiException('Unexpected error: ${error.message}');
    }
  }

  @override
  String toString() => message;
}
