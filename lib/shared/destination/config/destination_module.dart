import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:fly_cargo/shared/destination/data/destination_remote_source.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DestinationModule {
  @factoryMethod
  DestinationRemoteSource provideDestinationRemoteSource(
    @Named('private-dio') Dio privateDio,
    ApiConfig dataSourceConfig,
  ) {
    return DestinationRemoteSource(privateDio, baseUrl: ApiConfig.baseUrl);
  }
}
