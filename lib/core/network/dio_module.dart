import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/http_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @Named('private-dio')
  @injectable
  Dio getPrivateDio(
    @Named('log-interceptor') Interceptor logInterceptor,
    @Named('auth-interceptor') Interceptor authInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveTimeout: const Duration(
          milliseconds: HttpConfig.receivedTimeout,
        ),
        connectTimeout: const Duration(
          milliseconds: HttpConfig.connectionTimeout,
        ),
      ),
    )..interceptors.addAll([authInterceptor, logInterceptor]);

    return dio;
  }

  @Named('public-dio')
  @injectable
  Dio getPublicDio(@Named('log-interceptor') Interceptor logInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveTimeout: const Duration(
          milliseconds: HttpConfig.receivedTimeout,
        ),
        connectTimeout: const Duration(
          milliseconds: HttpConfig.connectionTimeout,
        ),
      ),
    )..interceptors.addAll([logInterceptor]);

    return dio;
  }
}
