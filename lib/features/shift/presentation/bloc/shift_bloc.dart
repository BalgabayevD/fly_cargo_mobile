import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/shift/domain/usecases/close_shift_use_case.dart';
import 'package:fly_cargo/features/shift/domain/usecases/get_shift_status_use_case.dart';
import 'package:fly_cargo/features/shift/domain/usecases/open_shift_use_case.dart';
import 'package:fly_cargo/features/shift/presentation/bloc/shift_event.dart';
import 'package:fly_cargo/features/shift/presentation/bloc/shift_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final GetShiftStatusUseCase _getStatus;
  final OpenShiftUseCase _openShift;
  final CloseShiftUseCase _closeShift;

  ShiftBloc(this._getStatus, this._openShift, this._closeShift)
      : super(ShiftInitialState()) {
    on<ShiftLoadStatusEvent>(_onLoadStatus);
    on<ShiftOpenEvent>(_onOpen);
    on<ShiftCloseEvent>(_onClose);
  }

  Future<void> _onLoadStatus(
    ShiftLoadStatusEvent event,
    Emitter<ShiftState> emit,
  ) async {
    emit(ShiftLoadingState());
    try {
      final shift = await _getStatus();
      emit(ShiftLoadedState(shift));
    } catch (_) {
      emit(ShiftErrorState('Не удалось загрузить статус смены'));
    }
  }

  Future<void> _onOpen(
    ShiftOpenEvent event,
    Emitter<ShiftState> emit,
  ) async {
    final current = state;
    if (current is ShiftLoadedState) {
      emit(ShiftActionInProgressState(current.shift));
    }
    try {
      final shift = await _openShift();
      emit(ShiftLoadedState(shift));
    } catch (_) {
      emit(ShiftErrorState('Не удалось открыть смену'));
    }
  }

  Future<void> _onClose(
    ShiftCloseEvent event,
    Emitter<ShiftState> emit,
  ) async {
    final current = state;
    if (current is ShiftLoadedState) {
      emit(ShiftActionInProgressState(current.shift));
    }
    try {
      final shift = await _closeShift();
      emit(ShiftLoadedState(shift));
    } catch (_) {
      emit(ShiftErrorState('Не удалось закрыть смену'));
    }
  }
}
