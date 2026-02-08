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
    emit(AccumulatorScanScannedState());

    try {
      await _repository.arrived(event.identification);
      emit(AccumulatorScanSuccessState());
    } catch (e) {
      emit(AccumulatorScanErrorState('Ошибка при обработке накопителя'));
    }
  }

  void _onReset(
    AccumulatorScanResetEvent event,
    Emitter<AccumulatorScanState> emit,
  ) {
    emit(AccumulatorScanInitialState());
  }
}
