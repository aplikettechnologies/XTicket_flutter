import 'package:dio/dio.dart';
import 'app_env_config.dart';
import 'auth_interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio dio;
  bool _initialized = false;

  DioClient._internal();

  Future<void> init({Future<void> Function()? onTokenExpired}) async {
    if (_initialized) return; // prevent double init

    dio = Dio(
      BaseOptions(
        baseUrl: AppEnvConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(onTokenExpired: onTokenExpired),
      LogInterceptor(
        responseBody: true,
        error: true,
        requestBody: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
      ),
    ]);

    _initialized = true;
  }
}
