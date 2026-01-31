import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/accumulator/domain/repositories/accumulator_rest_repository.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_list_event.dart';
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AccumulatorListBloc
    extends Bloc<AccumulatorListEvent, AccumulatorListState> {
  final AccumulatorRestRepository _repository;

  AccumulatorListBloc(this._repository) : super(AccumulatorListInitialState()) {
    on<AccumulatorListLoadEvent>(_onLoad);
    on<AccumulatorListRefreshEvent>(_onRefresh);
  }

  Future<void> _onLoad(
    AccumulatorListLoadEvent event,
    Emitter<AccumulatorListState> emit,
  ) async {
    emit(AccumulatorListLoadingState());
    await _loadAccumulators(emit);
  }

  Future<void> _onRefresh(
    AccumulatorListRefreshEvent event,
    Emitter<AccumulatorListState> emit,
  ) async {
    await _loadAccumulators(emit);
  }

  Future<void> _loadAccumulators(Emitter<AccumulatorListState> emit) async {
    try {
      final accumulators = await _repository.getAll();

      if (accumulators.isEmpty) {
        emit(AccumulatorListEmptyState());
      } else {
        emit(AccumulatorListLoadedState(accumulators));
      }
    } catch (e) {
      emit(AccumulatorListErrorState('Ошибка загрузки накопителей'));
    }
  }
}
