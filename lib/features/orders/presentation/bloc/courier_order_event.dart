part of 'courier_order_bloc.dart';

sealed class CourierOrderEvent {
  const CourierOrderEvent();
}

class CourierOrderLoadEvent extends CourierOrderEvent {
  final int orderId;

  const CourierOrderLoadEvent(this.orderId);
}

class CourierOrderLoadIdentificationEvent extends CourierOrderEvent {
  final String identification;

  const CourierOrderLoadIdentificationEvent(this.identification);
}

class CourierOrderDeliverToReceiverEvent extends CourierOrderEvent {
  final int orderId;

  const CourierOrderDeliverToReceiverEvent(this.orderId);
}

class CourierOrderCompleteEvent extends CourierOrderEvent {
  final int orderId;
  final String code;

  const CourierOrderCompleteEvent(this.orderId, this.code);
}
