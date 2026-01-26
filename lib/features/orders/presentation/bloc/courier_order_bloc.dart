import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/courier_orders_usecase.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

part 'courier_order_event.dart';
part 'courier_order_state.dart';

@injectable
class CourierOrderBloc extends Bloc<CourierOrderEvent, CourierOrderState> {
  final CourierOrdersUseCase courierOrders;

  CourierOrderBloc(this.courierOrders) : super(CourierOrderInitialState()) {
    on<CourierOrderLoadEvent>(_loadOrder);
    on<CourierOrderLoadIdentificationEvent>(_loadOrderIdentification);
  }

  Future<void> _loadOrder(
    CourierOrderLoadEvent event,
    Emitter<CourierOrderState> emit,
  ) async {
    emit(CourierOrderLoadingState(event.orderId));
    final order = await courierOrders.getOrderById(event.orderId);
    if (order != null) {
      emit(CourierOrderLoadedState(order: order));
    } else {
      emit(CourierOrderInitialState());
    }
  }

  Future<void> _loadOrderIdentification(
    CourierOrderLoadIdentificationEvent event,
    Emitter<CourierOrderState> emit,
  ) async {
    emit(CourierOrderLoadingIdentificationState(event.identification));
    final order = await courierOrders.getOrderByIdentification(
      event.identification,
    );
    if (order != null) {
      emit(CourierOrderLoadedState(order: order));
    } else {
      emit(CourierOrderInitialState());
    }
  }
}
