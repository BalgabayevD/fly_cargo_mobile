import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/shared/orders/data/models/models.dart';

abstract class OrdersListState extends Equatable {
  const OrdersListState();
  @override
  List<Object?> get props => [];
}

class OrdersListInitial extends OrdersListState {
  const OrdersListInitial();
}

class OrdersListLoading extends OrdersListState {
  const OrdersListLoading();
}

class OrdersListLoaded extends OrdersListState {
  final List<OrderModel> orders;
  const OrdersListLoaded({required this.orders});
  @override
  List<Object?> get props => [orders];
}

class OrdersListError extends OrdersListState {
  final String message;
  const OrdersListError({required this.message});
  @override
  List<Object?> get props => [message];
}

class OrdersListUnauthorized extends OrdersListState {
  const OrdersListUnauthorized();
}

class OrderDetailLoaded extends OrdersListState {
  final OrderModel order;
  const OrderDetailLoaded({required this.order});
  @override
  List<Object?> get props => [order];
}

