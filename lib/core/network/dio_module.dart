import 'package:dio/dio.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @Named('private-dio')
  @injectable
  Dio getPrivateDio(
    @Named('log-interceptor') Interceptor logInterceptor,
    @Named('auth-interceptor') Interceptor authInterceptor,
  ) {
    return FlutterBetterAuth.dioClient
      ..interceptors.addAll([logInterceptor, authInterceptor]);
  }

  @Named('public-dio')
  @injectable
  Dio getPublicDio(@Named('log-interceptor') Interceptor logInterceptor) {
    return FlutterBetterAuth.dioClient..interceptors.addAll([logInterceptor]);
  }
}
