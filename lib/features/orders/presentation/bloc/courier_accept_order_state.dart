part of 'courier_accept_order_bloc.dart';

sealed class CourierAcceptOrderState {
  const CourierAcceptOrderState();
}

class CourierAcceptOrderInitialState extends CourierAcceptOrderState {}

class CourierAcceptOrderLoadingState extends CourierAcceptOrderState {
  final int orderId;

  const CourierAcceptOrderLoadingState(this.orderId);
}

class CourierAcceptOrderLoadedState extends CourierAcceptOrderState {
  final OrderEntity order;

  const CourierAcceptOrderLoadedState({required this.order});
}
