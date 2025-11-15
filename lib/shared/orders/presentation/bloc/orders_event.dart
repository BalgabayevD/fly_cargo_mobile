import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';
abstract class OrdersEvent extends Equatable {
  const OrdersEvent();
  @override
  List<Object?> get props => [];
}
class CreateOrderEvent extends OrdersEvent {
  final OrderData orderData;
  const CreateOrderEvent({required this.orderData});
  @override
  List<Object?> get props => [orderData];
}
class ResetOrdersEvent extends OrdersEvent {
  const ResetOrdersEvent();
}
