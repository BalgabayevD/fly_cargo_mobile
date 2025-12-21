import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/shared/orders/data/models/models.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();
  @override
  List<Object?> get props => [];
}

class OrdersInitial extends OrdersState {
  const OrdersInitial();
}

class OrdersLoading extends OrdersState {
  const OrdersLoading();
}

class OrderCreated extends OrdersState {
  final OrderResult orderResult;
  const OrderCreated({required this.orderResult});
  @override
  List<Object?> get props => [orderResult];
}

class OrdersLoaded extends OrdersState {
  final List<OrderModel> orders;
  const OrdersLoaded({required this.orders});
  @override
  List<Object?> get props => [orders];
}

class OrdersError extends OrdersState {
  final String message;
  const OrdersError({required this.message});
  @override
  List<Object?> get props => [message];
}

class OrdersUnauthorized extends OrdersState {
  const OrdersUnauthorized();
}

class OrderDetailLoaded extends OrdersState {
  final OrderModel order;
  const OrderDetailLoaded({required this.order});
  @override
  List<Object?> get props => [order];
}

class PreOrderAnalyzed extends OrdersState {
  final PreCreateOrderData preOrderData;
  final AnalysisStatus analysisStatus;
  const PreOrderAnalyzed({
    required this.preOrderData,
    required this.analysisStatus,
  });
  @override
  List<Object?> get props => [preOrderData, analysisStatus];
}
