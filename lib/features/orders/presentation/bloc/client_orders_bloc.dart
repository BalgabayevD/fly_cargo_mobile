import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/client_orders_usecase.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';

part 'client_orders_event.dart';
part 'client_orders_state.dart';

@injectable
class ClientOrdersBloc extends Bloc<ClientOrdersEvent, ClientOrdersState> {
  final ClientOrdersUseCase clientOrders;

  ClientOrdersBloc(this.clientOrders)
    : super(ClientOrdersState(orders: clientOrders.getClientPersistOrders())) {
    on<LoadAllClientOrdersEvent>(_loadAllClientOrders);
  }

  Future<void> _loadAllClientOrders(
    LoadAllClientOrdersEvent event,
    Emitter<ClientOrdersState> emit,
  ) async {
    final isEmptyOrders = state.orders.isEmpty;

    if (isEmptyOrders) emit(state.copyWith(isLoading: true));

    final orders = await clientOrders.getClientRestOrders();
    emit(state.copyWith(isLoading: false, orders: orders));
    await clientOrders.setClientPersistOrders(orders);
  }
}
