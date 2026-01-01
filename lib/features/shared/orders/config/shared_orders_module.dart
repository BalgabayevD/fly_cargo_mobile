import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:fly_cargo/core/network/pre_order_dio_client.dart';
import 'package:fly_cargo/features/shared/orders/data/orders_remote_source.dart';
import 'package:fly_cargo/features/shared/orders/data/repositories/orders_repository_impl.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SharedOrdersModule {
  OrdersRemoteSource ordersRemoteSource(
    @Named('private-dio') Dio dio,
    ApiConfig config,
  ) =>
      OrdersRemoteSource(dio, baseUrl: config.baseUrl);

  OrdersRepository ordersRepository(
    OrdersRemoteSource remoteSource,
    PreOrderDioClient preOrderDioClient,
  ) =>
      OrdersRepositoryImpl(remoteSource, preOrderDioClient);
}

