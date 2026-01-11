import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/calculate_order_price_usecase.dart';

abstract class PriceCalculationEvent extends Equatable {
  const PriceCalculationEvent();

  @override
  List<Object?> get props => [];
}

class CalculatePriceEvent extends PriceCalculationEvent {
  final int tariffId;
  final int fromCityId;
  final int toCityId;
  final String toPhone;

  const CalculatePriceEvent({
    required this.tariffId,
    required this.fromCityId,
    required this.toCityId,
    required this.toPhone,
  });

  @override
  List<Object?> get props => [tariffId, fromCityId, toCityId, toPhone];
}

class ResetPriceCalculationEvent extends PriceCalculationEvent {
  const ResetPriceCalculationEvent();
}

abstract class PriceCalculationState extends Equatable {
  const PriceCalculationState();

  @override
  List<Object?> get props => [];
}

class PriceCalculationInitial extends PriceCalculationState {
  const PriceCalculationInitial();
}

class PriceCalculationLoading extends PriceCalculationState {
  const PriceCalculationLoading();
}

class PriceCalculationLoaded extends PriceCalculationState {
  final PriceCalculationEntity priceCalculation;

  const PriceCalculationLoaded({required this.priceCalculation});

  @override
  List<Object?> get props => [priceCalculation];
}

class PriceCalculationError extends PriceCalculationState {
  final String message;

  const PriceCalculationError(this.message);

  @override
  List<Object?> get props => [message];
}

class PriceCalculationBloc
    extends Bloc<PriceCalculationEvent, PriceCalculationState> {
  final CalculateOrderPriceUseCase _calculateOrderPriceUseCase;

  PriceCalculationBloc({
    required CalculateOrderPriceUseCase calculateOrderPriceUseCase,
  })  : _calculateOrderPriceUseCase = calculateOrderPriceUseCase,
        super(const PriceCalculationInitial()) {
    on<CalculatePriceEvent>(_onCalculatePrice);
    on<ResetPriceCalculationEvent>(_onResetPriceCalculation);
  }

  Future<void> _onCalculatePrice(
    CalculatePriceEvent event,
    Emitter<PriceCalculationState> emit,
  ) async {
    emit(const PriceCalculationLoading());
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
    emit(const PriceCalculationInitial());
  }
}
