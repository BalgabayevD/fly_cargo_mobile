part of 'courier_accept_order_bloc.dart';

sealed class CourierAcceptOrderEvent {
  const CourierAcceptOrderEvent();
}

class CourierAcceptOrderLoadEvent extends CourierAcceptOrderEvent {
  final int orderId;

  const CourierAcceptOrderLoadEvent(this.orderId);
}

class CourierAcceptOrderAcceptEvent extends CourierAcceptOrderEvent {
  final int orderId;
  final int courierArriveTime;

  const CourierAcceptOrderAcceptEvent(this.orderId, this.courierArriveTime);
}
