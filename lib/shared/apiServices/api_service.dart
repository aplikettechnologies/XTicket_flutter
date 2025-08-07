import 'dart:developer';
import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'api_exceptions.dart';
import 'api_method.dart';

class ApiServices {
  late final Dio _dio;

  ApiServices() {
    _dio = DioClient().dio;
  }

  Future<T> request<T>({
    required ApiMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    dynamic body,
    bool isFormData = false,
    ResponseType? responseType,
    required T Function(dynamic) parse,
  }) async {
    try {
      final dataToSend = isFormData ? FormData.fromMap(body ?? {}) : body;

      final options = Options(
        headers: headers,
        extra: extra ?? {},
        responseType: responseType,
      );

      log('➡️ API Request [${method.name}] $path');
      if (queryParameters != null) log('Query: $queryParameters');
      if (headers != null) log('Headers: $headers');

      late Response response;

      switch (method) {
        case ApiMethod.get:
          response = await _dio.get(path, queryParameters: queryParameters, options: options);
          break;
        case ApiMethod.post:
          response = await _dio.post(path, queryParameters: queryParameters, data: dataToSend, options: options);
          break;
        case ApiMethod.put:
          response = await _dio.put(path, queryParameters: queryParameters, data: dataToSend, options: options);
          break;
        case ApiMethod.delete:
          response = await _dio.delete(path, queryParameters: queryParameters, data: dataToSend, options: options);
          break;
      }

      log('✅ Status: ${response.statusCode}');
      log('✅ Data: ${response.data}');

      return parse(response.data);
    } on DioException catch (e) {
      log('❌ DioException: ${e.message}');
      throw ApiException.fromDioError(e);
    } catch (e) {
      log('❌ Unknown Exception: $e');
      throw ApiException('Unexpected error: $e');
    }
  }
}
