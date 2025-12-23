import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:fly_cargo/features/auth/data/auth_remote_source.dart';
import 'package:injectable/injectable.dart';
@module
abstract class AuthModule {
  @factoryMethod
  AuthRemoteSource provideAuthRemoteSource(
    @Named('private-dio') Dio privateDio,
    ApiConfig dataSourceConfig,
  ) {
    return AuthRemoteSource(privateDio, baseUrl: ApiConfig.baseUrl);
  }
}
