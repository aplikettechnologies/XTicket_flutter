import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../data/localstorage/app_local_storage.dart';
import '../appStorage/app_storage_key.dart';

class AuthInterceptor extends Interceptor {
  final Future<void> Function()? onTokenExpired;
  final AppStorage _storage = AppStorage();

  AuthInterceptor({this.onTokenExpired});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final requiresAuth = options.extra['requiresAuth'] ?? true;

    if (requiresAuth) {
      final token = await _storage.read(AppStorageKey.userToken);
      if (token?.isNotEmpty == true) {
        options.headers['Authorization'] = 'Bearer $token';
        if (kDebugMode) {
          log("Token attached: Bearer $token");
        }
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final requiresAuth = err.requestOptions.extra['requiresAuth'] ?? true;

    if (requiresAuth && err.response?.statusCode == 401 && onTokenExpired != null) {
      if (kDebugMode) {
        log("401 Unauthorized - Handling token expiry");
      }
      await onTokenExpired!();
    }

    handler.next(err);
  }
}
