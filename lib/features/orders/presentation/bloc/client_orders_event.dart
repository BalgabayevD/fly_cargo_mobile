part of 'client_orders_bloc.dart';

sealed class ClientOrdersEvent {
  const ClientOrdersEvent();
}

enum ClientOrderListType {
  normal,
  open,
  completed,
}

class LoadAllClientOrdersEvent extends ClientOrdersEvent {
  final ClientOrderListType type;

  const LoadAllClientOrdersEvent({this.type = .normal});
}
