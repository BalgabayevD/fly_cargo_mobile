import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkRepository {
  late final Dio dio;

  NetworkRepository() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://user-cargo.maguya.kz',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }
}
