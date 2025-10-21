import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/tariffs/domain/usecases/get_tariff_categories_usecase.dart';
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_event.dart';
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class TariffsBloc extends Bloc<TariffsEvent, TariffsState> {
  final GetTariffCategoriesUseCase _getTariffCategoriesUseCase;

  TariffsBloc(this._getTariffCategoriesUseCase)
    : super(const TariffsInitial()) {
    on<LoadTariffCategoriesEvent>(_onLoadTariffCategories);
    on<ResetTariffsEvent>(_onResetTariffs);
  }

  Future<void> _onLoadTariffCategories(
    LoadTariffCategoriesEvent event,
    Emitter<TariffsState> emit,
  ) async {
    emit(const TariffsLoading());

    try {
      final categories = await _getTariffCategoriesUseCase();
      emit(TariffsLoaded(categories: categories));
    } catch (e) {
      emit(TariffsError(message: e.toString()));
    }
  }

  void _onResetTariffs(ResetTariffsEvent event, Emitter<TariffsState> emit) {
    emit(const TariffsInitial());
  }
}
