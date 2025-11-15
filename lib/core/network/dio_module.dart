import 'package:dio/dio.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:injectable/injectable.dart';
@module
abstract class DioModule {
  @Named('private-dio')
  @lazySingleton
  Dio getPrivateDio(
    @Named('log-interceptor') Interceptor logInterceptor,
    @Named('auth-interceptor') Interceptor authInterceptor,
  ) {
    final dio = Dio(FlutterBetterAuth.dioClient.options);
    dio.interceptors.addAll([logInterceptor, authInterceptor]);
    return dio;
  }
}
