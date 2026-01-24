import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/courier_orders_usecase.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';

part 'courier_orders_event.dart';
part 'courier_orders_state.dart';

@injectable
class CourierOrdersBloc extends Bloc<CourierOrdersEvent, CourierOrdersState> {
  final CourierOrdersUseCase courierOrders;

  CourierOrdersBloc(this.courierOrders) : super(CourierOrdersState()) {
    on<CourierOrdersLoadAllEvent>(_loadAllOrders);
  }

  Future<void> _loadAllOrders(
    CourierOrdersLoadAllEvent event,
    Emitter<CourierOrdersState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final persist = courierOrders.getPersistOrders();
    emit(state.copyWith(orders: persist, isLoading: false));

    final orders = await courierOrders.getOrders();
    emit(state.copyWith(orders: orders, isLoading: false));
  }
}
