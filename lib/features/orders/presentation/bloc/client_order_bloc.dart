import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_client_orders_usecase.dart';
import 'package:fly_cargo/features/payments/domain/usecases/payment_usecase.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

part 'client_order_event.dart';
part 'client_order_state.dart';

@injectable
class ClientOrderBloc extends Bloc<ClientOrderEvent, ClientOrderState> {
  final ClientOrdersUseCase clientOrders;
  final PaymentUseCase payment;

  ClientOrderBloc(this.clientOrders, this.payment)
    : super(ClientOrderInitialState()) {
    on<ClientOrderLoadEvent>(_load);
    on<ClientOrderPayEvent>(_pay);
    on<ClientOrderRePayEvent>(_repay);
  }

  Future<void> _load(
    ClientOrderLoadEvent event,
    Emitter<ClientOrderState> emit,
  ) async {
    if (state is! ClientOrderLoadedState) {
      emit(ClientOrderLoadingState(event.orderId));
    }
    final order = await clientOrders.getClientRestOrder(event.orderId);
    if (order != null) {
      emit(ClientOrderLoadedState(order: order));
    } else {
      emit(ClientOrderInitialState());
    }
  }

  Future<void> _pay(
    ClientOrderPayEvent event,
    Emitter<ClientOrderState> emit,
  ) async {
    if (state is ClientOrderLoadedState) {
      final current = state as ClientOrderLoadedState;
      final next = ClientOrderPayState(
        isLoading: true,
        isSuccess: true,
        cardId: event.cardId,
        order: current.order,
      );
      emit(next);
      final isSuccess = await payment.payOrder(event.cardId, current.order.id);
      emit(next.copyWith(isLoading: false, isSuccess: isSuccess));
    }
  }

  Future<void> _repay(
    ClientOrderRePayEvent event,
    Emitter<ClientOrderState> emit,
  ) async {
    if (state is ClientOrderPayState) {
      final current = state as ClientOrderPayState;
      emit(current.copyWith(isLoading: true, isSuccess: true));
      final isSuccess = await payment.payOrder(
        current.cardId,
        current.order.id,
      );
      emit(current.copyWith(isLoading: false, isSuccess: isSuccess));
    }
  }
}
