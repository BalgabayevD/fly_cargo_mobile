part of 'courier_orders_bloc.dart';

class CourierOrdersState extends Equatable {
  final List<OrderEntity> orders;
  final bool isLoading;

  const CourierOrdersState({
    this.orders = const <OrderEntity>[],
    this.isLoading = false,
  });

  CourierOrdersState copyWith({
    List<OrderEntity>? open,
    List<OrderEntity>? orders,
    bool? isLoading,
    bool? isOpenLoading,
  }) {
    return CourierOrdersState(
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
