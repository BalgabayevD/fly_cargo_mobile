import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @Named('private-dio')
  @lazySingleton
  Dio getPrivateDio(
    @Named('log-interceptor') Interceptor logInterceptor,
    @Named('auth-interceptor') Interceptor authInterceptor,
  ) {
    final dio = Dio(
      FlutterBetterAuth.dioClient.options.copyWith(
        receiveTimeout: const Duration(seconds: 420),
        sendTimeout: const Duration(
          seconds: 420,
        ),
      ),
    );
    dio.interceptors.addAll([logInterceptor, authInterceptor]);
    return dio;
  }

  @Named('payment-dio')
  @lazySingleton
  Dio getPaymentDio(
    @Named('log-interceptor') Interceptor logInterceptor,
    @Named('auth-interceptor') Interceptor authInterceptor,
    ApiConfig apiConfig,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: apiConfig.gatewayBaseUrl,
        receiveTimeout: const Duration(seconds: 420),
        sendTimeout: const Duration(seconds: 420),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    
    // Важно: auth перед log, чтобы токен добавлялся первым
    dio.interceptors.addAll([authInterceptor, logInterceptor]);
    
    // Настройка для игнорирования сертификатов (только для разработки)
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
    
    return dio;
  }
}
