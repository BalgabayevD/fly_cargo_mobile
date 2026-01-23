part of 'client_orders_bloc.dart';

class ClientOrdersState extends Equatable {
  final bool isLoading;
  final List<OrderEntity> orders;

  const ClientOrdersState({
    this.isLoading = false,
    this.orders = const <OrderEntity>[],
  });

  @override
  List<Object?> get props => [isLoading, orders];

  ClientOrdersState copyWith({
    bool? isLoading,
    List<OrderEntity>? orders,
    OrderEntity? order,
  }) {
    return ClientOrdersState(
      isLoading: isLoading ?? this.isLoading,
      orders: orders ?? this.orders,
    );
  }
}
