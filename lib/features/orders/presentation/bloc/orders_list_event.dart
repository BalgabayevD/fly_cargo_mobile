import 'package:equatable/equatable.dart';

abstract class OrdersListEvent extends Equatable {
  const OrdersListEvent();
  @override
  List<Object?> get props => [];
}

class GetClientOrdersListEvent extends OrdersListEvent {
  const GetClientOrdersListEvent();
}

class GetCourierOrdersListEvent extends OrdersListEvent {
  const GetCourierOrdersListEvent();
}

class GetCreatedOrdersListEvent extends OrdersListEvent {
  const GetCreatedOrdersListEvent();
}

class GetOrderByIdEvent extends OrdersListEvent {
  final String orderId;
  const GetOrderByIdEvent({required this.orderId});
  @override
  List<Object?> get props => [orderId];
}

