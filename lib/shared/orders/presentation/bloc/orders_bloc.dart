import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/orders/domain/usecases/create_order_usecase.dart';
import 'package:fly_cargo/shared/orders/domain/usecases/get_client_orders_usecase.dart';
import 'package:fly_cargo/shared/orders/domain/usecases/get_courier_orsers_usecase.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final CreateOrderUseCase _createOrderUseCase;
  final GetClientOrdersUseCase _getClientOrdersUseCase;
  final GetCourierOrdersUseCase _getCourierOrdersUseCase;
  OrdersBloc(
    this._createOrderUseCase,
    this._getClientOrdersUseCase,
    this._getCourierOrdersUseCase,
  ) : super(const OrdersInitial()) {
    on<CreateOrderEvent>(_onCreateOrder);
    on<ResetOrdersEvent>(_onResetOrders);
    on<GetClientOrdersEvent>(_onGetClientOrders);
    on<GetCourierOrdersEvent>(_onGetCourierOrders);
  }
  Future<void> _onCreateOrder(
    CreateOrderEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(const OrdersLoading());
    try {
      final result = await _createOrderUseCase.call(event.orderData);
      emit(OrderCreated(orderResult: result));
    } catch (e) {
      emit(OrdersError(message: e.toString()));
    }
  }

  void _onResetOrders(ResetOrdersEvent event, Emitter<OrdersState> emit) {
    emit(const OrdersInitial());
  }

  Future<void> _onGetClientOrders(
    GetClientOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(const OrdersLoading());
    try {
      await _getClientOrdersUseCase.call();
      // emit(OrdersLoaded(orders: result));
    } catch (e) {
      emit(OrdersError(message: e.toString()));
    }
  }

  Future<void> _onGetCourierOrders(
    GetCourierOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(const OrdersLoading());
    try {
      await _getCourierOrdersUseCase.call();
      // emit(OrdersLoaded(orders: result));
    } catch (e) {
      emit(OrdersError(message: e.toString()));
    }
  }
}
