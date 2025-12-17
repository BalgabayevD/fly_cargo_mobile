import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/orders/data/models/models.dart';

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

class PreCreateOrderEvent extends OrdersEvent {
  final List<File> images;
  const PreCreateOrderEvent({required this.images});
  @override
  List<Object?> get props => [images];
}

class ResetOrdersEvent extends OrdersEvent {
  const ResetOrdersEvent();
}

class GetClientOrdersEvent extends OrdersEvent {
  const GetClientOrdersEvent();
}

class GetCourierOrdersEvent extends OrdersEvent {
  const GetCourierOrdersEvent();
}

class GetCreatedOrdersEvent extends OrdersEvent {
  const GetCreatedOrdersEvent();
}

class GetOrderByIdEvent extends OrdersEvent {
  final String orderId;
  const GetOrderByIdEvent({required this.orderId});
  @override
  List<Object?> get props => [orderId];
}
