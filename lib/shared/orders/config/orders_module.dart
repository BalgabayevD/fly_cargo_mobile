import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:fly_cargo/shared/orders/data/orders_remote_source.dart';
import 'package:injectable/injectable.dart';
@module
abstract class OrdersModule {
  @factoryMethod
  OrdersRemoteSource provideOrdersRemoteSource(
    @Named('private-dio') Dio privateDio,
    ApiConfig dataSourceConfig,
  ) {
    return OrdersRemoteSource(privateDio, baseUrl: ApiConfig.baseUrl);
  }
}
