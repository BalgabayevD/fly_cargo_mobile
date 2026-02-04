import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/courier_orders_usecase.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/submit_order/domain/entity/decline_order_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

part 'courier_order_event.dart';
part 'courier_order_state.dart';

@injectable
class CourierOrderBloc extends Bloc<CourierOrderEvent, CourierOrderState> {
  final CourierOrdersUseCase courierOrders;

  CourierOrderBloc(this.courierOrders) : super(CourierOrderInitialState()) {
    on<CourierOrderLoadEvent>(_load);
    on<CourierOrderLoadIdentificationEvent>(_loadOrderIdentification);
    on<CourierOrderDeclineEvent>(_decline);
    on<CourierOrderDeliverToReceiverEvent>(_deliverToReceiver);
    on<CourierOrderCompleteEvent>(_completeOrder);
  }

  Future<void> _load(
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

  Future<void> _decline(
    CourierOrderDeclineEvent event,
    Emitter<CourierOrderState> emit,
  ) async {
    if (state is CourierOrderLoadedState) {
      emit((state as CourierOrderLoadedState).copyWith(isDeclining: true));

      final entity = DeclineOrderEntity(
        orderId: event.orderId,
        decideDescription: event.description,
        decideReason: event.reason,
      );

      final order = await courierOrders.decline(entity);
      if (order != null) {
        emit(CourierOrderLoadedState(order: order));
      } else {
        emit((state as CourierOrderLoadedState).copyWith(isDeclining: false));
      }
    }
  }

  Future<void> _deliverToReceiver(
    CourierOrderDeliverToReceiverEvent event,
    Emitter<CourierOrderState> emit,
  ) async {
    final currentState = state;
    if (currentState is CourierOrderLoadedState) {
      emit(CourierOrderActionLoadingState(order: currentState.order));
    }
    final order = await courierOrders.deliverToReceiver(event.orderId);
    if (order != null) {
      emit(CourierOrderLoadedState(order: order));
    } else {
      if (currentState is CourierOrderLoadedState) {
        emit(CourierOrderActionErrorState(
          order: currentState.order,
          message: 'Ошибка при смене статуса',
        ));
      }
    }
  }

  Future<void> _completeOrder(
    CourierOrderCompleteEvent event,
    Emitter<CourierOrderState> emit,
  ) async {
    final currentState = state;
    if (currentState is CourierOrderLoadedState) {
      emit(CourierOrderActionLoadingState(order: currentState.order));
    }
    final order = await courierOrders.completeOrder(event.orderId, event.code);
    if (order != null) {
      emit(CourierOrderLoadedState(order: order));
    } else {
      if (currentState is CourierOrderLoadedState) {
        emit(CourierOrderActionErrorState(
          order: currentState.order,
          message: 'Неверный код получения',
        ));
      }
    }
  }
}
