part of 'courier_open_orders_bloc.dart';

class CourierOpenOrdersState extends Equatable {
  final List<OrderEntity> orders;
  final bool isLoading;

  const CourierOpenOrdersState({
    this.orders = const <OrderEntity>[],
    this.isLoading = false,
  });

  CourierOpenOrdersState copyWith({
    List<OrderEntity>? orders,
    bool? isLoading,
  }) {
    return CourierOpenOrdersState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    orders,
    isLoading,
  ];
}
