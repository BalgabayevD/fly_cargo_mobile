part of 'courier_order_bloc.dart';

sealed class CourierOrderState {
  const CourierOrderState();
}

class CourierOrderInitialState extends CourierOrderState {}

class CourierOrderLoadingState extends CourierOrderState {
  final int orderId;

  const CourierOrderLoadingState(this.orderId);
}

class CourierOrderLoadingIdentificationState extends CourierOrderState {
  final String identification;

  const CourierOrderLoadingIdentificationState(this.identification);
}

class CourierOrderLoadedState extends CourierOrderState {
  final OrderEntity order;

  const CourierOrderLoadedState({required this.order});
}
