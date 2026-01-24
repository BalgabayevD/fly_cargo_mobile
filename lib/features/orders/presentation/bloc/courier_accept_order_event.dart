part of 'courier_accept_order_bloc.dart';

sealed class CourierAcceptOrderEvent {
  const CourierAcceptOrderEvent();
}

class CourierAcceptOrderLoadEvent extends CourierAcceptOrderEvent {
  final int orderId;

  const CourierAcceptOrderLoadEvent(this.orderId);
}
