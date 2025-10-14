import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:fly_cargo/shared/auth/data/auth_remote_source.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  @factoryMethod
  AuthRemoteSource provideAuthRemoteSource(
    @Named('public-dio') Dio publicDio,
    ApiConfig dataSourceConfig,
  ) {
    return AuthRemoteSource(publicDio, baseUrl: ApiConfig.baseUrl);
  }
}
