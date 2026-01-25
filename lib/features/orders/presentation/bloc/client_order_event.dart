part of 'client_order_bloc.dart';

sealed class ClientOrderEvent {
  const ClientOrderEvent();
}

class ClientOrderLoadEvent extends ClientOrderEvent {
  final int orderId;

  const ClientOrderLoadEvent(this.orderId);
}

class ClientOrderPayEvent extends ClientOrderEvent {
  final int cardId;

  const ClientOrderPayEvent(this.cardId);
}

class ClientOrderRePayEvent extends ClientOrderEvent {
  const ClientOrderRePayEvent();
}

class ClientOrderCancelEvent extends ClientOrderEvent {
  const ClientOrderCancelEvent();
}

class ClientOrderReCancelEvent extends ClientOrderEvent {
  const ClientOrderReCancelEvent();
}
