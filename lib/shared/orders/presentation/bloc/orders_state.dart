import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/orders/data/models/models.dart';
abstract class OrdersState extends Equatable {
  const OrdersState();
  @override
  List<Object?> get props => [];
}
class OrdersInitial extends OrdersState {
  const OrdersInitial();
}
class OrdersLoading extends OrdersState {
  const OrdersLoading();
}
class OrderCreated extends OrdersState {
  final OrderResult orderResult;
  const OrderCreated({required this.orderResult});
  @override
  List<Object?> get props => [orderResult];
}
class OrdersError extends OrdersState {
  final String message;
  const OrdersError({required this.message});
  @override
  List<Object?> get props => [message];
}
