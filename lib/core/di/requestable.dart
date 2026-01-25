import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/cookie_jar_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uuid/uuid.dart';

@module
abstract class RequestableModule {
  @preResolve
  Future<Requestable> requestable(
    Configuration configuration,
  ) async {
    return Requestable.fromEnvironment(configuration);
  }
}

class Requestable {
  late Dio dio;

  Requestable(this.dio);

  static Future<Requestable> fromEnvironment(
    Configuration configuration,
  ) async {
    final dio = Dio(
      BaseOptions(
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          'Origin': 'https://cargo.maguya.kz',
          'x-skip-oauth-proxy': true,
          'x-app': 'sapsano',
        },
        connectTimeout: const Duration(seconds: 420),
        receiveTimeout: const Duration(seconds: 420),
        sendTimeout: const Duration(seconds: 420),
      ),
    );
    const uuid = Uuid();

    final cookieJar = PersistCookieJar(
      storage: CookieJarStorage(configuration.package.sharedPreferences),
    );

    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );

    final accessToken = configuration.package.getAccessToken();

    dio.options.headers['X-App-Version'] = configuration.package.version;
    dio.options.headers['Language'] = configuration.package.build;

    if (accessToken != null) {
      dio.options.headers['Authorization'] = 'Bearer $accessToken';
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          String requestId = uuid.v4();

          options.headers['X-Request-ID'] = requestId;

          return handler.next(options);
        },
      ),
    );

    // final appCheckToken = await configuration.package.firebaseAppCheck
    //     .getToken()
    //     .onError((_, __) {
    //       return null;
    //     });

    // if (appCheckToken != null) {
    //   dio.options.headers['x-app-check'] = appCheckToken;
    // }
    // configuration.package.firebaseAppCheck.onTokenChange.listen((
    //   String? appCheckToken,
    // ) {
    //   if (appCheckToken != null) {
    //     dio.options.headers['x-app-check'] = appCheckToken;
    //   }
    // });

    return Requestable(dio);
  }

  void addAuthorizationHeader(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void removeAuthorizationHeader() {
    dio.options.headers.remove('Authorization');
  }
}
