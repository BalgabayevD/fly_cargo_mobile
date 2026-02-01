import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo_entity.dart';
import 'package:fly_cargo/features/orders/domain/usecases/courier_orders_usecase.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/submit_order/domain/entity/submit_order_entity.dart';
import 'package:injectable/injectable.dart';

part 'courier_submit_order_event.dart';
part 'courier_submit_order_state.dart';

@injectable
class CourierSubmitOrderBloc
    extends Bloc<CourierSubmitOrderEvent, CourierSubmitOrderState> {
  final CourierOrdersUseCase courierOrders;

  CourierSubmitOrderBloc(this.courierOrders)
    : super(CourierSubmitOrderInitialState()) {
    on<CourierSubmitOrderLoadEvent>(_load);
    on<CourierSubmitOrderUpdateEvent>(_update);
    on<CourierSubmitOrderSubmitEvent>(_submit);
  }

  Future<void> _load(
    CourierSubmitOrderLoadEvent event,
    Emitter<CourierSubmitOrderState> emit,
  ) async {
    emit(CourierSubmitOrderLoadingState(event.orderId));
    final order = await courierOrders.getOrderById(event.orderId);
    if (order != null) {
      emit(
        CourierSubmitOrderLoadedState(
          order: order,
          tariffId: order.tariffId,
          weight: order.weight,
          isDefect: false,
          defectPhotos: const <OrderPhotoEntity>[],
          isSubmitted: false,
          isLoading: false,
        ),
      );
    } else {
      emit(CourierSubmitOrderInitialState());
    }
  }

  Future<void> _update(
    CourierSubmitOrderUpdateEvent event,
    Emitter<CourierSubmitOrderState> emit,
  ) async {
    if (state is CourierSubmitOrderLoadedState) {
      final current = state as CourierSubmitOrderLoadedState;

      if (event.field is UpdateOrdersTariffField) {
        emit(
          current.copyWith(
            tariffId: (event.field as UpdateOrdersTariffField).tariffId,
          ),
        );
      }

      if (event.field is UpdateOrdersWeightField) {
        emit(
          current.copyWith(
            weight: (event.field as UpdateOrdersWeightField).weight,
          ),
        );
      }

      if (event.field is UpdateOrdersDefectField) {
        emit(
          current.copyWith(
            isDefect: (event.field as UpdateOrdersDefectField).isDefect,
          ),
        );
      }

      if (event.field is UpdateOrdersDefectPhotosField) {
        emit(
          current.copyWith(
            defectPhotos:
                (event.field as UpdateOrdersDefectPhotosField).defectPhotos,
          ),
        );
      }
    }
  }

  Future<void> _submit(
    CourierSubmitOrderSubmitEvent event,
    Emitter<CourierSubmitOrderState> emit,
  ) async {
    if (state is CourierSubmitOrderLoadedState) {
      final current = state as CourierSubmitOrderLoadedState;
      emit(current.copyWith(isLoading: true));
      final order = await courierOrders.submit(current.toEntity());
      if (order != null) {
        emit(
          CourierSubmitOrderLoadedState(
            order: order,
            tariffId: order.tariffId,
            weight: order.weight,
            isDefect: false,
            defectPhotos: const <OrderPhotoEntity>[],
            isSubmitted: true,
            isLoading: false,
          ),
        );
      } else {
        emit(CourierSubmitOrderInitialState());
      }
    }
  }
}
