import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:fly_cargo/features/tariffs/data/tariffs_remote_source.dart';
import 'package:injectable/injectable.dart';
@module
abstract class TariffsModule {
  @factoryMethod
  TariffsRemoteSource provideTariffsRemoteSource(
    @Named('private-dio') Dio privateDio,
    ApiConfig dataSourceConfig,
  ) {
    return TariffsRemoteSource(privateDio, baseUrl: ApiConfig.baseUrl);
  }
}
