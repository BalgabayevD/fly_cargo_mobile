import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/accumulator/domain/repositories/accumulator_rest_repository.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_scan_event.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_scan_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AccumulatorScanBloc
    extends Bloc<AccumulatorScanEvent, AccumulatorScanState> {
  final AccumulatorRestRepository _repository;

  AccumulatorScanBloc(this._repository) : super(AccumulatorScanInitialState()) {
    on<AccumulatorScanIdentificationEvent>(_onScanIdentification);
    on<AccumulatorScanResetEvent>(_onReset);
  }

  Future<void> _onScanIdentification(
    AccumulatorScanIdentificationEvent event,
    Emitter<AccumulatorScanState> emit,
  ) async {
    emit(AccumulatorScanLoadingState());

    try {
      final accumulator = await _repository.getByIdentification(
        event.identification,
      );

      if (accumulator != null) {
        emit(AccumulatorScanSuccessState(accumulator));
      } else {
        emit(AccumulatorScanErrorState('Накопитель не найден'));
      }
    } catch (e) {
      emit(AccumulatorScanErrorState('Ошибка при получении накопителя'));
    }
  }

  void _onReset(
    AccumulatorScanResetEvent event,
    Emitter<AccumulatorScanState> emit,
  ) {
    emit(AccumulatorScanInitialState());
  }
}
