import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/orders/data/models/models.dart';
import 'package:fly_cargo/features/orders/domain/usecases/calculate_order_price_usecase.dart';
import 'package:injectable/injectable.dart';

abstract class PriceCalculationEvent {}

class CalculatePriceEvent extends PriceCalculationEvent {
  final int tariffId;
  final int fromCityId;
  final int toCityId;
  final String toPhone;

  CalculatePriceEvent({
    required this.tariffId,
    required this.fromCityId,
    required this.toCityId,
    required this.toPhone,
  });
}

class ResetPriceCalculationEvent extends PriceCalculationEvent {}

abstract class PriceCalculationState {}

class PriceCalculationInitial extends PriceCalculationState {}

class PriceCalculationLoading extends PriceCalculationState {}

class PriceCalculationLoaded extends PriceCalculationState {
  final PriceCalculationModel priceCalculation;

  PriceCalculationLoaded({required this.priceCalculation});
}

class PriceCalculationError extends PriceCalculationState {
  final String message;

  PriceCalculationError(this.message);
}

@injectable
class PriceCalculationBloc
    extends Bloc<PriceCalculationEvent, PriceCalculationState> {
  final CalculateOrderPriceUseCase _calculateOrderPriceUseCase;

  PriceCalculationBloc({
    required CalculateOrderPriceUseCase calculateOrderPriceUseCase,
  }) : _calculateOrderPriceUseCase = calculateOrderPriceUseCase,
       super(PriceCalculationInitial()) {
    on<CalculatePriceEvent>(_onCalculatePrice);
    on<ResetPriceCalculationEvent>(_onResetPriceCalculation);
  }

  Future<void> _onCalculatePrice(
    CalculatePriceEvent event,
    Emitter<PriceCalculationState> emit,
  ) async {
    emit(PriceCalculationLoading());
    try {
      final priceCalculation = await _calculateOrderPriceUseCase(
        tariffId: event.tariffId,
        fromCityId: event.fromCityId,
        toCityId: event.toCityId,
        toPhone: event.toPhone,
      );
      emit(PriceCalculationLoaded(priceCalculation: priceCalculation));
    } catch (e) {
      emit(PriceCalculationError('Ошибка расчета стоимости: ${e.toString()}'));
    }
  }

  Future<void> _onResetPriceCalculation(
    ResetPriceCalculationEvent event,
    Emitter<PriceCalculationState> emit,
  ) async {
    emit(PriceCalculationInitial());
  }
}
