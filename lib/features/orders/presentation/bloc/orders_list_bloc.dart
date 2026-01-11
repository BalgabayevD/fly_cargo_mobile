import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_client_orders_usecase.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_courier_orsers_usecase.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_created_orders_usecase.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_order_by_id_usecase.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_event.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_state.dart';

class OrdersListBloc extends Bloc<OrdersListEvent, OrdersListState> {
  final GetClientOrdersUseCase _getClientOrdersUseCase;
  final GetCourierOrdersUseCase _getCourierOrdersUseCase;
  final GetCreatedOrdersUseCase _getCreatedOrdersUseCase;
  final GetOrderByIdUseCase _getOrderByIdUseCase;

  OrdersListBloc(
    this._getClientOrdersUseCase,
    this._getCourierOrdersUseCase,
    this._getCreatedOrdersUseCase,
    this._getOrderByIdUseCase,
  ) : super(const OrdersListInitial()) {
    on<GetClientOrdersListEvent>(_onGetClientOrders);
    on<GetCourierOrdersListEvent>(_onGetCourierOrders);
    on<GetCreatedOrdersListEvent>(_onGetCreatedOrders);
    on<GetOrderByIdEvent>(_onGetOrderById);
  }

  Future<void> _onGetClientOrders(
    GetClientOrdersListEvent event,
    Emitter<OrdersListState> emit,
  ) async {
    emit(const OrdersListLoading());
    try {
      final orders = await _getClientOrdersUseCase.call();
      emit(OrdersListLoaded(orders: orders));
    } catch (e) {
      if (_isUnauthorized(e)) {
        emit(const OrdersListUnauthorized());
      } else {
        emit(OrdersListError(message: e.toString()));
      }
    }
  }

  Future<void> _onGetCourierOrders(
    GetCourierOrdersListEvent event,
    Emitter<OrdersListState> emit,
  ) async {
    emit(const OrdersListLoading());
    try {
      final orders = await _getCourierOrdersUseCase.call();
      emit(OrdersListLoaded(orders: orders));
    } catch (e) {
      if (_isUnauthorized(e)) {
        emit(const OrdersListUnauthorized());
      } else {
        emit(OrdersListError(message: e.toString()));
      }
    }
  }

  Future<void> _onGetCreatedOrders(
    GetCreatedOrdersListEvent event,
    Emitter<OrdersListState> emit,
  ) async {
    emit(const OrdersListLoading());
    try {
      final orders = await _getCreatedOrdersUseCase.call();
      emit(OrdersListLoaded(orders: orders));
    } catch (e) {
      if (_isUnauthorized(e)) {
        emit(const OrdersListUnauthorized());
      } else {
        emit(OrdersListError(message: e.toString()));
      }
    }
  }

  Future<void> _onGetOrderById(
    GetOrderByIdEvent event,
    Emitter<OrdersListState> emit,
  ) async {
    emit(const OrdersListLoading());
    try {
      final order = await _getOrderByIdUseCase.call(event.orderId);
      emit(OrderDetailLoaded(order: order));
    } catch (e) {
      if (_isUnauthorized(e)) {
        emit(const OrdersListUnauthorized());
      } else {
        emit(OrdersListError(message: e.toString()));
      }
    }
  }

  bool _isUnauthorized(Object e) {
    if (e is DioException) {
      return e.response?.statusCode == 401;
    }
    return e.toString().contains('401') ||
        e.toString().toLowerCase().contains('unauthorized');
  }
}

