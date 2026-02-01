part of 'courier_identify_order_bloc.dart';

sealed class CourierIdentifyOrderEvent {
  const CourierIdentifyOrderEvent();
}

class CourierIdentifyOrderLoadEvent extends CourierIdentifyOrderEvent {
  final int orderId;
  final String identification;

  const CourierIdentifyOrderLoadEvent(this.orderId, this.identification);
}

class CourierIdentifyOrderResetEvent extends CourierIdentifyOrderEvent {
  const CourierIdentifyOrderResetEvent();
}
