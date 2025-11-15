import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/orders/domain/usecases/create_order_usecase.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final CreateOrderUseCase _createOrderUseCase;
  OrdersBloc(this._createOrderUseCase) : super(const OrdersInitial()) {
    on<CreateOrderEvent>(_onCreateOrder);
    on<ResetOrdersEvent>(_onResetOrders);
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
}
