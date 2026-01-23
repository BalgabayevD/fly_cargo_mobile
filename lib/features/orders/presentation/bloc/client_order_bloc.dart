import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/get_client_orders_usecase.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

part 'client_order_event.dart';
part 'client_order_state.dart';

@injectable
class ClientOrderBloc extends Bloc<ClientOrderEvent, ClientOrderState> {
  final ClientOrdersUseCase clientOrders;

  ClientOrderBloc(this.clientOrders) : super(ClientOrderInitialState()) {
    on<ClientOrderLoadEvent>(_load);
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
}
