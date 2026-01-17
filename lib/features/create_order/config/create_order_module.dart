import 'package:fly_cargo/features/create_order/domain/usecases/calculate_order_price_usecase.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/create_order_usecase.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/pre_create_order_usecase.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/price_calculation_bloc.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CreateOrderModule {
  CreateOrderUseCase createOrderUseCase(OrdersRepository repository) =>
      CreateOrderUseCase(repository);

  PreCreateOrderUseCase preCreateOrderUseCase(OrdersRepository repository) =>
      PreCreateOrderUseCase(repository);

  CalculateOrderPriceUseCase calculateOrderPriceUseCase(
    OrdersRepository repository,
  ) => CalculateOrderPriceUseCase(repository);

  CreateOrderBloc createOrderBloc(
    CreateOrderUseCase createOrderUseCase,
    PreCreateOrderUseCase preCreateOrderUseCase,
  ) => CreateOrderBloc(
    createOrderUseCase,
    preCreateOrderUseCase,
  );

  PriceCalculationBloc priceCalculationBloc(
    CalculateOrderPriceUseCase calculateOrderPriceUseCase,
  ) => PriceCalculationBloc(
    calculateOrderPriceUseCase: calculateOrderPriceUseCase,
  );
}
