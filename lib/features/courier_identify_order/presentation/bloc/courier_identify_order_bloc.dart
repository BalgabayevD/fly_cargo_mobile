import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/domain/usecases/courier_orders_usecase.dart';
import 'package:injectable/injectable.dart';

part 'courier_identify_order_event.dart';
part 'courier_identify_order_state.dart';

@injectable
class CourierIdentifyOrderBloc
    extends Bloc<CourierIdentifyOrderEvent, CourierIdentifyOrderState> {
  final CourierOrdersUseCase courierOrders;

  CourierIdentifyOrderBloc(this.courierOrders)
    : super(const CourierIdentifyOrderInitialState()) {
    on<CourierIdentifyOrderLoadEvent>(_onLoad);
    on<CourierIdentifyOrderResetEvent>(_reset);
  }

  Future<void> _onLoad(
    CourierIdentifyOrderLoadEvent event,
    Emitter<CourierIdentifyOrderState> emit,
  ) async {
    emit(CourierIdentifyOrderLoadingState(event.identification));
    final isSuccess = await courierOrders.identify(
      event.orderId,
      event.identification,
    );

    if (isSuccess) {
      emit(CourierIdentifyOrderSuccessState(event.identification));
    } else {
      emit(CourierIdentifyOrderFailureState(event.identification));
    }
  }

  void _reset(
    CourierIdentifyOrderResetEvent event,
    Emitter<CourierIdentifyOrderState> emit,
  ) async {
    emit(CourierIdentifyOrderInitialState());
  }
}
