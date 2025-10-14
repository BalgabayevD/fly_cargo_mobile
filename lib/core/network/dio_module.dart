import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/http_config.dart';
import 'package:fly_cargo/core/network/talker_dio_interceptor.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @Named('private-dio')
  @injectable
  Dio getPrivateDio() {
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
    )..interceptors.addAll([TalkerDioInterceptor()]);

    return dio;
  }

  @Named('public-dio')
  @injectable
  Dio getPublicDio() {
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
    )..interceptors.addAll([TalkerDioInterceptor()]);

    return dio;
  }
}
