import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/courier_orders_usecase.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';

part 'courier_accept_order_event.dart';
part 'courier_accept_order_state.dart';

@injectable
class CourierAcceptOrderBloc
    extends Bloc<CourierAcceptOrderEvent, CourierAcceptOrderState> {
  final CourierOrdersUseCase courierOrders;

  CourierAcceptOrderBloc(this.courierOrders)
    : super(CourierAcceptOrderInitialState()) {
    on<CourierAcceptOrderLoadEvent>(_loadOrder);
  }

  Future<void> _loadOrder(
    CourierAcceptOrderLoadEvent event,
    Emitter<CourierAcceptOrderState> emit,
  ) async {
    emit(CourierAcceptOrderLoadingState(event.orderId));
    final order = await courierOrders.getOrderById(event.orderId);
    if (order != null) {
      emit(CourierAcceptOrderLoadedState(order: order));
    } else {
      emit(CourierAcceptOrderInitialState());
    }
  }
}
