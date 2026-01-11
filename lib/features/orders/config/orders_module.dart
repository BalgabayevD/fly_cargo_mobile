import 'package:flutter/material.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_client_orders_usecase.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_courier_orsers_usecase.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_created_orders_usecase.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_order_by_id_usecase.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_bloc.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class OrdersModule {
  @factory
  GetClientOrdersUseCase getClientOrdersUseCase(OrdersRepository repository) =>
      GetClientOrdersUseCase(repository);

  @factory
  GetCourierOrdersUseCase getCourierOrdersUseCase(
    OrdersRepository repository,
  ) => GetCourierOrdersUseCase(repository);

  @factory
  GetCreatedOrdersUseCase getCreatedOrdersUseCase(
    OrdersRepository repository,
  ) => GetCreatedOrdersUseCase(repository);

  @factory
  GetOrderByIdUseCase getOrderByIdUseCase(OrdersRepository repository) =>
      GetOrderByIdUseCase(repository);

  @factory
  OrdersListBloc ordersListBloc(
    GetClientOrdersUseCase getClientOrdersUseCase,
    GetCourierOrdersUseCase getCourierOrdersUseCase,
    GetCreatedOrdersUseCase getCreatedOrdersUseCase,
    GetOrderByIdUseCase getOrderByIdUseCase,
  ) => OrdersListBloc(
    getClientOrdersUseCase,
    getCourierOrdersUseCase,
    getCreatedOrdersUseCase,
    getOrderByIdUseCase,
  );
}
