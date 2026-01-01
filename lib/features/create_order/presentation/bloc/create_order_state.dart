import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/shared/orders/data/models/models.dart';

abstract class CreateOrderState extends Equatable {
  const CreateOrderState();
  @override
  List<Object?> get props => [];
}

class CreateOrderInitial extends CreateOrderState {
  const CreateOrderInitial();
}

class CreateOrderLoading extends CreateOrderState {
  const CreateOrderLoading();
}

class OrderCreated extends CreateOrderState {
  final OrderResult orderResult;
  const OrderCreated({required this.orderResult});
  @override
  List<Object?> get props => [orderResult];
}

class CreateOrderError extends CreateOrderState {
  final String message;
  const CreateOrderError({required this.message});
  @override
  List<Object?> get props => [message];
}

class CreateOrderUnauthorized extends CreateOrderState {
  const CreateOrderUnauthorized();
}

class PreOrderAnalyzed extends CreateOrderState {
  final PreCreateOrderData preOrderData;
  final AnalysisStatus analysisStatus;
  const PreOrderAnalyzed({
    required this.preOrderData,
    required this.analysisStatus,
  });
  @override
  List<Object?> get props => [preOrderData, analysisStatus];
}

class OrderValidationError extends CreateOrderState {
  final String message;
  const OrderValidationError({required this.message});
  @override
  List<Object?> get props => [message];
}

