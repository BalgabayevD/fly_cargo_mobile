import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object?> get props => [];
}

/// Начальное состояние
class OrdersInitial extends OrdersState {
  const OrdersInitial();
}

/// Состояние загрузки
class OrdersLoading extends OrdersState {
  const OrdersLoading();
}

/// Состояние успешного создания заказа
class OrderCreated extends OrdersState {
  final OrderResult orderResult;

  const OrderCreated({required this.orderResult});

  @override
  List<Object?> get props => [orderResult];
}

/// Состояние ошибки
class OrdersError extends OrdersState {
  final String message;

  const OrdersError({required this.message});

  @override
  List<Object?> get props => [message];
}
