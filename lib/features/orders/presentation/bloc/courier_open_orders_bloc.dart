import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/courier_orders_usecase.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';

part 'courier_open_orders_event.dart';
part 'courier_open_orders_state.dart';

@injectable
class CourierOpenOrdersBloc
    extends Bloc<CourierOpenOrdersEvent, CourierOpenOrdersState> {
  final CourierOrdersUseCase courierOrders;

  CourierOpenOrdersBloc(this.courierOrders) : super(CourierOpenOrdersState()) {
    on<CourierOpenOrdersLoadAllEvent>(_loadAll);
  }

  Future<void> _loadAll(
    CourierOpenOrdersLoadAllEvent event,
    Emitter<CourierOpenOrdersState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final persist = courierOrders.getPersistOpenOrders();
    emit(state.copyWith(orders: persist, isLoading: false));

    final orders = await courierOrders.getOpenOrders();
    emit(state.copyWith(orders: orders, isLoading: false));
  }
}
