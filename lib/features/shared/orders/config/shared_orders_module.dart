import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/shared/orders/data/orders_remote_source.dart';
import 'package:fly_cargo/features/shared/orders/data/repositories/orders_repository_impl.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SharedOrdersModule {
  OrdersRemoteSource ordersRemoteSource(
    Requestable requestable,
    Configuration configuration,
  ) => OrdersRemoteSource(
    requestable.dio,
    baseUrl: configuration.environmentVariables.orderBaseUrl,
  );

  OrdersRepository ordersRepository(
    OrdersRemoteSource remoteSource,
    Requestable requestable,
  ) => OrdersRepositoryImpl(remoteSource, requestable);
}
